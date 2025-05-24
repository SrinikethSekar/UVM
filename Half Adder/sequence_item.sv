//uvm object
class half_seq_item extends uvm_sequence_item;

	`uvm_object_utils(half_seq_item)
  
  randc bit[1:0]ab;
   bit a;
   bit b;
  bit sum;
  bit carry;
  
  function void post_randomize();
    a = ab[1];
    b = ab[0];
  endfunction
  

	function new(string name="half_seq_item");
		super.new(name);
// 		`uvm_info("Seq_item Class","Constructor",UVM_MEDIUM)
	endfunction
  
  //no phases

endclass
