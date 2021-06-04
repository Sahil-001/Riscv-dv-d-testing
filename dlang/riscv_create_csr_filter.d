import esdl;
import uvm;
import std.stdio;
import std.string: format;

enum privileged_reg_t: ushort {	// 12'b
  // User mode register
  USTATUS         = 0x000,  // User status
    UIE             = 0x004,  // User interrupt-enable register
    UTVEC           = 0x005,  // User trap-handler base address
    USCRATCH        = 0x040,  // Scratch register for user trap handlers
    UEPC            = 0x041,  // User exception program counter
    UCAUSE          = 0x042,  // User trap cause
    UTVAL           = 0x043,  // User bad address or instruction
    UIP             = 0x044,  // User interrupt pending
    FFLAGS          = 0x001,  // Floating-Point Accrued Exceptions
    FRM             = 0x002,  // Floating-Point Dynamic Rounding Mode
    FCSR            = 0x003,  // Floating-Point Control/Status Register (FRM + FFLAGS)
    CYCLE           = 0xC00,  // Cycle counter for RDCYCLE instruction
    TIME            = 0xC01,  // Timer for RDTIME instruction
    INSTRET         = 0xC02,  // Instructions-retired counter for RDINSTRET instruction
    HPMCOUNTER3     = 0xC03,  // Performance-monitoring counter
    HPMCOUNTER4     = 0xC04,  // Performance-monitoring counter
    HPMCOUNTER5     = 0xC05,  // Performance-monitoring counter
    HPMCOUNTER6     = 0xC06,  // Performance-monitoring counter
    HPMCOUNTER7     = 0xC07,  // Performance-monitoring counter
    HPMCOUNTER8     = 0xC08,  // Performance-monitoring counter
    HPMCOUNTER9     = 0xC09,  // Performance-monitoring counter
    HPMCOUNTER10    = 0xC0A,  // Performance-monitoring counter
    HPMCOUNTER11    = 0xC0B,  // Performance-monitoring counter
    HPMCOUNTER12    = 0xC0C,  // Performance-monitoring counter
    HPMCOUNTER13    = 0xC0D,  // Performance-monitoring counter
    HPMCOUNTER14    = 0xC0E,  // Performance-monitoring counter
    HPMCOUNTER15    = 0xC0F,  // Performance-monitoring counter
    HPMCOUNTER16    = 0xC10,  // Performance-monitoring counter
    HPMCOUNTER17    = 0xC11,  // Performance-monitoring counter
    HPMCOUNTER18    = 0xC12,  // Performance-monitoring counter
    HPMCOUNTER19    = 0xC13,  // Performance-monitoring counter
    HPMCOUNTER20    = 0xC14,  // Performance-monitoring counter
    HPMCOUNTER21    = 0xC15,  // Performance-monitoring counter
    HPMCOUNTER22    = 0xC16,  // Performance-monitoring counter
    HPMCOUNTER23    = 0xC17,  // Performance-monitoring counter
    HPMCOUNTER24    = 0xC18,  // Performance-monitoring counter
    HPMCOUNTER25    = 0xC19,  // Performance-monitoring counter
    HPMCOUNTER26    = 0xC1A,  // Performance-monitoring counter
    HPMCOUNTER27    = 0xC1B,  // Performance-monitoring counter
    HPMCOUNTER28    = 0xC1C,  // Performance-monitoring counter
    HPMCOUNTER29    = 0xC1D,  // Performance-monitoring counter
    HPMCOUNTER30    = 0xC1E,  // Performance-monitoring counter
    HPMCOUNTER31    = 0xC1F,  // Performance-monitoring counter
    CYCLEH          = 0xC80,  // Upper 32 bits of CYCLE, RV32I only
    TIMEH           = 0xC81,  // Upper 32 bits of TIME, RV32I only
    INSTRETH        = 0xC82,  // Upper 32 bits of INSTRET, RV32I only
    HPMCOUNTER3H    = 0xC83,  // Upper 32 bits of HPMCOUNTER3, RV32I only
    HPMCOUNTER4H    = 0xC84,  // Upper 32 bits of HPMCOUNTER4, RV32I only
    HPMCOUNTER5H    = 0xC85,  // Upper 32 bits of HPMCOUNTER5, RV32I only
    HPMCOUNTER6H    = 0xC86,  // Upper 32 bits of HPMCOUNTER6, RV32I only
    HPMCOUNTER7H    = 0xC87,  // Upper 32 bits of HPMCOUNTER7, RV32I only
    HPMCOUNTER8H    = 0xC88,  // Upper 32 bits of HPMCOUNTER8, RV32I only
    HPMCOUNTER9H    = 0xC89,  // Upper 32 bits of HPMCOUNTER9, RV32I only
    HPMCOUNTER10H   = 0xC8A,  // Upper 32 bits of HPMCOUNTER10, RV32I only
    HPMCOUNTER11H   = 0xC8B,  // Upper 32 bits of HPMCOUNTER11, RV32I only
    HPMCOUNTER12H   = 0xC8C,  // Upper 32 bits of HPMCOUNTER12, RV32I only
    HPMCOUNTER13H   = 0xC8D,  // Upper 32 bits of HPMCOUNTER13, RV32I only
    HPMCOUNTER14H   = 0xC8E,  // Upper 32 bits of HPMCOUNTER14, RV32I only
    HPMCOUNTER15H   = 0xC8F,  // Upper 32 bits of HPMCOUNTER15, RV32I only
    HPMCOUNTER16H   = 0xC90,  // Upper 32 bits of HPMCOUNTER16, RV32I only
    HPMCOUNTER17H   = 0xC91,  // Upper 32 bits of HPMCOUNTER17, RV32I only
    HPMCOUNTER18H   = 0xC92,  // Upper 32 bits of HPMCOUNTER18, RV32I only
    HPMCOUNTER19H   = 0xC93,  // Upper 32 bits of HPMCOUNTER19, RV32I only
    HPMCOUNTER20H   = 0xC94,  // Upper 32 bits of HPMCOUNTER20, RV32I only
    HPMCOUNTER21H   = 0xC95,  // Upper 32 bits of HPMCOUNTER21, RV32I only
    HPMCOUNTER22H   = 0xC96,  // Upper 32 bits of HPMCOUNTER22, RV32I only
    HPMCOUNTER23H   = 0xC97,  // Upper 32 bits of HPMCOUNTER23, RV32I only
    HPMCOUNTER24H   = 0xC98,  // Upper 32 bits of HPMCOUNTER24, RV32I only
    HPMCOUNTER25H   = 0xC99,  // Upper 32 bits of HPMCOUNTER25, RV32I only
    HPMCOUNTER26H   = 0xC9A,  // Upper 32 bits of HPMCOUNTER26, RV32I only
    HPMCOUNTER27H   = 0xC9B,  // Upper 32 bits of HPMCOUNTER27, RV32I only
    HPMCOUNTER28H   = 0xC9C,  // Upper 32 bits of HPMCOUNTER28, RV32I only
    HPMCOUNTER29H   = 0xC9D,  // Upper 32 bits of HPMCOUNTER29, RV32I only
    HPMCOUNTER30H   = 0xC9E,  // Upper 32 bits of HPMCOUNTER30, RV32I only
    HPMCOUNTER31H   = 0xC9F,  // Upper 32 bits of HPMCOUNTER31, RV32I only
    // Supervisor mode register
    SSTATUS         = 0x100,  // Supervisor status
    SEDELEG         = 0x102,  // Supervisor exception delegation register
    SIDELEG         = 0x103,  // Supervisor interrupt delegation register
    SIE             = 0x104,  // Supervisor interrupt-enable register
    STVEC           = 0x105,  // Supervisor trap-handler base address
    SCOUNTEREN      = 0x106,  // Supervisor counter enable
    SSCRATCH        = 0x140,  // Scratch register for supervisor trap handlers
    SEPC            = 0x141,  // Supervisor exception program counter
    SCAUSE          = 0x142,  // Supervisor trap cause
    STVAL           = 0x143,  // Supervisor bad address or instruction
    SIP             = 0x144,  // Supervisor interrupt pending
    SATP            = 0x180,  // Supervisor address translation and protection
    // Machine mode register
    MVENDORID       = 0xF11,  // Vendor ID
    MARCHID         = 0xF12,  // Architecture ID
    MIMPID          = 0xF13,  // Implementation ID
    MHARTID         = 0xF14,  // Hardware thread ID
    MSTATUS         = 0x300,  // Machine status
    MISA            = 0x301,  // ISA and extensions
    MEDELEG         = 0x302,  // Machine exception delegation register
    MIDELEG         = 0x303,  // Machine interrupt delegation register
    MIE             = 0x304,  // Machine interrupt-enable register
    MTVEC           = 0x305,  // Machine trap-handler base address
    MCOUNTEREN      = 0x306,  // Machine counter enable
    MSCRATCH        = 0x340,  // Scratch register for machine trap handlers
    MEPC            = 0x341,  // Machine exception program counter
    MCAUSE          = 0x342,  // Machine trap cause
    MTVAL           = 0x343,  // Machine bad address or instruction
    MIP             = 0x344,  // Machine interrupt pending
    PMPCFG0         = 0x3A0,  // Physical memory protection configuration
    PMPCFG1         = 0x3A1,  // Physical memory protection configuration, RV32 only
    PMPCFG2         = 0x3A2,  // Physical memory protection configuration
    PMPCFG3         = 0x3A3,  // Physical memory protection configuration, RV32 only
    PMPADDR0        = 0x3B0,  // Physical memory protection address register
    PMPADDR1        = 0x3B1,  // Physical memory protection address register
    PMPADDR2        = 0x3B2,  // Physical memory protection address register
    PMPADDR3        = 0x3B3,  // Physical memory protection address register
    PMPADDR4        = 0x3B4,  // Physical memory protection address register
    PMPADDR5        = 0x3B5,  // Physical memory protection address register
    PMPADDR6        = 0x3B6,  // Physical memory protection address register
    PMPADDR7        = 0x3B7,  // Physical memory protection address register
    PMPADDR8        = 0x3B8,  // Physical memory protection address register
    PMPADDR9        = 0x3B9,  // Physical memory protection address register
    PMPADDR10       = 0x3BA,  // Physical memory protection address register
    PMPADDR11       = 0x3BB,  // Physical memory protection address register
    PMPADDR12       = 0x3BC,  // Physical memory protection address register
    PMPADDR13       = 0x3BD,  // Physical memory protection address register
    PMPADDR14       = 0x3BE,  // Physical memory protection address register
    PMPADDR15       = 0x3BF,  // Physical memory protection address register
    MCYCLE          = 0xB00,  // Machine cycle counter
    MINSTRET        = 0xB02,  // Machine instructions-retired counter
    MHPMCOUNTER3    = 0xB03,  // Machine performance-monitoring counter
    MHPMCOUNTER4    = 0xB04,  // Machine performance-monitoring counter
    MHPMCOUNTER5    = 0xB05,  // Machine performance-monitoring counter
    MHPMCOUNTER6    = 0xB06,  // Machine performance-monitoring counter
    MHPMCOUNTER7    = 0xB07,  // Machine performance-monitoring counter
    MHPMCOUNTER8    = 0xB08,  // Machine performance-monitoring counter
    MHPMCOUNTER9    = 0xB09,  // Machine performance-monitoring counter
    MHPMCOUNTER10   = 0xB0A,  // Machine performance-monitoring counter
    MHPMCOUNTER11   = 0xB0B,  // Machine performance-monitoring counter
    MHPMCOUNTER12   = 0xB0C,  // Machine performance-monitoring counter
    MHPMCOUNTER13   = 0xB0D,  // Machine performance-monitoring counter
    MHPMCOUNTER14   = 0xB0E,  // Machine performance-monitoring counter
    MHPMCOUNTER15   = 0xB0F,  // Machine performance-monitoring counter
    MHPMCOUNTER16   = 0xB10,  // Machine performance-monitoring counter
    MHPMCOUNTER17   = 0xB11,  // Machine performance-monitoring counter
    MHPMCOUNTER18   = 0xB12,  // Machine performance-monitoring counter
    MHPMCOUNTER19   = 0xB13,  // Machine performance-monitoring counter
    MHPMCOUNTER20   = 0xB14,  // Machine performance-monitoring counter
    MHPMCOUNTER21   = 0xB15,  // Machine performance-monitoring counter
    MHPMCOUNTER22   = 0xB16,  // Machine performance-monitoring counter
    MHPMCOUNTER23   = 0xB17,  // Machine performance-monitoring counter
    MHPMCOUNTER24   = 0xB18,  // Machine performance-monitoring counter
    MHPMCOUNTER25   = 0xB19,  // Machine performance-monitoring counter
    MHPMCOUNTER26   = 0xB1A,  // Machine performance-monitoring counter
    MHPMCOUNTER27   = 0xB1B,  // Machine performance-monitoring counter
    MHPMCOUNTER28   = 0xB1C,  // Machine performance-monitoring counter
    MHPMCOUNTER29   = 0xB1D,  // Machine performance-monitoring counter
    MHPMCOUNTER30   = 0xB1E,  // Machine performance-monitoring counter
    MHPMCOUNTER31   = 0xB1F,  // Machine performance-monitoring counter
    MCYCLEH         = 0xB80,  // Upper 32 bits of MCYCLE, RV32I only
    MINSTRETH       = 0xB82,  // Upper 32 bits of MINSTRET, RV32I only
    MHPMCOUNTER3H   = 0xB83,  // Upper 32 bits of HPMCOUNTER3, RV32I only
    MHPMCOUNTER4H   = 0xB84,  // Upper 32 bits of HPMCOUNTER4, RV32I only
    MHPMCOUNTER5H   = 0xB85,  // Upper 32 bits of HPMCOUNTER5, RV32I only
    MHPMCOUNTER6H   = 0xB86,  // Upper 32 bits of HPMCOUNTER6, RV32I only
    MHPMCOUNTER7H   = 0xB87,  // Upper 32 bits of HPMCOUNTER7, RV32I only
    MHPMCOUNTER8H   = 0xB88,  // Upper 32 bits of HPMCOUNTER8, RV32I only
    MHPMCOUNTER9H   = 0xB89,  // Upper 32 bits of HPMCOUNTER9, RV32I only
    MHPMCOUNTER10H  = 0xB8A,  // Upper 32 bits of HPMCOUNTER10, RV32I only
    MHPMCOUNTER11H  = 0xB8B,  // Upper 32 bits of HPMCOUNTER11, RV32I only
    MHPMCOUNTER12H  = 0xB8C,  // Upper 32 bits of HPMCOUNTER12, RV32I only
    MHPMCOUNTER13H  = 0xB8D,  // Upper 32 bits of HPMCOUNTER13, RV32I only
    MHPMCOUNTER14H  = 0xB8E,  // Upper 32 bits of HPMCOUNTER14, RV32I only
    MHPMCOUNTER15H  = 0xB8F,  // Upper 32 bits of HPMCOUNTER15, RV32I only
    MHPMCOUNTER16H  = 0xB90,  // Upper 32 bits of HPMCOUNTER16, RV32I only
    MHPMCOUNTER17H  = 0xB91,  // Upper 32 bits of HPMCOUNTER17, RV32I only
    MHPMCOUNTER18H  = 0xB92,  // Upper 32 bits of HPMCOUNTER18, RV32I only
    MHPMCOUNTER19H  = 0xB93,  // Upper 32 bits of HPMCOUNTER19, RV32I only
    MHPMCOUNTER20H  = 0xB94,  // Upper 32 bits of HPMCOUNTER20, RV32I only
    MHPMCOUNTER21H  = 0xB95,  // Upper 32 bits of HPMCOUNTER21, RV32I only
    MHPMCOUNTER22H  = 0xB96,  // Upper 32 bits of HPMCOUNTER22, RV32I only
    MHPMCOUNTER23H  = 0xB97,  // Upper 32 bits of HPMCOUNTER23, RV32I only
    MHPMCOUNTER24H  = 0xB98,  // Upper 32 bits of HPMCOUNTER24, RV32I only
    MHPMCOUNTER25H  = 0xB99,  // Upper 32 bits of HPMCOUNTER25, RV32I only
    MHPMCOUNTER26H  = 0xB9A,  // Upper 32 bits of HPMCOUNTER26, RV32I only
    MHPMCOUNTER27H  = 0xB9B,  // Upper 32 bits of HPMCOUNTER27, RV32I only
    MHPMCOUNTER28H  = 0xB9C,  // Upper 32 bits of HPMCOUNTER28, RV32I only
    MHPMCOUNTER29H  = 0xB9D,  // Upper 32 bits of HPMCOUNTER29, RV32I only
    MHPMCOUNTER30H  = 0xB9E,  // Upper 32 bits of HPMCOUNTER30, RV32I only
    MHPMCOUNTER31H  = 0xB9F,  // Upper 32 bits of HPMCOUNTER31, RV32I only
    MCOUNTINHIBIT   = 0x320,  // Machine counter-inhibit register
    MHPMEVENT3      = 0x323,  // Machine performance-monitoring event selector
    MHPMEVENT4      = 0x324,  // Machine performance-monitoring event selector
    MHPMEVENT5      = 0x325,  // Machine performance-monitoring event selector
    MHPMEVENT6      = 0x326,  // Machine performance-monitoring event selector
    MHPMEVENT7      = 0x327,  // Machine performance-monitoring event selector
    MHPMEVENT8      = 0x328,  // Machine performance-monitoring event selector
    MHPMEVENT9      = 0x329,  // Machine performance-monitoring event selector
    MHPMEVENT10     = 0x32A,  // Machine performance-monitoring event selector
    MHPMEVENT11     = 0x32B,  // Machine performance-monitoring event selector
    MHPMEVENT12     = 0x32C,  // Machine performance-monitoring event selector
    MHPMEVENT13     = 0x32D,  // Machine performance-monitoring event selector
    MHPMEVENT14     = 0x32E,  // Machine performance-monitoring event selector
    MHPMEVENT15     = 0x32F,  // Machine performance-monitoring event selector
    MHPMEVENT16     = 0x330,  // Machine performance-monitoring event selector
    MHPMEVENT17     = 0x331,  // Machine performance-monitoring event selector
    MHPMEVENT18     = 0x332,  // Machine performance-monitoring event selector
    MHPMEVENT19     = 0x333,  // Machine performance-monitoring event selector
    MHPMEVENT20     = 0x334,  // Machine performance-monitoring event selector
    MHPMEVENT21     = 0x335,  // Machine performance-monitoring event selector
    MHPMEVENT22     = 0x336,  // Machine performance-monitoring event selector
    MHPMEVENT23     = 0x337,  // Machine performance-monitoring event selector
    MHPMEVENT24     = 0x338,  // Machine performance-monitoring event selector
    MHPMEVENT25     = 0x339,  // Machine performance-monitoring event selector
    MHPMEVENT26     = 0x33A,  // Machine performance-monitoring event selector
    MHPMEVENT27     = 0x33B,  // Machine performance-monitoring event selector
    MHPMEVENT28     = 0x33C,  // Machine performance-monitoring event selector
    MHPMEVENT29     = 0x33D,  // Machine performance-monitoring event selector
    MHPMEVENT30     = 0x33E,  // Machine performance-monitoring event selector
    MHPMEVENT31     = 0x33F,  // Machine performance-monitoring event selector
    TSELECT         = 0x7A0,  // Debug/Trace trigger register select
    TDATA1          = 0x7A1,  // First Debug/Trace trigger data register
    TDATA2          = 0x7A2,  // Second Debug/Trace trigger data register
    TDATA3          = 0x7A3,  // Third Debug/Trace trigger data register
    TINFO           = 0x7A4,  // Debug trigger info register
    TCONTROL        = 0x7A5,  // Debug trigger control register
    MCONTEXT        = 0x7A8,  // Machine mode trigger context register
    SCONTEXT        = 0x7AA,  // Supervisor mode trigger context register
    DCSR            = 0x7B0,  // Debug control and status register
    DPC             = 0x7B1,  // Debug PC
    DSCRATCH0       = 0x7B2,  // Debug scratch register
    DSCRATCH1       = 0x7B3,  // Debug scratch register
    VSTART          = 0x008,  // Vector start position
    VXSTAT          = 0x009,  // Fixed point saturate flag
    VXRM            = 0x00A,  // Fixed point rounding mode
    VL              = 0xC20,  // Vector length
    VTYPE           = 0xC21,  // Vector data type register
    VLENB           = 0xC22   // VLEN/8 (vector register length in bytes)
    }


