library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use IEEE.std_logic_unsigned.all;


entity MUX4_1 is
	  Port( a,b,c,d : in bit_vector(6 downto 0);
	  s0,s1 : in bit;
	  y: out bit_vector(6 downto 0) );
  end MUX4_1;
  
  architecture Behavioral of MUX4_1 is 
  
  component MUX2_1 is
	  Port ( a,b : in bit_vector (6 downto 0);
	  s : in bit ;
	  y: out bit_vector (6 downto 0));
  end component;
  Signal Y1,Y2 : bit_vector (6 downto 0); 
  begin
	  test0 : MUX2_1 port map(a,b,s0,y1);
	  test1 : MUX2_1 port map(c,d,s0,y2);
	  test2 : MUX2_1 port map(y1,y2,s1,y);
  end Behavioral;  

