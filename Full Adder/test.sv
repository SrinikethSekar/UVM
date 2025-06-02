class full_test extends uvm_test;
  
  `uvm_component_utils(full_test)
  
  full_sequence    seq;
  full_env env;
  
  function new(string name="full_test", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env = full_env::type_id::create("env",this);  // pointer like stucture in uvm factory methods (construction of object handle)
    seq = full_sequence::type_id::create("seq",this);
    
  endfunction
  
  //no connect phase needed
  //end of eloboration
  function void end_of_elaboration();
    print();
  endfunction;
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    
    repeat(15)begin
      seq.start(env.agt.seqr);
      #5;
    end
    
    phase.drop_objection(this);
    
  endtask
    
  
endclass
