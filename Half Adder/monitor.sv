class half_monitor extends uvm_monitor;

	`uvm_component_utils(half_monitor)
    virtual int_if intf;
  	half_seq_item tx;
  	uvm_analysis_port#(half_seq_item)item_collected_port;

	function new(string name="half_monitor",uvm_component parent);
		super.new(name,parent);
		`uvm_info("Monitor Class","Constructor",UVM_MEDIUM)
	endfunction

  	function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      item_collected_port = new("item_collected_port",this);
      `uvm_info("Driver Class","Build phase",UVM_MEDIUM)
      
      if(!uvm_config_db#(virtual int_if)::get(this,"","vif",intf))
        `uvm_fatal("no intf in driver","virtual interface get failed from config db");
    
	endfunction
  
  task run_phase(uvm_phase phase);
    tx = half_seq_item::type_id::create("tx");
    
    mon(tx);
    
  endtask
  
  task mon(half_seq_item tx);
    
    repeat(4) begin
      
    tx.a     = intf.a;
    tx.b     = intf.b;
    tx.sum   = intf.sum;
    tx.carry = intf.carry;
    
     #10;
      
      `uvm_info("mon_task",$sformatf("a = %b b = %b sum = %b carry = %b",tx.a,tx.b,tx.sum,tx.carry),UVM_LOW);

   item_collected_port.write(tx);

    end 
    
  endtask    
    
    
  
endclass
