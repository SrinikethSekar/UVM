`include "uvm_macros.svh"
import uvm_pkg::*;


class example extends uvm_object;
   int a[3];
   string b;
   bit [2:0]c;

   `uvm_object_utils_begin(example)
   `uvm_field_sarray_int(a, UVM_DEFAULT)
   `uvm_field_string(b, UVM_DEFAULT)
   `uvm_field_int(c, UVM_DEFAULT)
   `uvm_object_utils_end

   function new(string name="example");
      super.new(name);
      this.a={1,2,3};
      this.b="HELLO";
      this.c=4;
   endfunction

endclass

class test extends uvm_test;
   
   `uvm_component_utils(test)

   function new(string name="test", uvm_component parent=null);
      super.new(name,parent);
   endfunction

   function void build;
      example Ex = example::type_id::create("Ex");
      Ex.print();
   endfunction

endclass

module uvm_object_print_tb;
   test t;
   initial begin
      t=test::type_id::create("t",null);
      t.build();
   end
endmodule
  
// ----------------------------------
// Name     Type          Size  Value
// ----------------------------------
// Ex       example       -     @1837
//   a      sa(integral)  3     -    
//     [0]  integral      32    'h1  
//     [1]  integral      32    'h2  
//     [2]  integral      32    'h3  
//   b      string        5     HELLO
//   c      integral      3     'h4  
// ----------------------------------
