`include "uvm_macros.svh"
import uvm_pkg::*;

class my_train extends uvm_transaction;

	rand bit[3:0]a;
	constraint c{a>9;}

  function new(string name="my_train");
		super.new(name);
	endfunction
	 
	task display();
		#1 `uvm_info("Randomize",$sformatf("[%0d]a=%0d",$time,a),UVM_LOW)
	endtask

endclass

module tb();

	my_train mc;

	initial begin

		mc=new();
		repeat(3)
		begin
			void'(mc.randomize());
			mc.display();
		end

	end

endmodule

// UVM_INFO testbench.sv(14) @ 1: reporter [Randomize] [1]a=10
// UVM_INFO testbench.sv(14) @ 2: reporter [Randomize] [2]a=10
// UVM_INFO testbench.sv(14) @ 3: reporter [Randomize] [3]a=15
