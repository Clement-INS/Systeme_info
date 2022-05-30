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
         OUTPUTFINAL : out STD_LOGIC_VECTOR (7 downto 0)  );
end Pipeline;
    
    

architecture Behavioral of Pipeline is
    
    component ALU 
        port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0);
               N : out STD_LOGIC := '0';
               O : out STD_LOGIC := '0';
               Z : out STD_LOGIC := '0';
               C : out STD_LOGIC := '0';
               S : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
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
    
    component MemDeDonnees is
        Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
               Input : in STD_LOGIC_VECTOR (7 downto 0);
               RW : in STD_LOGIC;
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               Output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
       
    signal IP: STD_LOGIC_VECTOR (7 downto 0);
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
    signal OP_EX_Mem : STD_LOGIC_VECTOR (7 downto 0);

    signal A_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    signal B_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    signal OP_Mem_RE : STD_LOGIC_VECTOR (7 downto 0);
    
    signal RW_register : std_logic;
    
    signal QA : STD_LOGIC_VECTOR (7 downto 0);
    signal QB : STD_LOGIC_VECTOR (7 downto 0);
    
    signal ctrl_alu_intern : std_logic_vector ( 1 downto 0);
    signal Sortie_Alu : STD_LOGIC_VECTOR ( 7 downto 0);
    
    signal RW_Mem_Des_Donnees : STD_LOGIC;
    signal out_mem_de_donnees : STD_LOGIC_VECTOR ( 7 downto 0);   
    signal addr_mem_des_donnees : STD_LOGIC_VECTOR ( 7 downto 0);
    
begin
    
