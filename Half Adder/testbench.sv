//https://edaplayground.com/x/XuCx
`timescale 1ns/1ns

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"


module testbench;

	int_if intf();
  
   // half_test tt();

	half_adder dut(
      .a(intf.a),		
		.b(intf.b),			
		.sum(intf.sum),	
		.carry(intf.carry)		
	);
  
  initial begin
    
    uvm_config_db#(virtual int_if)::set(null,"*","vif",intf); //set(<null or root>,"<menitioning of where are we using>","<key>",<instance name>)
    
  end
  
  initial begin
    
    run_test("half_test");

  end
  
    initial begin
    
      $dumpfile("dump.vcd");
      $dumpvars;
  end
      initial begin

        #500;
        $finish;
  end
  
  
  
endmodule
