class full_sequence extends uvm_sequence;
  
  `uvm_object_utils(full_sequence)
  
  full_seq_item tx;
  
  function new(string name="full_sequence");
    super.new(name);
    
  endfunction
	
  task body();
    repeat(15)begin
      
      tx = full_seq_item :: type_id :: create("tx");
	  `uvm_do(tx)
//       start_item(tx);
//       if(!tx.randomize())begin
//         `uvm_error("seq","Randomization Failed")
//       end
//       tx.post_randomize();
//       finish_item(tx);
      
    end
    
  endtask
	  
endclass
