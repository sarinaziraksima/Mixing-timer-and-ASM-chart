----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2024 11:22:42 PM
-- Design Name: 
-- Module Name: main - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
        Port ( rst : in STD_LOGIC;                          
       clk : in STD_LOGIC;
       sel : in STD_LOGIC;  
       enable : in STD_LOGIC;                           
       z : out STD_LOGIC;   
       led : out STD_LOGIC;   
       en : out STD_LOGIC;                                             
       outputt : out STD_LOGIC_VECTOR(3 downto 0);
       
       sw1 :  in STD_LOGIC  
       ); 
end main;

architecture Behavioral of main is
COMPONENT mod_m_counter
	  generic(
      N: integer := 13;     -- number of bits
      M: integer := 5208     -- mod-M
  );
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		max_tick : OUT std_logic
		);
	END COMPONENT;
	
	
COMPONENT top
	  
	Port ( rst : in STD_LOGIC;                         
       clk : in STD_LOGIC;                         
                                                   
       z : out STD_LOGIC;                          
                                                   
       outputt : out STD_LOGIC_VECTOR(3 downto 0));
	END COMPONENT;
	
signal ssel,max_tick,max_tick2,sled,clk_in:std_logic;
signal s_outputt : STD_LOGIC_VECTOR(3 downto 0);
begin


	process(clk,sled)
	begin
	if (clk'event and clk='1') then
	if max_tick='0' then
	sled<=not sled;
	end if;
	if sel='0' then
	ssel<=not ssel;
	end if;
	
	
	end if;
	end process;
	
	
	
	
	
	


Inst_top: top 

Port map ( rst => rst,
       clk => clk_in,          
                                                   
       z => z, 
                                                   
       outputt => s_outputt);
	
Inst_mod_m_counter: mod_m_counter 
GENERIC MAP(N=>26 ,M=> 50000000)
PORT MAP(
		clk => clk,
		reset => '1',
		max_tick => max_tick
	);



Inst_mod_m_counter2: mod_m_counter 
GENERIC MAP(N=>27 ,M=> 100000000)
PORT MAP(
		clk => clk,
		reset => '1',
		max_tick => max_tick2
	);


en <='0';

led<=ssel;

with ssel select
clk_in <= max_tick and enable when '1' ,
max_tick2 and enable when others;


outputt(3)<=not(s_outputt(3));
outputt(2)<=not(s_outputt(2));
outputt(1)<=not(s_outputt(1));
outputt(0)<=not(s_outputt(0));
end Behavioral;