enum privileged_mode_t: byte {
  USER_MODE       = 0b00,
    SUPERVISOR_MODE = 0b01,
    RESERVED_MODE   = 0b10,
    MACHINE_MODE    = 0b11
}

class riscv_instr_gen_config
{
   bool  enable_illegal_csr_instruction;
   bool enable_access_invalid_csr_level;
   privileged_reg_t[] invalid_priv_mode_csrs;
   privileged_mode_t init_privileged_mode;
}


enum privileged_reg_t[] implemented_csr = [
    // Machine mode mode CSR
    privileged_reg_t.MVENDORID,  // Vendor ID
    privileged_reg_t.MARCHID,    // Architecture ID
    privileged_reg_t.MIMPID,     // Implementation ID
    privileged_reg_t.MHARTID,    // Hardware thread ID
    privileged_reg_t.MSTATUS,    // Machine status
    privileged_reg_t.MISA,       // ISA and extensions
    privileged_reg_t.MIE,        // Machine interrupt-enable register
    privileged_reg_t.MTVEC,      // Machine trap-handler base address
    privileged_reg_t.MCOUNTEREN, // Machine counter enable
    privileged_reg_t.MSCRATCH,   // Scratch register for machine trap handlers
    privileged_reg_t.MEPC,       // Machine exception program counter
    privileged_reg_t.MCAUSE,     // Machine trap cause
    privileged_reg_t.MTVAL,      // Machine bad address or instruction
    privileged_reg_t.MIP         // Machine interrupt pending
];


