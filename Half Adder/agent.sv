
class half_agent extends uvm_agent;

  `uvm_component_utils(half_agent)
  
  	half_monitor   mon;
  	half_driver    drv;
  	half_sequencer seqr;

  function new(string name="half_agent",uvm_component parent);
		super.new(name,parent);
    	//`uvm_info("Agent Class","Constructor",UVM_MEDIUM)
	endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //lower component
    
    mon = half_monitor::type_id::create("mon",this);
    drv = half_driver::type_id::create("drv",this);
    seqr = half_sequencer::type_id::create("seqr",this);
    
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Agent Class","Connect Phase",UVM_MEDIUM)
    //connecting driver sequencer using TLM ports
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction

endclass
