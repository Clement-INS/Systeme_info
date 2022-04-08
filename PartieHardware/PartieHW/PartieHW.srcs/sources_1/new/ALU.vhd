----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 10:11:02
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0);
           N : out STD_LOGIC := '0';
           O : out STD_LOGIC := '0';
           Z : out STD_LOGIC := '0';
           C : out STD_LOGIC := '0';
           S : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

    signal S_16 : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
    
begin 

          
    S_16 <= (( X"00"&A) + (X"00"&B)) when Ctrl_Alu = "00" else 
            (( X"00"&A) - (X"00"&B))when Ctrl_Alu = "01" else
            A * B when Ctrl_Alu = "10"  else
            X"0000"
            ;
        
    N <= '1' when ((B > A) and Ctrl_Alu = "01") else '0';
     
    O <= '1' when (S_16 > X"00FF" and Ctrl_Alu = "10") else '0';
     
    Z <= '1' when (S_16(7 downto 0) = X"00") else '0';      
         
    C <= '1' when (S_16 > X"00FF" and Ctrl_Alu = "00") else '0';  
    
    S <= S_16(7 downto 0); 
    
end Behavioral;
