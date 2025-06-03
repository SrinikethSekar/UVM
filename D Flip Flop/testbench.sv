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
  
  logic clk;
  
  d_int inst();
  
  d_flip_flop dut(
    .clk  (inst.clk),
    .rst  (inst.rst),
    .d    (inst.d  ),
    .q    (inst.q  ),
    .q_b  (inst.q_b)
  );
  
  assign inst.clk = clk;
  
  initial clk =0;
  always #5 clk = ~clk;
  
  initial begin
    
    uvm_config_db#(virtual d_int)::set(null,"","vif",inst);
    
  end
  
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
  initial begin
    
    run_test("d_test");
    
  end
  
  initial begin
    #500;
    $finish;
  end
  
endmodule
