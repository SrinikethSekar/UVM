class half_driver extends uvm_driver#(half_seq_item);

	`uvm_component_utils(half_driver)
  
  virtual int_if intf;
  half_seq_item tx;

	function new(string name="half_driver",uvm_component parent);
		super.new(name,parent);
		`uvm_info("Driver Class","Constructor",UVM_MEDIUM)
	endfunction
  	
  	function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info("Driver Class","Build phase",UVM_MEDIUM)
      
      if(!uvm_config_db#(virtual int_if)::get(this,"","vif",intf))
        `uvm_fatal("no intf in driver","virtual interface get failed from config db");
    
	endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
//     `uvm_info("Driver class","Run phase",UVM_MEDIUM)
    
    seq_item_port.get_next_item(tx);
    drive(tx);
    seq_item_port.item_done();
     
    end
    
  endtask
  
  task drive(half_seq_item tx);
    
    intf.a     = tx.a;
    intf.b     = tx.b;

    `uvm_info("drive_task",$sformatf("a = %b b = %b sum = %b carry = %b",intf.a,intf.b,intf.sum,intf.carry),UVM_LOW);

  endtask

endclass
