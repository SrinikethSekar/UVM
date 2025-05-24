
module half_adder(
					input a,b,
          
  				output sum,carry
					
);
  
  assign sum   = a ^ b;  //sum
  
  assign carry = a & b; //carry
  
endmodule
