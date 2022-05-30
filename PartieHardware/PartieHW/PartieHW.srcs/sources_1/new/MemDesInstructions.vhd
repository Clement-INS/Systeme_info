----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 11:47:15
-- Design Name: 
-- Module Name: MemDesInstructions - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemDesInstructions is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end MemDesInstructions;

architecture Behavioral of MemDesInstructions is
    Type RegisterArray is Array(0 to 15) of STD_LOGIC_VECTOR(31 downto 0);
    signal Memory : RegisterArray;
    
begin

--     Memory<= (x"06040300",x"06050200", x"06060600",x"05070400",x"05080500",x"01000405",X"02010405", X"03020405",others=>x"00000000");*
--     Memory<= (x"06040300",x"06050200", x"06060100", x"0d000200",others=>x"00000000");
--       Memory <= (x"0e000100", x"0d000000", others=> x"00000000");
    -- AFC puis COP
--        Memory <= (x"00000000", x"06010300", x"05020100",x"06010400", x"05030100", others=> x"00000000");
    -- AFC ADD MUL SOU
    Memory <= (x"06000200", x"06010300", x"00000000", x"0e030000",x"0d040300",others=> x"00000000");
     process
     
     begin
        wait until CLK'Event and CLK = '1';
        Output <= Memory(to_integer(unsigned(Addr(3 downto 0))));
     end process;

end Behavioral;
