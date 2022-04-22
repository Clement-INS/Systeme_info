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
    
    COMPONENT CheminDesDonnees 
        Port ( CLK : in STD_LOGIC );
    end Component;
    
    --Inputs
    signal CLK_local : STD_logic := '0';
    signal addr_local : STD_logic_vector (3 downto 0);
    --outputs
    signal output_local : std_logic_vector (7 downto 0);
    
begin
    Label_uut: CheminDesDonnees PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
              CLK => CLK_local
    );
    
    -- On aura deux fils sur le meme inputs si on met addrW => qqc, mais on est obligé de mettre des trucs sur les inputs donc wtf?
    Label_uut1: BancDeRegistres port map(
        AddrA => addr_local,
        
        AddrB => X"0",
        AddrW => A_Mem_RE ( 3 downto 0),
        W => '1',
        DATA => B_Mem_RE,
        RST => '1',
        CLK => CLK

    );

end Behavioral;
