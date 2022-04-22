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
    Type RegisterArray is Array(15 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    signal Memory : RegisterArray;
    
begin
     Memory(0)<= x"06040900";
     
     process
     
     begin
        wait until CLK'Event and CLK = '1';
        Output <= Memory(to_integer(unsigned(Addr)));
     end process;

end Behavioral;
