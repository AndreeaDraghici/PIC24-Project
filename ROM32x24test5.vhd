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
-----------------------------------------------------------------------
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
									x"808101", --0     MOV 0x1020, W1      mov 0x1020, w1 ;INW0=ffff
									x"808112", --1     MOV 0x1022, W2      mov 0x1022, w2 ;INW1=0001
									x"408182", --2     ADD W1, W2, W3      add w1,w2,w3 ;0000, C=1
									x"608282", --3     AND W1, W2, W5      and w1,w2,w5 ;C nemodificat
									x"418182", --4     ADD W3, W2, W3      add w3,w2,w3 ;0001, C=0
									x"518202", --5     SUB W3, W2, W4      sub w3,w2,w4 ;0000, C=1
									x"708302", --6     IOR W1, W2, W6      ior w1,w2,w6 ;C nemodificat
									x"520202", --7     SUB W4, W2, W4      sub w4,w2,w4 ;ffff, C=0
									x"888121", --8     MOV W1, 0x1024      mov w1, 0x1024
									x"888122", --9     MOV W2, 0x1024      mov w2, 0x1024
									x"888123", --10    MOV W3, 0x1024      mov w3, 0x1024
									x"888124", --11    MOV W4, 0x1024      mov w4, 0x1024
									x"888125", --12    MOV W5, 0x1024      mov w5, 0x1024
									x"888126", --13    MOV W6, 0x1024      mov w6, 0x1024
									x"37FFF1", --14    BRA 0x2B8           bra LOOP
									x"000000", --15          
									x"000000", --16          
									x"000000", --17          
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