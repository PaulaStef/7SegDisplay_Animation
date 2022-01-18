library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use IEEE.std_logic_unsigned.all;
  
  	---------- MUX 2:1   ------
  entity MUX2_1 is 	
	  Port(	 a,b : in bit_vector(6 downto 0);
	  s : in bit;  
	  y: out bit_vector(6 downto 0) );
  end MUX2_1; 
  
  architecture Behavioral of MUX2_1 is
  
  begin
	  y(0) <= (s and b(0) ) or ( (not s ) and a(0) ); 
	  y(1) <= (s and b(1) ) or ( (not s ) and a(1) );
	  y(2) <= (s and b(2) ) or ( (not s ) and a(2) );
	  y(3) <= (s and b(3) ) or ( (not s ) and a(3) );
	  y(4) <= (s and b(4) ) or ( (not s ) and a(4) );
	  y(5) <= (s and b(5) ) or ( (not s ) and a(5) );
	  y(6) <= (s and b(6) ) or ( (not s ) and a(6) );
  end Behavioral;  

