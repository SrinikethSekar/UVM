class full_monitor extends uvm_monitor;
  
  `uvm_component_utils(full_monitor)
  
  virtual full_int intf;
  full_seq_item tx;
  uvm_analysis_port#(full_seq_item)item_collected_port;
  
  function new(string name="full_monitor", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port = new("item_collected_port",this);
    `uvm_info("Driver Class","Constructor",UVM_LOW)
    
    if(!uvm_config_db#(virtual full_int)::get(this,"","vif",intf))
      `uvm_fatal("No interface in the driver","virtual interface get failed in the config db")
  endfunction
      
  task run_phase(uvm_phase phase);
    tx = full_seq_item :: type_id :: create("tx");
    
    mon(tx);
    
  endtask
    
    task mon(full_seq_item tx);
      
      repeat(15)begin
        
        tx.a     = intf.a;
        tx.b     = intf.b;
        tx.c     = intf.c;
       
        tx.sum   = intf.sum;
        tx.carry = intf.carry;
        #5;
        `uvm_info("Mon_task",$sformatf("A=%b B=%b C=%b Sum=%b Carry=%b",tx.a,tx.b,tx.c,tx.sum,tx.carry),UVM_LOW)
        item_collected_port.write(tx);

      end
      
    endtask
    
  
endclass
