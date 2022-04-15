--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : PIC24.vhf
-- /___/   /\     Timestamp : 01/14/2022 00:05:53
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx92i\bin\nt\sch2vhdl.exe -intstyle ise -family spartan3 -flat -suppress -w D:/Laboratoare-An3-Sem1/PIC24/PIC24.sch PIC24.vhf
--Design Name: PIC24
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PIC24 is
   port ( Clk   : in    std_logic; 
          INW0  : in    std_logic_vector (15 downto 0); 
          INW1  : in    std_logic_vector (15 downto 0); 
          OUTW0 : out   std_logic_vector (15 downto 0));
end PIC24;

architecture BEHAVIORAL of PIC24 is
   signal ALUOP     : std_logic_vector (3 downto 0);
   signal ALU_OUT   : std_logic_vector (15 downto 0);
   signal Branch    : std_logic;
   signal C_En      : std_logic;
   signal DataOUT   : std_logic_vector (15 downto 0);
   signal Instr     : std_logic_vector (23 downto 0);
   signal LastCarry : std_logic;
   signal MemWr     : std_logic;
   signal Mem2Reg   : std_logic;
   signal New_PC    : std_logic_vector (5 downto 0);
   signal N_En      : std_logic;
   signal OV_En     : std_logic;
   signal O_En      : std_logic;
   signal PC        : std_logic_vector (5 downto 0);
   signal RdDataB   : std_logic_vector (15 downto 0);
   signal RdDataS   : std_logic_vector (15 downto 0);
   signal RdRegB    : std_logic_vector (3 downto 0);
   signal RegBase   : std_logic;
   signal RegDest   : std_logic;
   signal RegWr     : std_logic;
   signal WrData    : std_logic_vector (15 downto 0);
   signal WrReg     : std_logic_vector (3 downto 0);
   signal XLXN_11   : std_logic;
   signal XLXN_12   : std_logic;
   signal XLXN_13   : std_logic;
   signal XLXN_14   : std_logic;
   signal Z_En      : std_logic;
   component ALU
      port ( Clk      : in    std_logic; 
             N_En     : in    std_logic; 
             OV_En    : in    std_logic; 
             Z_En     : in    std_logic; 
             C_En     : in    std_logic; 
             C_Status : in    std_logic; 
             RdDataB  : in    std_logic_vector (15 downto 0); 
             RdDataS  : in    std_logic_vector (15 downto 0); 
             ALUOP    : in    std_logic_vector (3 downto 0); 
             ANDlit   : in    std_logic_vector (9 downto 0); 
             N        : out   std_logic; 
             OV       : out   std_logic; 
             Z        : out   std_logic; 
             C        : out   std_logic; 
             Y        : out   std_logic_vector (15 downto 0));
   end component;
   
   component CTRL
      port ( OP      : in    std_logic_vector (4 downto 0); 
             MemWr   : out   std_logic; 
             Mem2Reg : out   std_logic; 
             RegWr   : out   std_logic; 
             RegDest : out   std_logic; 
             RegBase : out   std_logic; 
             Branch  : out   std_logic; 
             N_En    : out   std_logic; 
             OV_En   : out   std_logic; 
             Z_En    : out   std_logic; 
             C_En    : out   std_logic; 
             ALUOP   : out   std_logic_vector (3 downto 0));
   end component;
   
   component DataMem
      port ( Clk     : in    std_logic; 
             Wr      : in    std_logic; 
             INW0    : in    std_logic_vector (15 downto 0); 
             INW1    : in    std_logic_vector (15 downto 0); 
             Addr    : in    std_logic_vector (4 downto 0); 
             DataIn  : in    std_logic_vector (15 downto 0); 
             OUTW0   : out   std_logic_vector (15 downto 0); 
             DataOut : out   std_logic_vector (15 downto 0));
   end component;
   
   component MUX_D
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (3 downto 0); 
             I1  : in    std_logic_vector (3 downto 0); 
             Y   : out   std_logic_vector (3 downto 0));
   end component;
   
   component MUX2V16
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (15 downto 0); 
             I1  : in    std_logic_vector (15 downto 0); 
             Y   : out   std_logic_vector (15 downto 0));
   end component;
   
   component PC_Update
      port ( CarryOUT   : out   std_logic; 
             Offset     : in    std_logic_vector (4 downto 0); 
             Branch     : in    std_logic; 
             PC         : in    std_logic_vector (5 downto 0); 
             New_PC     : out   std_logic_vector (5 downto 0); 
             N          : in    std_logic; 
             OV         : in    std_logic; 
             C          : in    std_logic; 
             BranchType : in    std_logic_vector (2 downto 0); 
             Z          : in    std_logic);
   end component;
   
   component ProgCnt
      port ( PC     : out   std_logic_vector (5 downto 0); 
             New_PC : in    std_logic_vector (5 downto 0); 
             Clk    : in    std_logic);
   end component;
   
   component File_Regs
      port ( Clk     : in    std_logic; 
             WrEn    : in    std_logic; 
             RdRegB  : in    std_logic_vector (3 downto 0); 
             RdRegS  : in    std_logic_vector (3 downto 0); 
             WrReg   : in    std_logic_vector (3 downto 0); 
             WRData  : in    std_logic_vector (15 downto 0); 
             RdDataB : out   std_logic_vector (15 downto 0); 
             RdDataS : out   std_logic_vector (15 downto 0));
   end component;
   
   component ROM32x24
      port ( Addr : in    std_logic_vector (4 downto 0); 
             Data : out   std_logic_vector (23 downto 0));
   end component;
   
