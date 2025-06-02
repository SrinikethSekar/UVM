class full_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(full_scoreboard)
  uvm_analysis_imp#(full_seq_item,full_scoreboard)item_collected_export;
  
  full_seq_item tx_q[$];
  
  function new(string name="full_scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
 	
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export",this);
  endfunction
  
virtual function void write(full_seq_item tx);

  bit expected_sum   = tx.a ^ tx.b ^ tx.c;
  bit expected_carry = (tx.a & tx.b) | (tx.b & tx.c) | (tx.a & tx.c);

  if ((tx.sum !== expected_sum) || (tx.carry !== expected_carry)) begin
    `uvm_error("Scoreboard", $sformatf("Mismatch : a=%b b=%b c=%b | Expected: sum=%b carry=%b, Got: sum=%b carry=%b", tx.a, tx.b, tx.c, expected_sum, expected_carry, tx.sum, tx.carry))
  end else begin
    `uvm_info("Scoreboard", $sformatf("PASSED : A=%b B=%b C=%b SUM=%b CARRY=%b", tx.a, tx.b, tx.c, tx.sum, tx.carry), UVM_LOW)
  end

endfunction

    
    
    
endclass
