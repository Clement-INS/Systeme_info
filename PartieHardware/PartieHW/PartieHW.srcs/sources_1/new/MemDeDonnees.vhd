----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 11:47:15
-- Design Name: 
-- Module Name: MemDeDonnees - Behavioral
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

entity MemDeDonnees is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           Input : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end MemDeDonnees;

architecture Behavioral of MemDeDonnees is

    Type RegisterArray is Array(0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal Memory : RegisterArray;
    
begin
    Output <= Memory(to_integer(unsigned(Addr)));
    
    process
        
    begin
      
        wait until CLK'Event and CLK = '1';
        if RST = '1' then
            Memory <= (others => x"00");
        elsif RW = '0' then
           Memory(to_integer(unsigned(Addr))) <= Input; 
            --Memory <= (x"01", x"02", x"03", others => x"00");
           
            
        end if;
        
    end process;
    
end Behavioral;
