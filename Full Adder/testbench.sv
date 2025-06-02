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

module test_bench;
  
  full_int intf();
  
  full_adder dut(
    .a    (intf.a    ),
    .b    (intf.b    ), 
    .c    (intf.c    ),
    .sum  (intf.sum  ),
    .carry(intf.carry)
  );
  
  
  initial begin
    
    uvm_config_db#(virtual full_int)::set(null,"","vif",intf);
    
  end
  
  initial begin
    
    run_test("full_test");
    
  end
  
  initial begin
    $dumpfile("Waves.vcd");
    $dumpvars;
  end
  
  initial begin
    #5000;
    $finish;
  end
   
  
endmodule
