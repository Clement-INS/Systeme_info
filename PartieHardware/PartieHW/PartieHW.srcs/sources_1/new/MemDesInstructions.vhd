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
--    GEN_REG:
--     for i in 0 to 15 generate
--        Memory(i) <= x"05040900";
--     end generate GEN_REG;
     Memory<= (x"06040400",x"06050500", x"06060600",x"05070400",x"05080500", others=>x"00000000");
--     Memory(1)<= x"06040900";
--     Memory(2)<= x"06040900";
--     Memory(3)<= x"06040900";
--     Memory(4)<= x"06040900";
--          Memory(5)<= x"06040900";
--          Memory(6)<= x"06040900";
--          Memory(7)<= x"06040900";
--               Memory(8)<= x"06040900";
--               Memory(9)<= x"06040900";
--               Memory(10)<= x"06040900";
--                    Memory(11)<= x"06040900";
--                    Memory(12)<= x"06040900";
--                    Memory(13)<= x"06040900";
--                         Memory(14)<= x"06040900";
--                         Memory(15)<= x"06040900";
     
     process
     
     begin
        wait until CLK'Event and CLK = '1';
        Output <= Memory(to_integer(unsigned(Addr(3 downto 0))));
     end process;

end Behavioral;
