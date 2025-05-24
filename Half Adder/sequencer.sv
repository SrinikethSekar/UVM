class half_sequencer extends uvm_sequencer#(half_seq_item);

	`uvm_component_utils(half_sequencer)

	function new(string name="half_sequencer",uvm_component parent);
		super.new(name,parent);
		`uvm_info("Sequencer Class","Constructor",UVM_MEDIUM)
	endfunction

endclass
