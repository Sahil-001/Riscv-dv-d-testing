`include "uvm_macros.svh"

module testtb;
  import uvm_pkg::*;
   
     typedef enum {
    // RV32I instructions
    LUI,
    AUIPC,
    JAL,
    JALR,
    BEQ,
    BNE,
    BLT,
    BGE,
    BLTU,
    BGEU,
    LB,
    LH,
    LW,
    LBU,
    LHU,
    SB,
    SH,
    SW,
    ADDI,
    SLTI,
    SLTIU,
    XORI,
    ORI,
    ANDI,
    SLLI,
    SRLI,
    SRAI,
    ADD,
    SUB,
    SLL,
    SLT,
    SLTU,
    XOR,
    SRL,
    SRA,
    OR,
    AND,
    NOP,
    FENCE,
    FENCE_I,
    ECALL,
    EBREAK,
    CSRRW,
    CSRRS,
    CSRRC,
    CSRRWI,
    CSRRSI,
    CSRRCI,
    // RV32B instructions
    ANDN,
    ORN,
    XNOR,
    GORC,
    SLO,
    SRO,
    ROL,
    ROR,
    SBCLR,
    SBSET,
    SBINV,
    SBEXT,
    GREV,
    SLOI,
    SROI,
    RORI,
    SBCLRI,
    SBSETI,
    SBINVI,
    SBEXTI,
    GORCI,
    GREVI,
    CMIX,
    CMOV,
    FSL,
    FSR,
    FSRI,
    CLZ,
    CTZ,
    PCNT,
    SEXT_B,
    SEXT_H,
    CRC32_B,
    CRC32_H,
    CRC32_W,
    CRC32C_B,
    CRC32C_H,
    CRC32C_W,
    CLMUL,
    CLMULR,
    CLMULH,
    MIN,
    MAX,
    MINU,
    MAXU,
    SHFL,
    UNSHFL,
    BDEP,
    BEXT,
    PACK,
    PACKU,
    BMATOR,
    BMATXOR,
    PACKH,
    BFP,
    SHFLI,
    UNSHFLI,
    //RV64B instructions
    ADDIWU,
    SLLIU_W,
    ADDWU,
    SUBWU,
    BMATFLIP,
    CRC32_D,
    CRC32C_D,
    ADDU_W,
    SUBU_W,
    SLOW,
    SROW,
    ROLW,
    RORW,
    SBCLRW,
    SBSETW,
    SBINVW,
    SBEXTW,
    GORCW,
    GREVW,
    SLOIW,
    SROIW,
    RORIW,
    SBCLRIW,
    SBSETIW,
    SBINVIW,
    GORCIW,
    GREVIW,
    FSLW,
    FSRW,
    FSRIW,
    CLZW,
    CTZW,
    PCNTW,
    CLMULW,
    CLMULRW,
    CLMULHW,
    SHFLW,
    UNSHFLW,
    BDEPW,
    BEXTW,
    PACKW,
    PACKUW,
    BFPW,
    // RV32M instructions
    MUL,
    MULH,
    MULHSU,
    MULHU,
    DIV,
    DIVU,
    REM,
    REMU,
    // RV64M instructions
    MULW,
    DIVW,
    DIVUW,
    REMW,
    REMUW,
    // RV32F instructions
    FLW,
    FSW,
    FMADD_S,
    FMSUB_S,
    FNMSUB_S,
    FNMADD_S,
    FADD_S,
    FSUB_S,
    FMUL_S,
    FDIV_S,
    FSQRT_S,
    FSGNJ_S,
    FSGNJN_S,
    FSGNJX_S,
    FMIN_S,
    FMAX_S,
    FCVT_W_S,
    FCVT_WU_S,
    FMV_X_W,
    FEQ_S,
    FLT_S,
    FLE_S,
    FCLASS_S,
    FCVT_S_W,
    FCVT_S_WU,
    FMV_W_X,
    // RV64F instruction
    FCVT_L_S,
    FCVT_LU_S,
    FCVT_S_L,
    FCVT_S_LU,
    // RV32D instructions
    FLD,
    FSD,
    FMADD_D,
    FMSUB_D,
    FNMSUB_D,
    FNMADD_D,
    FADD_D,
    FSUB_D,
    FMUL_D,
    FDIV_D,
    FSQRT_D,
    FSGNJ_D,
    FSGNJN_D,
    FSGNJX_D,
    FMIN_D,
    FMAX_D,
    FCVT_S_D,
    FCVT_D_S,
    FEQ_D,
    FLT_D,
    FLE_D,
    FCLASS_D,
    FCVT_W_D,
    FCVT_WU_D,
    FCVT_D_W,
    FCVT_D_WU,
    // RV64D
    FCVT_L_D,
    FCVT_LU_D,
    FMV_X_D,
    FCVT_D_L,
    FCVT_D_LU,
    FMV_D_X,
    // RV64I
    LWU,
    LD,
    SD,
    ADDIW,
    SLLIW,
    SRLIW,
    SRAIW,
    ADDW,
    SUBW,
    SLLW,
    SRLW,
    SRAW,
    // RV32C
    C_LW,
    C_SW,
    C_LWSP,
    C_SWSP,
    C_ADDI4SPN,
    C_ADDI,
    C_LI,
    C_ADDI16SP,
    C_LUI,
    C_SRLI,
    C_SRAI,
    C_ANDI,
    C_SUB,
    C_XOR,
    C_OR,
    C_AND,
    C_BEQZ,
    C_BNEZ,
    C_SLLI,
    C_MV,
    C_EBREAK,
    C_ADD,
    C_NOP,
    C_J,
    C_JAL,
    C_JR,
    C_JALR,
    // RV64C
    C_ADDIW,
    C_SUBW,
    C_ADDW,
    C_LD,
    C_SD,
    C_LDSP,
    C_SDSP,
    // RV128C
    C_SRLI64,
    C_SRAI64,
    C_SLLI64,
    C_LQ,
    C_SQ,
    C_LQSP,
    C_SQSP,
    // RV32FC
    C_FLW,
    C_FSW,
    C_FLWSP,
    C_FSWSP,
    // RV32DC
    C_FLD,
    C_FSD,
    C_FLDSP,
    C_FSDSP,
    // RV32A
    LR_W,
    SC_W,
    AMOSWAP_W,
    AMOADD_W,
    AMOAND_W,
    AMOOR_W,
    AMOXOR_W,
    AMOMIN_W,
    AMOMAX_W,
    AMOMINU_W,
    AMOMAXU_W,
    // RV64A
    LR_D,
    SC_D,
    AMOSWAP_D,
    AMOADD_D,
    AMOAND_D,
    AMOOR_D,
    AMOXOR_D,
    AMOMIN_D,
    AMOMAX_D,
    AMOMINU_D,
    AMOMAXU_D,
    // Vector instructions
    VSETVL,
    VSETVLI,
    VADD,
    VSUB,
    VRSUB,
    VWADDU,
    VWSUBU,
    VWADD,
    VWSUB,
    VADC,
    VMADC,
    VSBC,
    VMSBC,
    VAND,
    VOR,
    VXOR,
    VSLL,
    VSRL,
    VSRA,
    VNSRL,
    VNSRA,
    VMSEQ,
    VMSNE,
    VMSLTU,
    VMSLT,
    VMSLEU,
    VMSLE,
    VMSGTU,
    VMSGT,
    VMINU,
    VMIN,
    VMAXU,
    VMAX,
    VMUL,
    VMULH,
    VMULHU,
    VMULHSU,
    VDIVU,
    VDIV,
    VREMU,
    VREM,
    VWMUL,
    VWMULU,
    VWMULSU,
    VMACC,
    VNMSAC,
    VMADD,
    VNMSUB,
    VWMACCU,
    VWMACC,
    VWMACCSU,
    VWMACCUS,
    //VQMACCU,
    //VQMACC,
    //VQMACCSU,
    //VQMACCUS,
    VMERGE,
    VMV,
    VSADDU,
    VSADD,
    VSSUBU,
    VSSUB,
    VAADDU,
    VAADD,
    VASUBU,
    VASUB,
    VSSRL,
    VSSRA,
    VNCLIPU,
    VNCLIP,
    // 14. Vector Floating-Point Instructions
    VFADD,
    VFSUB,
    VFRSUB,
    VFMUL,
    VFDIV,
    VFRDIV,
    VFWMUL,
    VFMACC,
    VFNMACC,
    VFMSAC,
    VFNMSAC,
    VFMADD,
    VFNMADD,
    VFMSUB,
    VFNMSUB,
    VFWMACC,
    VFWNMACC,
    VFWMSAC,
    VFWNMSAC,
    VFSQRT_V,
    VFMIN,
    VFMAX,
    VFSGNJ,
    VFSGNJN,
    VFSGNJX,
    VMFEQ,
    VMFNE,
    VMFLT,
    VMFLE,
    VMFGT,
    VMFGE,
    VFCLASS_V,
    VFMERGE,
    VFMV,
    VFCVT_XU_F_V,
    VFCVT_X_F_V,
    VFCVT_F_XU_V,
    VFCVT_F_X_V,
    VFWCVT_XU_F_V,
    VFWCVT_X_F_V,
    VFWCVT_F_XU_V,
    VFWCVT_F_X_V,
    VFWCVT_F_F_V,
    VFNCVT_XU_F_W,
    VFNCVT_X_F_W,
    VFNCVT_F_XU_W,
    VFNCVT_F_X_W,
    VFNCVT_F_F_W,
    VFNCVT_ROD_F_F_W,
    // 15. Vector reduction instruction
    VREDSUM_VS,
    VREDMAXU_VS,
    VREDMAX_VS,
    VREDMINU_VS,
    VREDMIN_VS,
    VREDAND_VS,
    VREDOR_VS,
    VREDXOR_VS,
    VWREDSUMU_VS,
    VWREDSUM_VS,
    VFREDOSUM_VS,
    VFREDSUM_VS,
    VFREDMAX_VS,
    VFWREDOSUM_VS,
    VFWREDSUM_VS,
    // Vector mask instruction
    VMAND_MM,
    VMNAND_MM,
    VMANDNOT_MM,
    VMXOR_MM,
    VMOR_MM,
    VMNOR_MM,
    VMORNOT_MM,
    VMXNOR_MM,
    VPOPC_M,
    VFIRST_M,
    VMSBF_M,
    VMSIF_M,
    VMSOF_M,
    VIOTA_M,
    VID_V,
    // Vector permutation instruction
    VMV_X_S,
    VMV_S_X,
    VFMV_F_S,
    VFMV_S_F,
    VSLIDEUP,
    VSLIDEDOWN,
    VSLIDE1UP,
    VSLIDE1DOWN,
    VRGATHER,
    VCOMPRESS,
    VMV1R_V,
    VMV2R_V,
    VMV4R_V,
    VMV8R_V,
    // Vector load/store instruction
    VLE_V,
    VSE_V,
    VLSE_V,
    VSSE_V,
    VLXEI_V,
    VSXEI_V,
    VSUXEI_V,
    VLEFF_V,
    // Segmented load/store instruction
    VLSEGE_V,
    VSSEGE_V,
    VLSEGEFF_V,
    VLSSEGE_V,
    VSSSEGE_V,
    VLXSEGEI_V,
    VSXSEGEI_V,
    VSUXSEGEI_V,
    // Vector AMO instruction
    // EEW vector AMOs
    VAMOSWAPE_V,
    VAMOADDE_V,
    VAMOXORE_V,
    VAMOANDE_V,
    VAMOORE_V,
    VAMOMINE_V,
    VAMOMAXE_V,
    VAMOMINUE_V,
    VAMOMAXUE_V,
    // Supervisor instruction
    DRET,
    MRET,
    URET,
    SRET,
    WFI,
    SFENCE_VMA
   
     } riscv_instr_name_t;

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

    typedef enum bit [5:0] {
    LOAD = 0,
    STORE,
    SHIFT,
    ARITHMETIC,
    LOGICAL,
    COMPARE,
    BRANCH,
    JUMP,
    SYNCH,
    SYSTEM,
    COUNTER,
    CSR,
    CHANGELEVEL,
    TRAP,
    INTERRUPT,
    //`VECTOR_INCLUDE("riscv_instr_pkg_inc_riscv_instr_category_t.sv")
    AMO // (last one)
  } riscv_instr_category_t;

    typedef enum bit [4:0] {
    ZERO = 5'b00000,
    RA, SP, GP, TP, T0, T1, T2, S0, S1, A0, A1, A2, A3, A4, A5, A6, A7,
    S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, T3, T4, T5, T6
  } riscv_reg_t;

