class full_env extends uvm_env;
  
  `uvm_component_utils(full_env)
  
    full_agent      agt;
    full_scoreboard scr;
    
    function new(string name="full_env", uvm_component parent);
    	super.new(name,parent);
    
  	endfunction
    
    //build phase
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      agt = full_agent::type_id::create("agt",this);
      scr = full_scoreboard::type_id::create("scr",this);
      
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      
      //connecting driver sequence using TLM ports
      agt.mon.item_collected_port.connect(scr.item_collected_export);
    endfunction
  
endclass
