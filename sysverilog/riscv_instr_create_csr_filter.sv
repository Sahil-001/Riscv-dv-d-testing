// Code your testbench here
// or browse Examples
module testtb;

     typedef enum bit [11:0] {
    // User mode register
    USTATUS         = 'h000,  // User status
    UIE             = 'h004,  // User interrupt-enable register
    UTVEC           = 'h005,  // User trap-handler base address
    USCRATCH        = 'h040,  // Scratch register for user trap handlers
    UEPC            = 'h041,  // User exception program counter
    UCAUSE          = 'h042,  // User trap cause
    UTVAL           = 'h043,  // User bad address or instruction
    UIP             = 'h044,  // User interrupt pending
    FFLAGS          = 'h001,  // Floating-Point Accrued Exceptions
    FRM             = 'h002,  // Floating-Point Dynamic Rounding Mode
    FCSR            = 'h003,  // Floating-Point Control/Status Register (FRM + FFLAGS)
    CYCLE           = 'hC00,  // Cycle counter for RDCYCLE instruction
    TIME            = 'hC01,  // Timer for RDTIME instruction
    INSTRET         = 'hC02,  // Instructions-retired counter for RDINSTRET instruction
    HPMCOUNTER3     = 'hC03,  // Performance-monitoring counter
    HPMCOUNTER4     = 'hC04,  // Performance-monitoring counter
    HPMCOUNTER5     = 'hC05,  // Performance-monitoring counter
    HPMCOUNTER6     = 'hC06,  // Performance-monitoring counter
    HPMCOUNTER7     = 'hC07,  // Performance-monitoring counter
    HPMCOUNTER8     = 'hC08,  // Performance-monitoring counter
    HPMCOUNTER9     = 'hC09,  // Performance-monitoring counter
    HPMCOUNTER10    = 'hC0A,  // Performance-monitoring counter
    HPMCOUNTER11    = 'hC0B,  // Performance-monitoring counter
    HPMCOUNTER12    = 'hC0C,  // Performance-monitoring counter
    HPMCOUNTER13    = 'hC0D,  // Performance-monitoring counter
    HPMCOUNTER14    = 'hC0E,  // Performance-monitoring counter
    HPMCOUNTER15    = 'hC0F,  // Performance-monitoring counter
    HPMCOUNTER16    = 'hC10,  // Performance-monitoring counter
    HPMCOUNTER17    = 'hC11,  // Performance-monitoring counter
    HPMCOUNTER18    = 'hC12,  // Performance-monitoring counter
    HPMCOUNTER19    = 'hC13,  // Performance-monitoring counter
    HPMCOUNTER20    = 'hC14,  // Performance-monitoring counter
    HPMCOUNTER21    = 'hC15,  // Performance-monitoring counter
    HPMCOUNTER22    = 'hC16,  // Performance-monitoring counter
    HPMCOUNTER23    = 'hC17,  // Performance-monitoring counter
    HPMCOUNTER24    = 'hC18,  // Performance-monitoring counter
    HPMCOUNTER25    = 'hC19,  // Performance-monitoring counter
    HPMCOUNTER26    = 'hC1A,  // Performance-monitoring counter
    HPMCOUNTER27    = 'hC1B,  // Performance-monitoring counter
    HPMCOUNTER28    = 'hC1C,  // Performance-monitoring counter
    HPMCOUNTER29    = 'hC1D,  // Performance-monitoring counter
    HPMCOUNTER30    = 'hC1E,  // Performance-monitoring counter
    HPMCOUNTER31    = 'hC1F,  // Performance-monitoring counter
    CYCLEH          = 'hC80,  // Upper 32 bits of CYCLE, RV32I only
    TIMEH           = 'hC81,  // Upper 32 bits of TIME, RV32I only
    INSTRETH        = 'hC82,  // Upper 32 bits of INSTRET, RV32I only
    HPMCOUNTER3H    = 'hC83,  // Upper 32 bits of HPMCOUNTER3, RV32I only
    HPMCOUNTER4H    = 'hC84,  // Upper 32 bits of HPMCOUNTER4, RV32I only
    HPMCOUNTER5H    = 'hC85,  // Upper 32 bits of HPMCOUNTER5, RV32I only
    HPMCOUNTER6H    = 'hC86,  // Upper 32 bits of HPMCOUNTER6, RV32I only
    HPMCOUNTER7H    = 'hC87,  // Upper 32 bits of HPMCOUNTER7, RV32I only
    HPMCOUNTER8H    = 'hC88,  // Upper 32 bits of HPMCOUNTER8, RV32I only
    HPMCOUNTER9H    = 'hC89,  // Upper 32 bits of HPMCOUNTER9, RV32I only
    HPMCOUNTER10H   = 'hC8A,  // Upper 32 bits of HPMCOUNTER10, RV32I only
    HPMCOUNTER11H   = 'hC8B,  // Upper 32 bits of HPMCOUNTER11, RV32I only
    HPMCOUNTER12H   = 'hC8C,  // Upper 32 bits of HPMCOUNTER12, RV32I only
    HPMCOUNTER13H   = 'hC8D,  // Upper 32 bits of HPMCOUNTER13, RV32I only
    HPMCOUNTER14H   = 'hC8E,  // Upper 32 bits of HPMCOUNTER14, RV32I only
    HPMCOUNTER15H   = 'hC8F,  // Upper 32 bits of HPMCOUNTER15, RV32I only
    HPMCOUNTER16H   = 'hC90,  // Upper 32 bits of HPMCOUNTER16, RV32I only
    HPMCOUNTER17H   = 'hC91,  // Upper 32 bits of HPMCOUNTER17, RV32I only
    HPMCOUNTER18H   = 'hC92,  // Upper 32 bits of HPMCOUNTER18, RV32I only
    HPMCOUNTER19H   = 'hC93,  // Upper 32 bits of HPMCOUNTER19, RV32I only
    HPMCOUNTER20H   = 'hC94,  // Upper 32 bits of HPMCOUNTER20, RV32I only
    HPMCOUNTER21H   = 'hC95,  // Upper 32 bits of HPMCOUNTER21, RV32I only
    HPMCOUNTER22H   = 'hC96,  // Upper 32 bits of HPMCOUNTER22, RV32I only
    HPMCOUNTER23H   = 'hC97,  // Upper 32 bits of HPMCOUNTER23, RV32I only
    HPMCOUNTER24H   = 'hC98,  // Upper 32 bits of HPMCOUNTER24, RV32I only
    HPMCOUNTER25H   = 'hC99,  // Upper 32 bits of HPMCOUNTER25, RV32I only
    HPMCOUNTER26H   = 'hC9A,  // Upper 32 bits of HPMCOUNTER26, RV32I only
    HPMCOUNTER27H   = 'hC9B,  // Upper 32 bits of HPMCOUNTER27, RV32I only
    HPMCOUNTER28H   = 'hC9C,  // Upper 32 bits of HPMCOUNTER28, RV32I only
    HPMCOUNTER29H   = 'hC9D,  // Upper 32 bits of HPMCOUNTER29, RV32I only
    HPMCOUNTER30H   = 'hC9E,  // Upper 32 bits of HPMCOUNTER30, RV32I only
    HPMCOUNTER31H   = 'hC9F,  // Upper 32 bits of HPMCOUNTER31, RV32I only
    // Supervisor mode register
    SSTATUS         = 'h100,  // Supervisor status
    SEDELEG         = 'h102,  // Supervisor exception delegation register
    SIDELEG         = 'h103,  // Supervisor interrupt delegation register
    SIE             = 'h104,  // Supervisor interrupt-enable register
    STVEC           = 'h105,  // Supervisor trap-handler base address
    SCOUNTEREN      = 'h106,  // Supervisor counter enable
    SSCRATCH        = 'h140,  // Scratch register for supervisor trap handlers
    SEPC            = 'h141,  // Supervisor exception program counter
    SCAUSE          = 'h142,  // Supervisor trap cause
    STVAL           = 'h143,  // Supervisor bad address or instruction
    SIP             = 'h144,  // Supervisor interrupt pending
    SATP            = 'h180,  // Supervisor address translation and protection
    // Machine mode register
    MVENDORID       = 'hF11,  // Vendor ID
    MARCHID         = 'hF12,  // Architecture ID
    MIMPID          = 'hF13,  // Implementation ID
    MHARTID         = 'hF14,  // Hardware thread ID
    MSTATUS         = 'h300,  // Machine status
    MISA            = 'h301,  // ISA and extensions
    MEDELEG         = 'h302,  // Machine exception delegation register
    MIDELEG         = 'h303,  // Machine interrupt delegation register
    MIE             = 'h304,  // Machine interrupt-enable register
    MTVEC           = 'h305,  // Machine trap-handler base address
    MCOUNTEREN      = 'h306,  // Machine counter enable
    MSCRATCH        = 'h340,  // Scratch register for machine trap handlers
    MEPC            = 'h341,  // Machine exception program counter
    MCAUSE          = 'h342,  // Machine trap cause
    MTVAL           = 'h343,  // Machine bad address or instruction
    MIP             = 'h344,  // Machine interrupt pending
    PMPCFG0         = 'h3A0,  // Physical memory protection configuration
    PMPCFG1         = 'h3A1,  // Physical memory protection configuration, RV32 only
    PMPCFG2         = 'h3A2,  // Physical memory protection configuration
    PMPCFG3         = 'h3A3,  // Physical memory protection configuration, RV32 only
    PMPADDR0        = 'h3B0,  // Physical memory protection address register
    PMPADDR1        = 'h3B1,  // Physical memory protection address register
    PMPADDR2        = 'h3B2,  // Physical memory protection address register
    PMPADDR3        = 'h3B3,  // Physical memory protection address register
    PMPADDR4        = 'h3B4,  // Physical memory protection address register
    PMPADDR5        = 'h3B5,  // Physical memory protection address register
    PMPADDR6        = 'h3B6,  // Physical memory protection address register
    PMPADDR7        = 'h3B7,  // Physical memory protection address register
    PMPADDR8        = 'h3B8,  // Physical memory protection address register
    PMPADDR9        = 'h3B9,  // Physical memory protection address register
    PMPADDR10       = 'h3BA,  // Physical memory protection address register
    PMPADDR11       = 'h3BB,  // Physical memory protection address register
    PMPADDR12       = 'h3BC,  // Physical memory protection address register
    PMPADDR13       = 'h3BD,  // Physical memory protection address register
    PMPADDR14       = 'h3BE,  // Physical memory protection address register
    PMPADDR15       = 'h3BF,  // Physical memory protection address register
    MCYCLE          = 'hB00,  // Machine cycle counter
    MINSTRET        = 'hB02,  // Machine instructions-retired counter
    MHPMCOUNTER3    = 'hB03,  // Machine performance-monitoring counter
    MHPMCOUNTER4    = 'hB04,  // Machine performance-monitoring counter
    MHPMCOUNTER5    = 'hB05,  // Machine performance-monitoring counter
    MHPMCOUNTER6    = 'hB06,  // Machine performance-monitoring counter
    MHPMCOUNTER7    = 'hB07,  // Machine performance-monitoring counter
    MHPMCOUNTER8    = 'hB08,  // Machine performance-monitoring counter
    MHPMCOUNTER9    = 'hB09,  // Machine performance-monitoring counter
    MHPMCOUNTER10   = 'hB0A,  // Machine performance-monitoring counter
    MHPMCOUNTER11   = 'hB0B,  // Machine performance-monitoring counter
    MHPMCOUNTER12   = 'hB0C,  // Machine performance-monitoring counter
    MHPMCOUNTER13   = 'hB0D,  // Machine performance-monitoring counter
    MHPMCOUNTER14   = 'hB0E,  // Machine performance-monitoring counter
    MHPMCOUNTER15   = 'hB0F,  // Machine performance-monitoring counter
    MHPMCOUNTER16   = 'hB10,  // Machine performance-monitoring counter
    MHPMCOUNTER17   = 'hB11,  // Machine performance-monitoring counter
    MHPMCOUNTER18   = 'hB12,  // Machine performance-monitoring counter
    MHPMCOUNTER19   = 'hB13,  // Machine performance-monitoring counter
    MHPMCOUNTER20   = 'hB14,  // Machine performance-monitoring counter
    MHPMCOUNTER21   = 'hB15,  // Machine performance-monitoring counter
    MHPMCOUNTER22   = 'hB16,  // Machine performance-monitoring counter
    MHPMCOUNTER23   = 'hB17,  // Machine performance-monitoring counter
    MHPMCOUNTER24   = 'hB18,  // Machine performance-monitoring counter
    MHPMCOUNTER25   = 'hB19,  // Machine performance-monitoring counter
    MHPMCOUNTER26   = 'hB1A,  // Machine performance-monitoring counter
    MHPMCOUNTER27   = 'hB1B,  // Machine performance-monitoring counter
    MHPMCOUNTER28   = 'hB1C,  // Machine performance-monitoring counter
    MHPMCOUNTER29   = 'hB1D,  // Machine performance-monitoring counter
    MHPMCOUNTER30   = 'hB1E,  // Machine performance-monitoring counter
    MHPMCOUNTER31   = 'hB1F,  // Machine performance-monitoring counter
    MCYCLEH         = 'hB80,  // Upper 32 bits of MCYCLE, RV32I only
    MINSTRETH       = 'hB82,  // Upper 32 bits of MINSTRET, RV32I only
    MHPMCOUNTER3H   = 'hB83,  // Upper 32 bits of HPMCOUNTER3, RV32I only
    MHPMCOUNTER4H   = 'hB84,  // Upper 32 bits of HPMCOUNTER4, RV32I only
    MHPMCOUNTER5H   = 'hB85,  // Upper 32 bits of HPMCOUNTER5, RV32I only
    MHPMCOUNTER6H   = 'hB86,  // Upper 32 bits of HPMCOUNTER6, RV32I only
    MHPMCOUNTER7H   = 'hB87,  // Upper 32 bits of HPMCOUNTER7, RV32I only
    MHPMCOUNTER8H   = 'hB88,  // Upper 32 bits of HPMCOUNTER8, RV32I only
    MHPMCOUNTER9H   = 'hB89,  // Upper 32 bits of HPMCOUNTER9, RV32I only
    MHPMCOUNTER10H  = 'hB8A,  // Upper 32 bits of HPMCOUNTER10, RV32I only
    MHPMCOUNTER11H  = 'hB8B,  // Upper 32 bits of HPMCOUNTER11, RV32I only
    MHPMCOUNTER12H  = 'hB8C,  // Upper 32 bits of HPMCOUNTER12, RV32I only
    MHPMCOUNTER13H  = 'hB8D,  // Upper 32 bits of HPMCOUNTER13, RV32I only
    MHPMCOUNTER14H  = 'hB8E,  // Upper 32 bits of HPMCOUNTER14, RV32I only
    MHPMCOUNTER15H  = 'hB8F,  // Upper 32 bits of HPMCOUNTER15, RV32I only
    MHPMCOUNTER16H  = 'hB90,  // Upper 32 bits of HPMCOUNTER16, RV32I only
    MHPMCOUNTER17H  = 'hB91,  // Upper 32 bits of HPMCOUNTER17, RV32I only
    MHPMCOUNTER18H  = 'hB92,  // Upper 32 bits of HPMCOUNTER18, RV32I only
    MHPMCOUNTER19H  = 'hB93,  // Upper 32 bits of HPMCOUNTER19, RV32I only
    MHPMCOUNTER20H  = 'hB94,  // Upper 32 bits of HPMCOUNTER20, RV32I only
    MHPMCOUNTER21H  = 'hB95,  // Upper 32 bits of HPMCOUNTER21, RV32I only
    MHPMCOUNTER22H  = 'hB96,  // Upper 32 bits of HPMCOUNTER22, RV32I only
    MHPMCOUNTER23H  = 'hB97,  // Upper 32 bits of HPMCOUNTER23, RV32I only
    MHPMCOUNTER24H  = 'hB98,  // Upper 32 bits of HPMCOUNTER24, RV32I only
    MHPMCOUNTER25H  = 'hB99,  // Upper 32 bits of HPMCOUNTER25, RV32I only
    MHPMCOUNTER26H  = 'hB9A,  // Upper 32 bits of HPMCOUNTER26, RV32I only
    MHPMCOUNTER27H  = 'hB9B,  // Upper 32 bits of HPMCOUNTER27, RV32I only
    MHPMCOUNTER28H  = 'hB9C,  // Upper 32 bits of HPMCOUNTER28, RV32I only
    MHPMCOUNTER29H  = 'hB9D,  // Upper 32 bits of HPMCOUNTER29, RV32I only
    MHPMCOUNTER30H  = 'hB9E,  // Upper 32 bits of HPMCOUNTER30, RV32I only
    MHPMCOUNTER31H  = 'hB9F,  // Upper 32 bits of HPMCOUNTER31, RV32I only
    MCOUNTINHIBIT   = 'h320,  // Machine counter-inhibit register
    MHPMEVENT3      = 'h323,  // Machine performance-monitoring event selector
    MHPMEVENT4      = 'h324,  // Machine performance-monitoring event selector
    MHPMEVENT5      = 'h325,  // Machine performance-monitoring event selector
    MHPMEVENT6      = 'h326,  // Machine performance-monitoring event selector
    MHPMEVENT7      = 'h327,  // Machine performance-monitoring event selector
    MHPMEVENT8      = 'h328,  // Machine performance-monitoring event selector
    MHPMEVENT9      = 'h329,  // Machine performance-monitoring event selector
    MHPMEVENT10     = 'h32A,  // Machine performance-monitoring event selector
    MHPMEVENT11     = 'h32B,  // Machine performance-monitoring event selector
    MHPMEVENT12     = 'h32C,  // Machine performance-monitoring event selector
    MHPMEVENT13     = 'h32D,  // Machine performance-monitoring event selector
    MHPMEVENT14     = 'h32E,  // Machine performance-monitoring event selector
    MHPMEVENT15     = 'h32F,  // Machine performance-monitoring event selector
    MHPMEVENT16     = 'h330,  // Machine performance-monitoring event selector
    MHPMEVENT17     = 'h331,  // Machine performance-monitoring event selector
    MHPMEVENT18     = 'h332,  // Machine performance-monitoring event selector
    MHPMEVENT19     = 'h333,  // Machine performance-monitoring event selector
    MHPMEVENT20     = 'h334,  // Machine performance-monitoring event selector
    MHPMEVENT21     = 'h335,  // Machine performance-monitoring event selector
    MHPMEVENT22     = 'h336,  // Machine performance-monitoring event selector
    MHPMEVENT23     = 'h337,  // Machine performance-monitoring event selector
    MHPMEVENT24     = 'h338,  // Machine performance-monitoring event selector
    MHPMEVENT25     = 'h339,  // Machine performance-monitoring event selector
    MHPMEVENT26     = 'h33A,  // Machine performance-monitoring event selector
    MHPMEVENT27     = 'h33B,  // Machine performance-monitoring event selector
    MHPMEVENT28     = 'h33C,  // Machine performance-monitoring event selector
    MHPMEVENT29     = 'h33D,  // Machine performance-monitoring event selector
    MHPMEVENT30     = 'h33E,  // Machine performance-monitoring event selector
    MHPMEVENT31     = 'h33F,  // Machine performance-monitoring event selector
    TSELECT         = 'h7A0,  // Debug/Trace trigger register select
    TDATA1          = 'h7A1,  // First Debug/Trace trigger data register
    TDATA2          = 'h7A2,  // Second Debug/Trace trigger data register
    TDATA3          = 'h7A3,  // Third Debug/Trace trigger data register
    TINFO           = 'h7A4,  // Debug trigger info register
    TCONTROL        = 'h7A5,  // Debug trigger control register
    MCONTEXT        = 'h7A8,  // Machine mode trigger context register
    SCONTEXT        = 'h7AA,  // Supervisor mode trigger context register
    DCSR            = 'h7B0,  // Debug control and status register
    DPC             = 'h7B1,  // Debug PC
    DSCRATCH0       = 'h7B2,  // Debug scratch register
    DSCRATCH1       = 'h7B3,  // Debug scratch register (last one)
    VSTART          = 'h008,  // Vector start position
    VXSTAT          = 'h009,  // Fixed point saturate flag
    VXRM            = 'h00A,  // Fixed point rounding mode
    VL              = 'hC20,  // Vector length
    VTYPE           = 'hC21,  // Vector data type register
    VLENB           = 'hC22   // VLEN/8 (vector register length in bytes)
  } privileged_reg_t;

    typedef enum bit [1:0] {
    USER_MODE       = 2'b00,
    SUPERVISOR_MODE = 2'b01,
    RESERVED_MODE   = 2'b10,
    MACHINE_MODE    = 2'b11
  } privileged_mode_t;

   
