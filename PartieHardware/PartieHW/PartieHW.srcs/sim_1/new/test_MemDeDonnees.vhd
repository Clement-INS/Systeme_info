----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 12:01:38
-- Design Name: 
-- Module Name: test_MemDeDonnees - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_MemDeDonnees is
--  Port ( );
end test_MemDeDonnees;

architecture Behavioral of test_MemDeDonnees is
        
        
        COMPONENT MemDeDonnees
             Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
                  Input : in STD_LOGIC_VECTOR (7 downto 0);
                  RW : in STD_LOGIC;
                  RST : in STD_LOGIC;
                  CLK : in STD_LOGIC;
                  Output : out STD_LOGIC_VECTOR (7 downto 0));
         end COMPONENT;
         
         --Inputs
         signal Addr_local : STD_LOGIC_VECTOR(7 downto 0);
         signal Input_local : STD_LOGIC_VECTOR(7 downto 0);
         signal RW_local : STD_LOGIC;
         signal RST_local : STD_LOGIC;
         signal CLK_local : STD_LOGIC := '0';
         
         --Output
         signal Output_local : STD_LOGIC_VECTOR (7 downto 0);
         
         -- Clock period definitions
         constant Clock_period : time := 10 ns;
begin
         Label_uut: MemDeDonnees PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
                       Addr => Addr_local,
                       Input => Input_local,
                       RW => RW_Local,
                       RST => RST_local,
                       CLK => CLK_local,
                       Output => Output_local

        );
        
        Clock_process : process
               begin
                   CLK_local <= not(CLK_local);
                   wait for Clock_period/2;
               end process;
                
        --Stimulus process
        Addr_local <= "00000011", x"01" after 300ns;
        Input_local <= x"a9";
        RW_local <= '1', '0' after 100ns, '1' after 200ns, '0' after 400ns;
        RST_local <= '0', '1' after 50ns, '0' after 60ns; 
        
        
           
end Behavioral;
