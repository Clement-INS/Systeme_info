----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 11:31:05
-- Design Name: 
-- Module Name: Test_ALU - Behavioral
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

entity Test_ALU is
--  Port ( );
end Test_ALU;

architecture Behavioral of Test_ALU is

    COMPONENT ALU
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0);
               N : out STD_LOGIC := '0';
               O : out STD_LOGIC := '0';
               Z : out STD_LOGIC := '0';
               C : out STD_LOGIC := '0';
               S : out STD_LOGIC_VECTOR (7 downto 0));
    end COMPONENT;
    
    --Inputs
    signal ALocal : STD_LOGIC_VECTOR (7 downto 0);
    signal BLocal : STD_LOGIC_VECTOR (7 downto 0);
    signal Ctrl_AluLocal : STD_LOGIC_VECTOR (1 downto 0);
    
    --Outputs
    signal NLocal : STD_LOGIC;
    signal OLocal : STD_LOGIC;
    signal ZLocal : STD_LOGIC;
    signal CLocal : STD_LOGIC;
    signal SLocal : STD_LOGIC_VECTOR (7 downto 0);
    
begin

    Label_uut: ALU PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
                       A => ALocal,
                       B => BLocal,
                       Ctrl_Alu => Ctrl_AluLocal,
                       N => NLocal,
                       O => OLocal,
                       Z => ZLocal,
                       C => CLocal,
                       S => SLocal
        );
        
        --Il y a pas d'horloge
        
        -- Stimulus process 
        ALocal <= X"08", X"ff" after 500ns, X"00" after 1000ns;
        BLocal <= X"09", X"ff" after 250ns, X"00" after 750ns;
        Ctrl_AluLocal <= "00", "01" after 400ns, "10" after 800ns; 
end Behavioral;
