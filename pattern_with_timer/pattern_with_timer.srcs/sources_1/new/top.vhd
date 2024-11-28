----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2024 06:09:34 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;

           z : out STD_LOGIC;

           outputt : out STD_LOGIC_VECTOR(3 downto 0));
end top;

architecture Behavioral of top is

TYPE state IS (s0, s1, s2, s3, s4, s5);
SIGNAL Present_State, Next_State: state;


begin

U_Mealy: PROCESS(clk, rst)
BEGIN
   
   
    IF rising_edge(clk) THEN
        IF(rst = '0') THEN        
             Present_State <= s0; 
        else
             Present_State <= Next_State;
    END IF;
    END IF;
END PROCESS;

Next_State_Output: 
PROCESS (Present_State)
BEGIN
    Next_State <= Present_State;
    z <= '0';

    CASE Present_State IS
        WHEN s0 =>
            outputt<="0000";
            Next_State <= s1; 
        WHEN s1 =>
            outputt<="0001";
            Next_State <= s2; 
            
        WHEN s2 =>
            outputt<="1001";
            Next_State <= s3; 
            
            
            
            
            
            
        WHEN s3 =>
            outputt<="1000";
            Next_State <= s4; 
            
            
        WHEN s4 =>
            outputt<="0111";
            Next_State <= s5; 
        WHEN s5 =>
            outputt<="1111";
            z <= '1' ;
            Next_State <= s0; 
    END CASE;
    
    
END PROCESS;




end Behavioral;