class riscv_instr
{

    __gshared privileged_reg_t[]    exclude_reg;
    __gshared  privileged_reg_t[]    include_reg;

   
  
   static void create_csr_filter(riscv_instr_gen_config cfg)
  {
    include_reg.length = 0;
    exclude_reg.length = 0;
    if (cfg.enable_illegal_csr_instruction)
      {
	exclude_reg = implemented_csr;
      }
    else if (cfg.enable_access_invalid_csr_level)
      {
	include_reg = cfg.invalid_priv_mode_csrs;
      } else
      {
      // Use scratch register to avoid the side effect of modifying other privileged mode CSR.
      if (cfg.init_privileged_mode == privileged_mode_t.MACHINE_MODE)
	{
	  include_reg = [ privileged_reg_t.MSCRATCH];
	} else if (cfg.init_privileged_mode == privileged_mode_t.SUPERVISOR_MODE)
	{
	  include_reg = [privileged_reg_t.SSCRATCH];
	} else
	{
	  include_reg = [privileged_reg_t.USCRATCH];
	}
      }
  }

    void display()
    {
    import std.stdio;
    foreach(i;include_reg)
    {
      writeln(i);
    }

    foreach(i;exclude_reg)
    {
      writeln(i);
    }
    }
}

void main()
{
    auto cfg = new riscv_instr_gen_config;
    auto test = new riscv_instr;

    cfg.enable_illegal_csr_instruction = true;
    cfg.enable_access_invalid_csr_level = false;
    cfg.init_privileged_mode = privileged_mode_t.MACHINE_MODE;
    
    test.create_csr_filter(cfg);
    test.display();
       
}