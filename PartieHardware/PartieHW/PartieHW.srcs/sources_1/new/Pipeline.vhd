----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vigand & Omre
-- 
-- Create Date: 22.04.2022 10:31:27
-- Design Name: 
-- Module Name: CheminDesDonnees - Behavioral
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

entity CheminDesDonnees is
  Port ( CLK : in STD_LOGIC );
end CheminDesDonnees;
    
    
architecture Behavioral of CheminDesDonnees is
    
    component BancDeRegistres
        port(AddrA : in STD_LOGIC_VECTOR (3 downto 0);
               AddrB : in STD_LOGIC_VECTOR (3 downto 0);
               AddrW : in STD_LOGIC_VECTOR (3 downto 0);
               W : in STD_LOGIC;
               DATA : in STD_LOGIC_VECTOR (7 downto 0);
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               --Outputs
               QA : out STD_LOGIC_VECTOR (7 downto 0);
               QB : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component MemDesInstructions
        Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
               CLK : in STD_LOGIC;
               Output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal IP: STD_LOGIC_VECTOR (7 downto 0) := x"00";
    signal InstructionComplete : STD_LOGIC_VECTOR (31 downto 0);
    
    signal A_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
    signal B_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
    signal C_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
    signal OP_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
    
    signal A_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
    signal B_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
    signal C_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
    signal OP_DI_EX : STD_LOGIC_VECTOR (7 downto 0);

    signal A_EX_Mem : STD_LOGIC_VECTOR (7 downto 0);
    signal B_EX_Mem : STD_LOGIC_VECTOR (7 downto 0);
    signal C_EX_Mem : STD_LOGIC_VECTOR (7 downto 0);
    signal OP_EX_Mem : STD_LOGIC_VECTOR (7 downto 0);

    signal A_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    signal B_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    signal C_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    signal OP_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    

begin


    Instructions: MemDesInstructions port map (
       Addr => IP,
       CLK => CLK,
       Output => InstructionComplete
    );
        
    process 
    
    begin
    
        wait until CLK'Event and CLK = '1';
             
            A_LI_DI <= InstructionComplete(15 downto 8);
            B_LI_DI <= InstructionComplete(23 downto 16);
            C_LI_DI <= InstructionComplete(31 downto 24);
            OP_LI_DI <= InstructionComplete(7 downto 0);
            
            if OP_LI_DI = x"06" then 
                A_DI_EX <= A_LI_DI;
                B_DI_EX <= B_LI_DI;
               -- C_DI_EX <= C_LI_DI;
                OP_DI_EX <= OP_LI_DI;
                
                A_EX_Mem <= A_DI_EX;
                B_EX_Mem <= B_DI_EX;
               -- C_EX_Mem <= C_DI_EX;
                OP_EX_Mem <= OP_DI_EX;
                
                A_Mem_RE <= A_EX_Mem;
                B_Mem_RE <= B_EX_Mem;
               -- C_Mem_RE <= C_EX_Mem;
                OP_Mem_RE <= OP_EX_Mem;
            end if;
            
            if IP = x"1F" then
                IP <= x"00";
            else 
                IP <= IP + 1;
            end if;
            
    end process;
    
    AFC: BancDeRegistres PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
       AddrA => X"0",
       AddrB => X"0",
       AddrW => A_Mem_RE ( 3 downto 0),
       W => '1',
       DATA => B_Mem_RE,
       RST => '1',
       CLK => CLK
    );
    
    
        
        
end Behavioral;
