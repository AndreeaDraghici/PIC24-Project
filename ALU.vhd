----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:51:33 12/30/2021
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Clk 	 : in  STD_LOGIC;
           RdDataB : in  STD_LOGIC_VECTOR (15 downto 0);
           RdDataS : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOP 	 : in  STD_LOGIC_VECTOR (3 downto 0);
           N_En 	 : in  STD_LOGIC;
           OV_En   : in  STD_LOGIC;
           Z_En 	 : in  STD_LOGIC;
           C_En 	 : in  STD_LOGIC;
			  C_Status: in  STD_LOGIC;
           N 		 : out STD_LOGIC;
           OV 		 : out STD_LOGIC;
           Z 		 : out STD_LOGIC;
           C 		 : out STD_LOGIC;
           Y 		 : out STD_LOGIC_VECTOR (15 downto 0);
			  ANDlit  : in STD_LOGIC_VECTOR (9 downto 0));
end ALU;

architecture Behavioral of ALU is
	signal result 	 : STD_LOGIC_VECTOR(16 downto 0);
	signal zero 	 : STD_LOGIC;
	signal negative : STD_LOGIC;
	signal overflow : STD_LOGIC;
	signal carry    : STD_LOGIC;
	signal null_word : STD_LOGIC_VECTOR(16 downto 0);
	signal tempSL    : STD_LOGIC_VECTOR(16 downto 0);
	signal shiftVal  : STD_LOGIC_VECTOR(4 downto 0);
	

begin	
	
	null_word <= x"0000"&b"0";  --- zero-extended 
	shiftVal <= RdDataS(4 downto 0); --- shift left 5 bits
	
	tempSL <= x"0000"&b"0" when shiftVal(4) = '1' else
                 b"0"&RdDataB((15 - conv_integer(shiftVal)) downto 0)&null_word((conv_integer(shiftVal) - 1) downto 0);
					  
with ALUOP select	
	result <= (('0'&RdDataB) + ('0'&RdDataS)) when "0000",                    --- ADD Wb, Ws, Wd
				 (('0'&RdDataB) + ('0'&(not RdDataS)) + 1) when "0001",          --- SUB Wb, Ws, Wd  --la scadere transportul negat are semnificatia de imprumut.
				 (('0'&RdDataB) and ('0'&RdDataS)) when "0010",                  --- AND Wb, Ws, Wd
				 (('0'&RdDataB) or ('0'&RdDataS)) when "0011",                   --- IOR Wb, Ws, Wd
				 tempSL when "0100",                                             --- SL Wb, Wns, Wnd
				 (('0'&RdDataS) and (b"000_0000"& ANDlit)) when "0101",          --- AND #lit10, Wn
				 (('0'&null_word(15 downto 8)&RdDataS(7 downto 0))) when "0110", --- ZE Ws, Wnd 
				 (('0'&RdDataS) + ('0'&(not RdDataB)) + 1 - (not C_Status)) when "0111", --- SUBBR Wb, Ws, Wd
				 x"0000"&b"0" when others;	
				
				
	Y <= result(15 downto 0);
	
	zero <= '1' when result(15 downto 0)=x"0000" else '0'; 
	Z <= zero when rising_edge(Clk) and Z_En='1';
	
	negative <= '0' when ALUOP="0110" else
					result(15);
	N <= negative when rising_edge(Clk) and N_En='1';
	
	overflow <= '1' when ((ALUOP="0000" and RdDataB(15)=RdDataS(15) and result(15)=(not RdDataB(15))) or
								((ALUOP="0001" or ALUOP="0111") and RdDataB(15)=(not RdDataS(15)) and result(15)=RdDataS(15))) else
					'0';
	OV <= overflow when rising_edge(Clk) and OV_En='1';
	
	carry <= result(16) when (ALUOP="0000" or ALUOP="0001" or ALUOP="0111") else
				'1' when ALUOP="0110";
	C <= carry when rising_edge(Clk) and C_En='1';
				 
end Behavioral;

