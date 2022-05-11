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

entity Pipeline is
  Port ( CLK : in STD_LOGIC ;
  rst : in STD_LOGIC ;
          OUTPUT : out STD_LOGIC_VECTOR (7 downto 0)  );
end Pipeline;
    
    
architecture Behavioral of Pipeline is
    
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
    
    signal IP: STD_LOGIC_VECTOR (7 downto 0);  --pourqoui c'est vert?
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
    
    signal mem_re_lc : std_logic;
    signal LI_DI_MUX : STD_LOGIC_VECTOR (3 downto 0); 
    
    signal QA : STD_LOGIC_VECTOR (7 downto 0);
    signal QB : STD_LOGIC_VECTOR (7 downto 0);

begin
    
output <=  A_Mem_RE;

    Instructions: MemDesInstructions port map (
       Addr => IP,
       CLK => CLK,
       Output => InstructionComplete
    );
        
    process 
    
    begin
    
        wait until CLK'Event and CLK = '1';
                
                if rst = '0' then
                       ip <= x"00";
                             
                       B_LI_DI <= x"00";
                       A_LI_DI <= x"00";
                       OP_LI_DI <= x"00";
                       C_LI_DI <= x"00";
                            
                            --if OP_LI_DI = x"06" then 
                       A_DI_EX <= x"00";
                       B_DI_EX <= x"00";
                       C_DI_EX <= x"00";
                       OP_DI_EX <= x"00";
                                
                       A_EX_Mem <= x"00";
                       B_EX_Mem <= x"00";
                       C_EX_Mem <= x"00";
                       OP_EX_Mem <= x"00";
                                
                       A_Mem_RE <= x"00";
                       B_Mem_RE <= x"00";
                       C_Mem_RE <= x"00";
                       OP_Mem_RE <= x"00";
                
                else 
             
            B_LI_DI <= InstructionComplete(15 downto 8);
            A_LI_DI <= InstructionComplete(23 downto 16);
            OP_LI_DI <= InstructionComplete(31 downto 24);
            C_LI_DI <= InstructionComplete(7 downto 0);
            
            --if OP_LI_DI = x"06" then 
                A_DI_EX <= A_LI_DI;
                if OP_LI_DI = x"06" then
                    B_DI_EX <= B_LI_DI;
                elsif OP_LI_DI = x"05" then
                    B_DI_EX <= QA;
                end if;               
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
            --end if;
                IP <= IP + 1;
            end if;
            
    end process;
    mem_re_lc <= '1' when op_mem_re = x"06" or op_mem_re = x"05" else '0';
    LI_DI_MUX <=  B_LI_DI (3 downto 0);
    
    AFC: BancDeRegistres PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
       AddrA => LI_DI_MUX,
       AddrB => X"0",
       AddrW => A_Mem_RE ( 3 downto 0),
       W => mem_re_lc, -- c'est pas juste je crois
       DATA => B_Mem_RE,
       RST => rst,
       CLK => CLK,
       QA => QA,
       QB => QB
    );
    
    
        
        
end Behavioral;
