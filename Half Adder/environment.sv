
class half_env extends uvm_env;

	`uvm_component_utils(half_env)
  
  	half_agent      agt;
  	half_scoreboard scr;

	function new(string name="half_env",uvm_component parent);
		super.new(name,parent);
		//`uvm_info("Env Class","Constructor",UVM_MEDIUM)
	endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //lower component
    
    agt = half_agent::type_id::create("agt",this);
    scr = half_scoreboard::type_id::create("scr",this);
  endfunction
  
   //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Env Class","Connect Phase",UVM_MEDIUM)
    //connecting driver sequencer using TLM ports
    agt.mon.item_collected_port.connect(scr.item_collected_export);
  endfunction

endclass
