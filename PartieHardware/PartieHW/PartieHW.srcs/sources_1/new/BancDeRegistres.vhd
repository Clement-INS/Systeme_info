----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 09:58:27
-- Design Name: 
-- Module Name: BancDeRegistres - Behavioral
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

entity BancDeRegistres is
    Port ( AddrA : in STD_LOGIC_VECTOR (3 downto 0);
           AddrB : in STD_LOGIC_VECTOR (3 downto 0);
           AddrW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           --Outputs
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end BancDeRegistres;

architecture Behavioral of BancDeRegistres is
    
    Type RegisterArray is Array(15 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal Registers : RegisterArray;
begin
    
    QA <= Registers(to_integer(unsigned(AddrA)));
    QB <= Registers(to_integer(unsigned(AddrB)));      

    process    
    begin
        wait until CLK'Event and CLK = '1';
        if RST = '0' then
            Registers <= (others => X"00");
        end if;
        if W = '1' then
            Registers(to_integer(unsigned(AddrW))) <= DATA;
        end if;
 
    end process;
    
end Behavioral;