class riscv_instr_gen_config;
   bit                    enable_illegal_csr_instruction;
   bit                    enable_access_invalid_csr_level;
   privileged_reg_t       invalid_priv_mode_csrs[$];  
   privileged_mode_t init_privileged_mode;
 endclass
  
class riscv_instr;
   
   static privileged_reg_t    exclude_reg[];
   static privileged_reg_t    include_reg[];
   
   const privileged_reg_t implemented_csr[] = {

    // Machine mode mode CSR
    MVENDORID,  // Vendor ID
    MARCHID,    // Architecture ID
    MIMPID,     // Implementation ID
    MHARTID,    // Hardware thread ID
    MSTATUS,    // Machine status
    MISA,       // ISA and extensions
    MIE,        // Machine interrupt-enable register
    MTVEC,      // Machine trap-handler base address
    MCOUNTEREN, // Machine counter enable
    MSCRATCH,   // Scratch register for machine trap handlers
    MEPC,       // Machine exception program counter
    MCAUSE,     // Machine trap cause
    MTVAL,      // Machine bad address or instruction
    MIP         // Machine interrupt pending
};

    
   
   function void create_csr_filter(riscv_instr_gen_config cfg);
    include_reg.delete();
    exclude_reg.delete();
    if (cfg.enable_illegal_csr_instruction) begin
      exclude_reg = implemented_csr;
    end else if (cfg.enable_access_invalid_csr_level) begin
      include_reg = cfg.invalid_priv_mode_csrs;
    end else begin
      // Use scratch register to avoid the side effect of modifying other privileged mode CSR.
      if (cfg.init_privileged_mode == MACHINE_MODE) begin
        include_reg = {MSCRATCH};
      end else if (cfg.init_privileged_mode == SUPERVISOR_MODE) begin
        include_reg = {SSCRATCH};
      end else begin
        include_reg = {USCRATCH};
      end
    end
     
  endfunction : create_csr_filter
  
  function void display();
    foreach(include_reg[i])
      $display(include_reg[i].name());
    foreach(exclude_reg[i])
      $display(exclude_reg[i].name());
  endfunction
    


   
endclass // riscv_instr

    initial begin
      riscv_instr b1 = new();
       riscv_instr_gen_config cfg = new();
      
       cfg.enable_illegal_csr_instruction = 1;
       cfg.enable_access_invalid_csr_level = 0;
       cfg.init_privileged_mode = MACHINE_MODE;
       
      
       b1.create_csr_filter(cfg);
       b1.display();
   end
  
  
endmodule // testtb
