import esdl;
import std.stdio;
import std.string: format;


enum satp_mode_t: byte {
  BARE = 0b0000,
    SV32 = 0b0001,
    SV39 = 0b1000,
    SV48 = 0b1001,
    SV57 = 0b1010,
    SV64 = 0b1011
}
enum riscv_instr_group_t: byte {
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
}


class Bar
{

    riscv_instr_group_t[] supported_isa = [riscv_instr_group_t.RV32I,
					    riscv_instr_group_t.RV32M,
					    riscv_instr_group_t.RV64I,
					    riscv_instr_group_t.RV64M,
					    riscv_instr_group_t.RV32C,
					    riscv_instr_group_t.RV64C,
					    riscv_instr_group_t.RV128I];

  void check_setting(int XLEN,satp_mode_t SATP_MODE)
  {
    bool support_64b;
    bool support_128b;
    import std.algorithm: canFind;
    import std.string: format;
    import std.stdio;
    foreach (i; supported_isa)
      {
	if( canFind( [riscv_instr_group_t.RV64I,
		      riscv_instr_group_t.RV64M,
		      riscv_instr_group_t.RV64A,
		      riscv_instr_group_t.RV64F,
		      riscv_instr_group_t.RV64D,
		      riscv_instr_group_t.RV64C,
		      riscv_instr_group_t.RV64B], i))
	  {
	    support_64b = true;
	  }
	 else if (canFind ([riscv_instr_group_t.RV128I,
			   riscv_instr_group_t.RV128C], i))
	  {
	    support_128b = true; //true
	  }
  
      }
    if (support_128b && XLEN != 128)
      {
	writeln("XLEN should be set to 128 based on riscv_instr_pkg.supported_isa setting");
      }
    if (!support_128b && support_64b && XLEN != 64)
      {
	writeln("XLEN should be set to 64 based on riscv_instr_pkg.supported_isa setting");
      }
    if (!(support_128b || support_64b) && XLEN != 32)
      {
	writeln("XLEN should be set to 32 based on riscv_instr_pkg.supported_isa setting");
      }
    if (!(support_128b || support_64b)
	&& !(canFind(  [
			satp_mode_t.SV32,
			satp_mode_t.BARE], SATP_MODE)))
      {
	  
	writeln("SATP mode %0s is not supported for RV32G ISA", SATP_MODE);
      }
  }

   
}

void main()
{
    auto test = new Bar;
    test.check_setting(32,satp_mode_t.SV32);
        
}