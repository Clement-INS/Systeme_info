----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 10:46:38
-- Design Name: 
-- Module Name: test_BancDeRegistres - Behavioral
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

entity test_BancDeRegistres is
--  Port ( );
end test_BancDeRegistres;

architecture Behavioral of test_BancDeRegistres is
    
    
    COMPONENT BancDeRegistres 
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
    end COMPONENT;
    
    --Inputs
    signal AddrA_local : STD_LOGIC_VECTOR (3 downto 0);
    signal AddrB_local : STD_LOGIC_VECTOR (3 downto 0);
    signal AddrW_local : STD_LOGIC_VECTOR (3 downto 0);
    signal W_local : STD_LOGIC;
    signal DATA_local : STD_LOGIC_VECTOR (7 downto 0);
    signal RST_local : STD_LOGIC;
    signal CLK_local : STD_LOGIC := '0';
    
    --Outputs
    signal QA_local : STD_LOGIC_VECTOR (7 downto 0);
    signal QB_local : STD_LOGIC_VECTOR (7 downto 0); 
    
    -- Clock period definitions
     constant Clock_period : time := 4 ns;
             
begin

    Label_uut: BancDeRegistres PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
                       AddrA => AddrA_local,
                       AddrB => AddrB_local,
                       AddrW => AddrW_local,
                       W => W_Local,
                       DATA => DATA_local,
                       RST => RST_local,
                       CLK => CLK_local,
                       QA => QA_local,
                       QB => QB_local
        );
        
        Clock_process : process
                begin
                    CLK_local <= not(CLK_local);
                wait for Clock_period/2;
        end process;
              
        -- Stmulus process
        AddrA_local <= "1100", "1111" after 500ns;
        AddrB_local <= "0010"; 
        AddrW_local <= "0101", "0010" after 100ns, "1111" after 500ns;
        W_local <= '0', '1' after 50ns, '0' after 250ns, '1' after 600ns, '0' after 800ns; 
        DATA_local <= X"ff", X"aa" after 150ns; 
        RST_local <= '1', '0' after 10ns, '1' after 20ns, '0' after 700ns;

end Behavioral;
