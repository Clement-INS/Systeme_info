----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2022 12:04:02
-- Design Name: 
-- Module Name: test_CheminDesDonnees - Behavioral
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

entity test_CheminDesDonnees is

end test_CheminDesDonnees;
    
architecture Behavioral of test_CheminDesDonnees is
    
    COMPONENT Pipeline 
        Port ( CLK : in STD_LOGIC ;
               rst : in STD_LOGIC ;
               OUTPUTFINAL : out STD_LOGIC_VECTOR (7 downto 0)  );
    end component;
    
    --Inputs
        signal CLK_local : STD_logic := '0';
        signal rst_local : STD_logic := '0';
     --Outputs
        signal OUTPUT : STD_LOGIC_VECTOR (7 downto 0);
    
    constant Clock_period : time := 4 ns;
    
begin
    Label_uut: Pipeline PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
              CLK => CLK_local,
                  rst => rst_local,
                  OUTPUTFINAL => OUTPUT
              
    );

    rst_local <= '0', '1' after 20ns;
    
    Clock_process : process
        begin
            CLK_local <= not(CLK_local);
            wait for Clock_period/2;
        end process;

end Behavioral;
