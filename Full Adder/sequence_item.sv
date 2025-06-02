class full_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(full_seq_item)
  
  randc bit[2:0] abc;
  bit a;
  bit b;
  bit c;
  bit sum;
  bit carry;
  
  function void post_randomize();
    a  = abc[2];
    b  = abc[1];
    c  = abc[0];
  endfunction
  
  function new(string name="half_seq_item");
    super.new(name);  
  endfunction
  
  
endclass
