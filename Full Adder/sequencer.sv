class full_sequencer extends uvm_sequencer#(full_seq_item);
  
  `uvm_component_utils(full_sequencer)
  
  function new(string name="full_sequencer", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
endclass
