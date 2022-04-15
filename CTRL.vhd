----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity CTRL is
Port ( OP 		 : in  STD_LOGIC_VECTOR (4 downto 0);
           ALUOP   : out  STD_LOGIC_VECTOR (3 downto 0);
           MemWr   : out  STD_LOGIC;
           Mem2Reg : out  STD_LOGIC;
           RegWr 	 : out  STD_LOGIC;
           RegDest : out  STD_LOGIC;
           RegBase : out  STD_LOGIC;
           Branch  : out  STD_LOGIC;
           N_En    : out  STD_LOGIC;
           OV_En   : out  STD_LOGIC;
           Z_En    : out  STD_LOGIC;
           C_En    : out  STD_LOGIC);
end CTRL;

architecture Behavioral of CTRL is

begin

   MemWr <= '1' when OP="10001" else '0'; -- MOV Wns, f
	Mem2Reg <= '1' when OP="10000" else '0'; -- MOV f, Wnd
	RegWr <= '0' when (OP="00110" or OP="10001") else '1';
	Branch <= '1' when OP="00110" else '0';
	RegDest <= '0' when (OP="10000" or OP="10110") else '1';   
	RegBase <= '0' when OP="11011" else '1';								
	
	ALUOP <= "0000" when OP="01000" else  -- ADD
				"0001" when OP="01010" else  -- SUB
				"0010" when OP="01100" else  -- AND
				"0011" when OP="01110" else  -- IOR
				"0100" when OP="11011" else  -- SL
				"0101" when OP="10110" else  -- AND
				"0110" when OP="11111" else  -- ZE
				"0111" when OP="00011";      -- SUBBR
	
	N_En <= '1' when (OP="01000" or     -- ADD 
							OP="01010" or     -- SUB 
							OP="01100" or     -- AND
							OP="01110" or     -- IOR
							OP="11011" or     -- SL
							OP="10110" or     -- AND
							OP="11111" or     -- ZE
							OP="00011") else  -- SUBBR
			  '0';
	
	OV_En <= '1' when (OP="01000" or    -- ADD
							 OP="01010" or    -- SUB
							 OP="00011") else -- SUBBR
			  '0';
			  
	Z_En <= '1' when (OP="01000" or     -- ADD
							OP="01010" or     -- SUB
							OP="01100" or     -- AND
						   OP="01110" or     -- IOR
							OP="11011" or     -- SL
							OP="10110" or     -- AND
							OP="11111" or     -- ZE
							OP="00011") else  -- SUBBR
			  '0';
	
	C_En <= '1' when (OP="01000" or     -- ADD 
							 OP="01010" or    -- SUB
							 OP="11111" or    -- ZE
							 OP="00011") else -- SUBBR
			  '0';

end Behavioral;
