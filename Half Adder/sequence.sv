//uvm object class
class half_sequence extends uvm_sequence;

	`uvm_object_utils(half_sequence)
  
  half_seq_item tx;

	function new(string name="half_sequence");
		super.new(name);
		//`uvm_info("Sequence Class","Constructor",UVM_MEDIUM)
	endfunction
  
  //no phases it will work in the run time , because it gives only input to the dut
  
  task body();
    repeat(4)begin
      tx = half_seq_item :: type_id :: create("tx");
      
      start_item(tx);
      if(!tx.randomize())begin
        `uvm_error("SEQ","Randomization Failed!")
      end
      tx.post_randomize();
      finish_item(tx);
    end
      
  endtask

endclass
