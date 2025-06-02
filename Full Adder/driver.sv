class full_driver extends uvm_driver#(full_seq_item);
  
  `uvm_component_utils(full_driver)
  
  virtual full_int intf;
  full_seq_item tx;	
  
  function new(string name="full_driver", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual full_int)::get(this,"*","vif",intf))
      `uvm_fatal("No interface in the driver ","Virtual interface get failed in the config db")
     
  endfunction
      
  //run_phase
  task run_phase(uvm_phase phase);
    forever begin
      	
      seq_item_port.get_next_item(tx);
      drive(tx);
      seq_item_port.item_done();
    
    end
  endtask
    
    task drive(full_seq_item tx);
      
      intf.a = tx.a;
	  intf.b = tx.b;
      intf.c = tx.c;
    
      `uvm_info("DRIVE TASK",$sformatf("A=%b B=%b C=%b Sum=%b Carry=%b",intf.a,intf.b,intf.c,intf.sum,intf.carry),UVM_LOW);
     
    endtask
  
  
  
endclass