begin
   U_ALU : ALU
      port map (ALUOP(3 downto 0)=>ALUOP(3 downto 0),
                ANDlit(9 downto 0)=>Instr(13 downto 4),
                Clk=>Clk,
                C_En=>C_En,
                C_Status=>LastCarry,
                N_En=>N_En,
                OV_En=>O_En,
                RdDataB(15 downto 0)=>RdDataB(15 downto 0),
                RdDataS(15 downto 0)=>RdDataS(15 downto 0),
                Z_En=>Z_En,
                C=>XLXN_12,
                N=>XLXN_14,
                OV=>XLXN_11,
                Y(15 downto 0)=>ALU_OUT(15 downto 0),
                Z=>XLXN_13);
   
   U_CTRL : CTRL
      port map (OP(4 downto 0)=>Instr(23 downto 19),
                ALUOP(3 downto 0)=>ALUOP(3 downto 0),
                Branch=>Branch,
                C_En=>C_En,
                MemWr=>MemWr,
                Mem2Reg=>Mem2Reg,
                N_En=>N_En,
                OV_En=>OV_En,
                RegBase=>RegBase,
                RegDest=>RegDest,
                RegWr=>RegWr,
                Z_En=>Z_En);
   
   U_DataMem : DataMem
      port map (Addr(4 downto 0)=>Instr(8 downto 4),
                Clk=>Clk,
                DataIn(15 downto 0)=>RdDataS(15 downto 0),
                INW0(15 downto 0)=>INW0(15 downto 0),
                INW1(15 downto 0)=>INW1(15 downto 0),
                Wr=>MemWr,
                DataOut(15 downto 0)=>DataOUT(15 downto 0),
                OUTW0(15 downto 0)=>OUTW0(15 downto 0));
   
   U_MUX_Base : MUX_D
      port map (I0(3 downto 0)=>Instr(14 downto 11),
                I1(3 downto 0)=>Instr(18 downto 15),
                Sel=>RegBase,
                Y(3 downto 0)=>RdRegB(3 downto 0));
   
   U_MUX_Data : MUX2V16
      port map (I0(15 downto 0)=>ALU_OUT(15 downto 0),
                I1(15 downto 0)=>DataOUT(15 downto 0),
                Sel=>Mem2Reg,
                Y(15 downto 0)=>WrData(15 downto 0));
   
   U_MUX_Dest : MUX_D
      port map (I0(3 downto 0)=>Instr(3 downto 0),
                I1(3 downto 0)=>Instr(10 downto 7),
                Sel=>RegDest,
                Y(3 downto 0)=>WrReg(3 downto 0));
   
   U_New_PC : PC_Update
      port map (Branch=>Branch,
                BranchType(2 downto 0)=>Instr(18 downto 16),
                C=>XLXN_12,
                N=>XLXN_14,
                Offset(4 downto 0)=>Instr(4 downto 0),
                OV=>XLXN_11,
                PC(5 downto 0)=>PC(5 downto 0),
                Z=>XLXN_13,
                CarryOUT=>LastCarry,
                New_PC(5 downto 0)=>New_PC(5 downto 0));
   
   U_PC : ProgCnt
      port map (Clk=>Clk,
                New_PC(5 downto 0)=>New_PC(5 downto 0),
                PC(5 downto 0)=>PC(5 downto 0));
   
   U_Regs_File : File_Regs
      port map (Clk=>Clk,
                RdRegB(3 downto 0)=>RdRegB(3 downto 0),
                RdRegS(3 downto 0)=>Instr(3 downto 0),
                WRData(15 downto 0)=>WrData(15 downto 0),
                WrEn=>RegWr,
                WrReg(3 downto 0)=>WrReg(3 downto 0),
                RdDataB(15 downto 0)=>RdDataB(15 downto 0),
                RdDataS(15 downto 0)=>RdDataS(15 downto 0));
   
   U_ROM : ROM32x24
      port map (Addr(4 downto 0)=>PC(5 downto 1),
                Data(23 downto 0)=>Instr(23 downto 0));
   
end BEHAVIORAL;


