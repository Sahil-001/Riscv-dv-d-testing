// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`include "uvm_macros.svh"

// The top module that contains the DUT and interface.
// This module starts the test.
module testtb;
  import uvm_pkg::*;
  
    typedef enum bit [3:0] {
    BARE = 4'b0000,
    SV32 = 4'b0001,
    SV39 = 4'b1000,
    SV48 = 4'b1001,
    SV57 = 4'b1010,
    SV64 = 4'b1011
  } satp_mode_t;


    typedef enum bit [4:0] {
    RV32I,
    RV64I,
    RV32M,
    RV64M,
    RV32A,
    RV64A,
    RV32F,
    RV32FC,
    RV64F,
    RV32D,
    RV32DC,
    RV64D,
    RV32C,
    RV64C,
    RV128I,
    RV128C,
    RVV,
    RV32B,
    RV64B,
    RV32X,
    RV64X
  } riscv_instr_group_t;

  class Bar extends uvm_object;

  riscv_instr_group_t supported_isa[$] = {RV32I, RV32M, RV64I, RV64M, RV32C, RV64C}; 
    
    `uvm_object_utils(Bar);
    function new(string name = "Bar");
      super.new(name);
    endfunction
 
  function void check_setting(int XLEN , satp_mode_t SATP_MODE);
    bit support_64b;
    bit support_128b;
    foreach (supported_isa[i]) begin
      if (supported_isa[i] inside {RV64I, RV64M, RV64A, RV64F, RV64D, RV64C,
                                                    RV64B}) begin
        support_64b = 1'b1;
      end else if (supported_isa[i] inside {RV128I, RV128C}) begin
        support_128b = 1'b1;
      end
    end
    if (support_128b && XLEN != 128) begin
      `uvm_fatal(get_type_name(), "XLEN should be set to 128 based on riscv_instr_pkg::supported_isa setting")
    end
    if (!support_128b && support_64b && XLEN != 64) begin
      `uvm_fatal(get_type_name(), "XLEN should be set to 64 based on riscv_instr_pkg::supported_isa setting")
    end
    if (!(support_128b || support_64b) && XLEN != 32) begin
      `uvm_fatal(get_type_name(), "XLEN should be set to 32 based on riscv_instr_pkg::supported_isa setting")
    end
    if (!(support_128b || support_64b) && !(SATP_MODE inside {SV32, BARE})) begin
      `uvm_fatal(get_type_name(), $sformatf("SATP mode %0s is not supported for RV32G ISA", SATP_MODE.name()))
    end
  endfunction // check_setting
   
endclass // bar
  
   initial begin
     Bar b1;
     b1 = Bar::type_id::create("b1");
     b1.check_setting(32,SV64);
   end
  
  
endmodule // testtb