class riscv_instr_gen_config;
   bit 		  enable_sfence;
   bit 		  no_fence;
   bit 		  disable_compressed_instr;
   bit 		  enable_floating_point;
   bit 		  enable_vector_extension;
   bit 		  vector_instr_only;
   riscv_reg_t            reserved_regs[] = {S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11};
   
endclass // riscv_instr_gen_config
   
class riscv_instr extends uvm_object;
   static bit  instr_registry[riscv_instr_name_t];
   static riscv_instr_name_t  instr_names[$];
   static riscv_instr_name_t  instr_group[riscv_instr_group_t][$];
   static riscv_instr_name_t  instr_category[riscv_instr_category_t][$];
   static riscv_instr         instr_template[riscv_instr_name_t];
   
  `uvm_object_utils(riscv_instr)
   
  function new(string name = "riscv_instr");
    super.new(name);
  endfunction

   riscv_instr_group_t supported_isa[$] = {RV32I, RV32M, RV64I, RV64M, RV32C, RV64C};

   riscv_instr_name_t unsupported_instr[];
   riscv_instr_group_t        group;
   riscv_instr_category_t     category;
     
  function void create_instr_list(riscv_instr_gen_config cfg,int XLEN);
    instr_names.delete();
    instr_group.delete();
    instr_category.delete();
    foreach (instr_registry[instr_name]) begin
      riscv_instr instr_inst;
      if (instr_name inside {unsupported_instr}) continue;
      instr_inst = create_instr(instr_name);
      instr_template[instr_name] = instr_inst;
      if (!instr_inst.is_supported(cfg)) continue;
      // C_JAL is RV32C only instruction
      if ((XLEN != 32) && (instr_name == C_JAL)) continue;
      if ((SP inside {cfg.reserved_regs}) && (instr_name inside {C_ADDI16SP})) begin
        continue;
      end
      if (!cfg.enable_sfence && instr_name == SFENCE_VMA) continue;
      if (cfg.no_fence && (instr_name inside {FENCE, FENCE_I, SFENCE_VMA})) continue;
      if ((instr_inst.group inside {supported_isa}) &&
          !(cfg.disable_compressed_instr &&
            (instr_inst.group inside {RV32C, RV64C, RV32DC, RV32FC, RV128C})) &&
          !(!cfg.enable_floating_point &&
            (instr_inst.group inside {RV32F, RV64F, RV32D, RV64D})) &&
          !(!cfg.enable_vector_extension &&
            (instr_inst.group inside {RVV})) &&
          !(cfg.vector_instr_only &&
            !(instr_inst.group inside {RVV}))
          ) begin
        instr_category[instr_inst.category].push_back(instr_name);
        instr_group[instr_inst.group].push_back(instr_name);
        instr_names.push_back(instr_name);
      end
    end
//    build_basic_instruction_list(cfg);
  //  create_csr_filter(cfg);
     endfunction : create_instr_list

    virtual function bit is_supported(riscv_instr_gen_config cfg);
    return 1;
    endfunction
   
   function riscv_instr create_instr(riscv_instr_name_t instr_name);
    uvm_object obj;
    riscv_instr inst;
    string instr_class_name;
    uvm_coreservice_t coreservice = uvm_coreservice_t::get();
    uvm_factory factory = coreservice.get_factory();
    instr_class_name = {"riscv_", instr_name.name(), "_instr"};
    obj = factory.create_object_by_name(instr_class_name, "riscv_instr", instr_class_name);
    if (obj == null) begin
      `uvm_fatal("riscv_instr", $sformatf("Failed to create instr: %0s", instr_class_name))
    end
    if (!$cast(inst, obj)) begin
      `uvm_fatal("riscv_instr", $sformatf("Failed to cast instr: %0s", instr_class_name))
    end
    return inst;
   endfunction : create_instr
   

 
endclass // riscv_instr

initial begin
   riscv_instr b1;
   riscv_instr_gen_config cfg = new();
   
   cfg.enable_sfence = 1;
   cfg.no_fence = 1;
   cfg.disable_compressed_instr = 1;
   cfg.enable_floating_point = 1;
   cfg.enable_vector_extension = 1;
   cfg.vector_instr_only = 0;
   
   b1 = riscv_instr::type_id::create("b1");
  b1.create_instr_list(cfg,32);
end

endmodule // testtb
