class d_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(d_seq_item)
  
  //randc bit [1:0]db;
  rand bit d  ;
  rand bit rst;
  bit q  ;
  bit q_b;
  
//   function void post_randomize();
    
//     d   = db[1];
//     rst = db[0];
  
//   endfunction
  
  constraint rst_bit {rst dist {1:= 10, 0:= 90};}
  
  function new(string name="d_Seq_item");
    super.new(name);
  endfunction
  
endclass