OUTPUTFINAL <=  A_Mem_RE;

    Instructions: MemDesInstructions port map (
       Addr => IP,
       CLK => CLK,
       Output => InstructionComplete
    );
        
    process 
        variable nb_nop : INTEGER := -1;
        variable old_a : STD_LOGIC_VECTOR (7 downto 0) := x"00";
        variable old_b : STD_LOGIC_VECTOR (7 downto 0) := x"00";
        variable old_c : STD_LOGIC_VECTOR (7 downto 0) := x"00";
        variable old_op : STD_LOGIC_VECTOR (7 downto 0) := x"00";
        
    begin
    
        wait until CLK'Event and CLK = '1';
                
                if rst = '0' then
                       ip <= x"ff";
                             
                       B_LI_DI <= x"00";
                       A_LI_DI <= x"00";
                       OP_LI_DI <= x"00";
                       C_LI_DI <= x"00";
                            
                       A_DI_EX <= x"00";
                       B_DI_EX <= x"00";
                       C_DI_EX <= x"00";
                       OP_DI_EX <= x"00";
                                
                       A_EX_Mem <= x"00";
                       B_EX_Mem <= x"00";
                       OP_EX_Mem <= x"00";
                                
                       A_Mem_RE <= x"00";
                       B_Mem_RE <= x"00";
                       OP_Mem_RE <= x"00";
                
                else 
                       
                        A_DI_EX <= A_LI_DI;
                        if OP_LI_DI = x"05" or OP_LI_DI = x"01" or OP_LI_DI = x"02" or OP_LI_DI = x"03" or OP_LI_DI = x"04" or OP_LI_DI = x"0e" then
                            B_DI_EX <= QA;
                        else
                            B_DI_EX <= B_LI_DI;
                        end if;               
                        C_DI_EX <= QB;
                        OP_DI_EX <= OP_LI_DI;
                        
                        A_EX_Mem <= A_DI_EX;
                        if OP_DI_EX = x"01" or OP_DI_EX = x"02" or OP_DI_EX = x"03" or OP_DI_EX = x"04" then
                            B_EX_MEM <= Sortie_Alu;
                        else
                            B_EX_Mem <= B_DI_EX;
                        end if;
                        OP_EX_Mem <= OP_DI_EX;
                        
                        A_Mem_RE <= A_EX_Mem;
                        if OP_EX_Mem = x"0d" then
                            B_Mem_RE <= out_mem_de_donnees;
                        else
                            B_Mem_RE <= B_EX_Mem;
                        end if;
                        OP_Mem_RE <= OP_EX_Mem;
                        
                            --cas aleéa de donnée
                        if (nb_nop < 0)
                         and (((OP_LI_DI = x"05" or OP_LI_DI = x"0e") and B_LI_DI = A_DI_EX and (OP_DI_EX = x"06" or OP_DI_EX = x"01" or OP_DI_EX = x"02" or OP_DI_EX = x"03"))
                         or ((OP_LI_DI = x"05" or OP_LI_DI = x"0e") and B_LI_DI = A_EX_Mem and (OP_EX_Mem = x"06" or OP_EX_Mem = x"01" or OP_EX_Mem = x"02" or OP_EX_Mem = x"03"))
                         or ((OP_LI_DI = x"05" or OP_LI_DI = x"0e") and B_LI_DI = A_Mem_RE and (OP_Mem_RE = x"06" or OP_Mem_RE = x"01" or OP_Mem_RE = x"02" or OP_Mem_RE = x"03"))
                         or ((OP_LI_DI = x"01" or OP_LI_DI = x"02" or OP_LI_DI = x"03") and (B_LI_DI = A_DI_EX or C_LI_DI = A_DI_EX) and (OP_DI_EX = x"06" or OP_DI_EX = x"01" or OP_DI_EX = x"02" or OP_DI_EX = x"03"))
                         or ((OP_LI_DI = x"01" or OP_LI_DI = x"02" or OP_LI_DI = x"03") and (B_LI_DI = A_EX_Mem or C_LI_DI = A_EX_Mem) and (OP_EX_Mem = x"06" or OP_EX_Mem = x"01" or OP_EX_Mem = x"02" or OP_EX_Mem = x"03"))
                         or ((OP_LI_DI = x"01" or OP_LI_DI = x"02" or OP_LI_DI = x"03") and (B_LI_DI = A_Mem_RE or C_LI_DI = A_Mem_RE) and (OP_Mem_RE = x"06" or OP_Mem_RE = x"01" or OP_Mem_RE = x"02" or OP_Mem_RE = x"03")))
                         then
                            report "cas 1";
                            old_a := A_LI_DI;
                            old_b := B_LI_DI;
                            old_c := C_LI_DI;
                            old_op := OP_LI_DI;
                            nb_nop := 2;
                            B_LI_DI <= x"00";
                            A_LI_DI <= x"00";
                            OP_LI_DI <= x"00";
                            C_LI_DI <= x"00";
                            B_DI_EX <= x"00";
                            A_DI_EX <= x"00";
                            OP_DI_EX <= x"00";
                            C_DI_EX <= x"00";
                            IP <= IP - 1;
                            --Cas normal
                        elsif nb_nop < 0 then
                            report "cas 2";
                            B_LI_DI <= InstructionComplete(15 downto 8);
                            A_LI_DI <= InstructionComplete(23 downto 16);
                            OP_LI_DI <= InstructionComplete(31 downto 24);
                            C_LI_DI <= InstructionComplete(7 downto 0);
                            IP <= IP + 1;
                        --Cas après des NOP    
                        elsif nb_nop = 0 then
                            report "cas 3";
                            B_LI_DI <= old_b;
                            A_LI_DI <= old_a;
                            OP_LI_DI <= old_op;
                            C_LI_DI <= old_c;
                        -- Pendant des NOP
                        else
                            report "cas 4";
                            B_LI_DI <= x"00";
                            A_LI_DI <= x"00";
                            OP_LI_DI <= x"00";
                            C_LI_DI <= x"00";
                        end if;
                        
                        nb_nop := nb_nop-1;
                    
            end if;
            
    end process;
    
    RW_register <= '1' when op_mem_re = x"06" or op_mem_re = x"05" or op_mem_re = x"01" or op_mem_re = x"02" or op_mem_re = x"03" or op_mem_re = x"04" or op_mem_re = x"0d" else '0';
    
    ctrl_alu_intern <= "00" when OP_DI_EX = x"01" else "10" when OP_DI_EX = x"02" else "01" when OP_DI_EX = x"03" else "11";
    
    RW_Mem_Des_Donnees <= '0' when OP_EX_Mem = x"0e" else '1';

    addr_mem_des_donnees <= B_EX_MEM when OP_EX_MEM = x"0d" else A_EX_MEM;
       
    AFC: BancDeRegistres PORT MAP ( --Fait gaffe, c'est " ,"  à la fin de chaque ligne, pas " ; "
       AddrA => B_LI_DI (3 downto 0),
       AddrB => C_LI_DI (3 downto 0),
       AddrW => A_Mem_RE ( 3 downto 0),
       W => RW_register, 
       DATA => B_Mem_RE,
       RST => rst,
       CLK => CLK,
       QA => QA,
       QB => QB
    );
     UAL : ALU port map ( A => B_DI_EX,
                  B => C_DI_EX,
                  Ctrl_Alu => ctrl_alu_intern,
--                  N => '0',
--                  O => '0',
--                  Z => '0',
--                  C => '0',
                  S => Sortie_Alu
     );
     
     memoire : MemDeDonnees Port map( 
        Addr => addr_mem_des_donnees,
        Input => B_EX_mem,
        RW => RW_Mem_Des_Donnees,
        RST => '0',
        CLK => CLK,
        Output => out_mem_de_donnees
    );
   
end Behavioral;
