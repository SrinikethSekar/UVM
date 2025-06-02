class full_agent extends uvm_agent;
  
  `uvm_component_utils(full_agent)
  
  full_monitor    mon;
  full_driver     drv;
  full_sequencer seqr;
  
  function new(string name="full_agent", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    mon  = full_monitor::type_id::create("mon",this);
    drv  = full_driver::type_id::create("drv",this);
    seqr = full_sequencer::type_id::create("seqr",this);
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  
  
  
endclass
