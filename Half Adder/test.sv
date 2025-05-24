
class half_test extends uvm_test;  //base class of the test

	`uvm_component_utils(half_test)  //registering the class to the uvm factory
	
    half_sequence seq;
  	half_env env;// handle for the environment class
	
  	//standard constructor
	function new(string name="half_test",uvm_component parent);
		super.new(name,parent);
		//`uvm_info("Test Class","constructor",UVM_MEDIUM)
	endfunction
  
  	//build phase
  
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      //lower componnent
      env = half_env::type_id::create("env",this);
      seq = half_sequence::type_id::create("seq",this);
    endfunction
    
 	//connect phase not needed
    //end_of_elaboration

  virtual function void end_of_elaboration();
    `uvm_info("Test class","Eloboration phase",UVM_MEDIUM)
    print();
  endfunction
  
  task run_phase(uvm_phase phase);
   // `uvm_info("Test Class","run_phase",UVM_MEDIUM);
    phase.raise_objection(this);
    
    repeat(4) begin
    seq.start(env.agt.seqr);
      #10;
    end
    
      phase.drop_objection(this);
    
  endtask 
  	
endclass
