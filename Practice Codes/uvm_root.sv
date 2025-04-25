`include "uvm_macros.svh"
import uvm_pkg::*;


class my_comp extends uvm_component;

	bit [3:0] a;

	function new(string name="my_comp",uvm_component parent);
		super.new(name,null);
		`uvm_info("NEW","creating my_comp",UVM_LOW)
	endfunction

	function void display();
		for(int i=0; i<3; i++)begin
		       	 a=$urandom();
			`uvm_info("Randomizing",$sformatf("a:%0d",a),UVM_LOW)
	                `uvm_info("STAT",$sformatf("Randomize success"),UVM_LOW)
		
		end
	endfunction

endclass

module tb();

	my_comp mc;

	initial begin
		
		mc=new("mc",null);
		mc.display();

	end

endmodule

//UVM_INFO testbench.sv(11) @ 0: mc [NEW] creating my_comp
//UVM_INFO testbench.sv(17) @ 0: mc [Randomizing] a:6
//UVM_INFO testbench.sv(18) @ 0: mc [STAT] Randomize success
//UVM_INFO testbench.sv(17) @ 0: mc [Randomizing] a:4
//UVM_INFO testbench.sv(18) @ 0: mc [STAT] Randomize success
//UVM_INFO testbench.sv(17) @ 0: mc [Randomizing] a:3
//UVM_INFO testbench.sv(18) @ 0: mc [STAT] Randomize success
