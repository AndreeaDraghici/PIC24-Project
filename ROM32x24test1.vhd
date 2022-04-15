----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:   
-- Design Name: 
-- Module Name:    ROM32x24 - Behavioral 
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
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM32x24 is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24;

architecture ROM32x24_arch of ROM32x24 is

-- The following code must appear before the "begin" keyword in the architecture
-- body.

    type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
    constant ROM : tROM :=(
								   x"808101", -- 0   MOV 0x1020, W1               
								   x"808112", -- 1   MOV 0x1022, W2               
								   x"408182", -- 2   ADD W1, W2, W3               
								   x"508202", -- 3   SUB W1, W2, W4               
								   x"608282", -- 4   AND W1, W2, W5               
								   x"708302", -- 5   IOR W1, W2, W6               
								   x"DD0B82", -- 6   SL W1, W2, W7                
								   x"B20052", -- 7   AND #0x5, W2                 
								   x"FB8202", -- 8   ZE W2, W4                    
								   x"188282", -- 9   SUBBR W1, W2, W5             
								   x"320000", -- 10   BRA Z, 0x2CE                
												 -- 											  
								   x"888121", -- 11   MOV W1, 0x1024              
								   x"888122", -- 12  MOV W2, 0x1024               
								   x"888123", -- 13   MOV W3, 0x1024              
								   x"888124", -- 14   MOV W4, 0x1024              
								   x"888125", -- 15  MOV W5, 0x1024               
								   x"888126", -- 16   MOV W6, 0x1024              
								   x"37FFEE", -- 17   BRA 0x2B8                   
									
									x"000000", --18
									x"000000", --19
									x"000000", --20
									x"000000", --21
									x"000000", --22
									x"000000", --23
									x"000000", --24
									x"000000", --25
									x"000000", --26
									x"000000", --27
									x"000000", --28
									x"000000", --29
									x"000000", --30
									x"000000" --31
									);  
begin

Data <= ROM(conv_integer(Addr));

end ROM32x24_arch;