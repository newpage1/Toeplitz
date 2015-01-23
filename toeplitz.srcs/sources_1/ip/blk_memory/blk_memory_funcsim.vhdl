-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Mon Jan 19 16:02:13 2015
-- Host        : Owner-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Xilinx_Vivado_SDK_Win_2014.2_0612_1/vivado_projects/toeplitz/toeplitz.srcs/sources_1/ip/blk_memory/blk_memory_funcsim.vhdl
-- Design      : blk_memory
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_memory_blk_mem_gen_prim_wrapper_init is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_memory_blk_mem_gen_prim_wrapper_init : entity is "blk_mem_gen_prim_wrapper_init";
end blk_memory_blk_mem_gen_prim_wrapper_init;

architecture STRUCTURE of blk_memory_blk_mem_gen_prim_wrapper_init is
  signal \n_32_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\ : STD_LOGIC;
  signal \n_33_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\ : STD_LOGIC;
  signal \n_34_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\ : STD_LOGIC;
  signal \n_35_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 1,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000700000006000000050000000400000003000000020000000100000000",
      INIT_01 => X"0000000F0000000E0000000D0000000C0000000B0000000A0000000900000008",
      INIT_02 => X"0000001700000016000000150000001400000013000000120000001100000010",
      INIT_03 => X"0000001F0000001E0000001D0000001C0000001B0000001A0000001900000018",
      INIT_04 => X"0000002700000026000000250000002400000023000000220000002100000020",
      INIT_05 => X"0000002F0000002E0000002D0000002C0000002B0000002A0000002900000028",
      INIT_06 => X"0000003700000036000000350000003400000033000000320000003100000030",
      INIT_07 => X"0000003F0000003E0000003D0000003C0000003B0000003A0000003900000038",
      INIT_08 => X"0000004700000046000000450000004400000043000000420000004100000040",
      INIT_09 => X"0000004F0000004E0000004D0000004C0000004B0000004A0000004900000048",
      INIT_0A => X"0000005700000056000000550000005400000053000000520000005100000050",
      INIT_0B => X"0000005F0000005E0000005D0000005C0000005B0000005A0000005900000058",
      INIT_0C => X"0000006700000066000000650000006400000063000000620000006100000060",
      INIT_0D => X"0000006F0000006E0000006D0000006C0000006B0000006A0000006900000068",
      INIT_0E => X"0000007700000076000000750000007400000073000000720000007100000070",
      INIT_0F => X"0000007F0000007E0000007D0000007C0000007B0000007A0000007900000078",
      INIT_10 => X"0000008700000086000000850000008400000083000000820000008100000080",
      INIT_11 => X"0000008F0000008E0000008D0000008C0000008B0000008A0000008900000088",
      INIT_12 => X"0000009700000096000000950000009400000093000000920000009100000090",
      INIT_13 => X"0000009F0000009E0000009D0000009C0000009B0000009A0000009900000098",
      INIT_14 => X"000000A7000000A6000000A5000000A4000000A3000000A2000000A1000000A0",
      INIT_15 => X"000000AF000000AE000000AD000000AC000000AB000000AA000000A9000000A8",
      INIT_16 => X"000000B7000000B6000000B5000000B4000000B3000000B2000000B1000000B0",
      INIT_17 => X"000000BF000000BE000000BD000000BC000000BB000000BA000000B9000000B8",
      INIT_18 => X"000000C7000000C6000000C5000000C4000000C3000000C2000000C1000000C0",
      INIT_19 => X"000000CF000000CE000000CD000000CC000000CB000000CA000000C9000000C8",
      INIT_1A => X"000000D7000000D6000000D5000000D4000000D3000000D2000000D1000000D0",
      INIT_1B => X"000000DF000000DE000000DD000000DC000000DB000000DA000000D9000000D8",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
    port map (
      ADDRARDADDR(13) => '0',
      ADDRARDADDR(12 downto 5) => addra(7 downto 0),
      ADDRARDADDR(4) => '0',
      ADDRARDADDR(3) => '0',
      ADDRARDADDR(2) => '0',
      ADDRARDADDR(1) => '0',
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(13) => '0',
      ADDRBWRADDR(12 downto 5) => addra(7 downto 0),
      ADDRBWRADDR(4) => '1',
      ADDRBWRADDR(3) => '0',
      ADDRBWRADDR(2) => '0',
      ADDRBWRADDR(1) => '0',
      ADDRBWRADDR(0) => '0',
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DIADI(15) => '0',
      DIADI(14) => '0',
      DIADI(13) => '0',
      DIADI(12) => '0',
      DIADI(11) => '0',
      DIADI(10) => '0',
      DIADI(9) => '0',
      DIADI(8) => '0',
      DIADI(7) => '0',
      DIADI(6) => '0',
      DIADI(5) => '0',
      DIADI(4) => '0',
      DIADI(3) => '0',
      DIADI(2) => '0',
      DIADI(1) => '0',
      DIADI(0) => '0',
      DIBDI(15) => '0',
      DIBDI(14) => '0',
      DIBDI(13) => '0',
      DIBDI(12) => '0',
      DIBDI(11) => '0',
      DIBDI(10) => '0',
      DIBDI(9) => '0',
      DIBDI(8) => '0',
      DIBDI(7) => '0',
      DIBDI(6) => '0',
      DIBDI(5) => '0',
      DIBDI(4) => '0',
      DIBDI(3) => '0',
      DIBDI(2) => '0',
      DIBDI(1) => '0',
      DIBDI(0) => '0',
      DIPADIP(1) => '0',
      DIPADIP(0) => '0',
      DIPBDIP(1) => '0',
      DIPBDIP(0) => '0',
      DOADO(15 downto 0) => douta(15 downto 0),
      DOBDO(15 downto 0) => douta(31 downto 16),
      DOPADOP(1) => \n_32_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\,
      DOPADOP(0) => \n_33_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\,
      DOPBDOP(1) => \n_34_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\,
      DOPBDOP(0) => \n_35_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram\,
      ENARDEN => ena,
      ENBWREN => ena,
      REGCEAREGCE => ena,
      REGCEB => ena,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => '0',
      WEA(0) => '0',
      WEBWE(3) => '0',
      WEBWE(2) => '0',
      WEBWE(1) => '0',
      WEBWE(0) => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_memory_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_memory_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end blk_memory_blk_mem_gen_prim_width;

architecture STRUCTURE of blk_memory_blk_mem_gen_prim_width is
begin
\prim_init.ram\: entity work.blk_memory_blk_mem_gen_prim_wrapper_init
    port map (
      addra(7 downto 0) => addra(7 downto 0),
      clka => clka,
      douta(31 downto 0) => douta(31 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_memory_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_memory_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end blk_memory_blk_mem_gen_generic_cstr;

architecture STRUCTURE of blk_memory_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.blk_memory_blk_mem_gen_prim_width
    port map (
      addra(7 downto 0) => addra(7 downto 0),
      clka => clka,
      douta(31 downto 0) => douta(31 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_memory_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_memory_blk_mem_gen_top : entity is "blk_mem_gen_top";
end blk_memory_blk_mem_gen_top;

architecture STRUCTURE of blk_memory_blk_mem_gen_top is
begin
\valid.cstr\: entity work.blk_memory_blk_mem_gen_generic_cstr
    port map (
      addra(7 downto 0) => addra(7 downto 0),
      clka => clka,
      douta(31 downto 0) => douta(31 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_memory_blk_mem_gen_v8_2_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_memory_blk_mem_gen_v8_2_synth : entity is "blk_mem_gen_v8_2_synth";
end blk_memory_blk_mem_gen_v8_2_synth;

architecture STRUCTURE of blk_memory_blk_mem_gen_v8_2_synth is
begin
\gnativebmg.native_blk_mem_gen\: entity work.blk_memory_blk_mem_gen_top
    port map (
      addra(7 downto 0) => addra(7 downto 0),
      clka => clka,
      douta(31 downto 0) => douta(31 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \blk_memory_blk_mem_gen_v8_2__parameterized0\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \blk_memory_blk_mem_gen_v8_2__parameterized0\ : entity is "blk_mem_gen_v8_2";
end \blk_memory_blk_mem_gen_v8_2__parameterized0\;

architecture STRUCTURE of \blk_memory_blk_mem_gen_v8_2__parameterized0\ is
begin
inst_blk_mem_gen: entity work.blk_memory_blk_mem_gen_v8_2_synth
    port map (
      addra(7 downto 0) => addra(7 downto 0),
      clka => clka,
      douta(31 downto 0) => douta(31 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_memory is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 7 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of blk_memory : entity is true;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of blk_memory : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of blk_memory : entity is "blk_mem_gen_v8_2,Vivado 2014.2";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of blk_memory : entity is "blk_memory,blk_mem_gen_v8_2,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of blk_memory : entity is "blk_memory,blk_mem_gen_v8_2,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=blk_mem_gen,x_ipVersion=8.2,x_ipCoreRevision=1,x_ipLanguage=VERILOG,C_FAMILY=zynq,C_XDEVICEFAMILY=zynq,C_ELABORATION_DIR=./,C_INTERFACE_TYPE=0,C_AXI_TYPE=1,C_AXI_SLAVE_TYPE=0,C_USE_BRAM_BLOCK=0,C_ENABLE_32BIT_ADDRESS=0,C_CTRL_ECC_ALGO=NONE,C_HAS_AXI_ID=0,C_AXI_ID_WIDTH=4,C_MEM_TYPE=3,C_BYTE_SIZE=9,C_ALGORITHM=1,C_PRIM_TYPE=1,C_LOAD_INIT_FILE=1,C_INIT_FILE_NAME=blk_memory.mif,C_INIT_FILE=blk_memory.mem,C_USE_DEFAULT_DATA=0,C_DEFAULT_DATA=0,C_HAS_RSTA=0,C_RST_PRIORITY_A=CE,C_RSTRAM_A=0,C_INITA_VAL=0,C_HAS_ENA=1,C_HAS_REGCEA=0,C_USE_BYTE_WEA=0,C_WEA_WIDTH=1,C_WRITE_MODE_A=WRITE_FIRST,C_WRITE_WIDTH_A=32,C_READ_WIDTH_A=32,C_WRITE_DEPTH_A=224,C_READ_DEPTH_A=224,C_ADDRA_WIDTH=8,C_HAS_RSTB=0,C_RST_PRIORITY_B=CE,C_RSTRAM_B=0,C_INITB_VAL=0,C_HAS_ENB=0,C_HAS_REGCEB=0,C_USE_BYTE_WEB=0,C_WEB_WIDTH=1,C_WRITE_MODE_B=WRITE_FIRST,C_WRITE_WIDTH_B=32,C_READ_WIDTH_B=32,C_WRITE_DEPTH_B=224,C_READ_DEPTH_B=224,C_ADDRB_WIDTH=8,C_HAS_MEM_OUTPUT_REGS_A=1,C_HAS_MEM_OUTPUT_REGS_B=0,C_HAS_MUX_OUTPUT_REGS_A=0,C_HAS_MUX_OUTPUT_REGS_B=0,C_MUX_PIPELINE_STAGES=0,C_HAS_SOFTECC_INPUT_REGS_A=0,C_HAS_SOFTECC_OUTPUT_REGS_B=0,C_USE_SOFTECC=0,C_USE_ECC=0,C_EN_ECC_PIPE=0,C_HAS_INJECTERR=0,C_SIM_COLLISION_CHECK=ALL,C_COMMON_CLK=0,C_DISABLE_WARN_BHV_COLL=0,C_EN_SLEEP_PIN=0,C_DISABLE_WARN_BHV_RANGE=0,C_COUNT_36K_BRAM=0,C_COUNT_18K_BRAM=1,C_EST_POWER_SUMMARY=Estimated Power for IP     _     3.375199 mW}";
end blk_memory;

architecture STRUCTURE of blk_memory is
begin
U0: entity work.\blk_memory_blk_mem_gen_v8_2__parameterized0\
    port map (
      addra(7 downto 0) => addra(7 downto 0),
      clka => clka,
      douta(31 downto 0) => douta(31 downto 0),
      ena => ena
    );
end STRUCTURE;
