class half_scoreboard extends uvm_scoreboard;

	`uvm_component_utils(half_scoreboard)
  uvm_analysis_imp#(half_seq_item,half_scoreboard)item_collected_export;

  half_seq_item tx_q[$];
  
	function new(string name="half_scoreboard",uvm_component parent);
		super.new(name,parent);
		//`uvm_info("Scoreboard Class","Constructor",UVM_MEDIUM)
	endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export",this);
    
  endfunction
  
  virtual function void write(half_seq_item tx);
    
    bit expected_sum   = tx.a ^ tx.b;
    bit expected_carry = tx.a & tx.b;
    
    if((tx.sum !== expected_sum)||(tx.carry !== expected_carry)) begin
      `uvm_error("Scoreboard",$sformatf("Mismatch : a=%b b=%b | Expected: sum=%b carry =%b,Got: sum =%b carry=%b",tx.a,tx.b,expected_sum,expected_carry,tx.sum,tx.carry))
    end
    else begin
      `uvm_error("Scoreboard",$sformatf("PASSED : A=%b B=%b SUM=%b CARRY=%b",tx.a,tx.b,tx.sum,tx.carry))
    end
    
  endfunction

endclass
