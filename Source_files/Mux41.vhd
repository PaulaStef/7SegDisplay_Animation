----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 entity MUX41 is
	port(
		i3 : in BIT;
		i2 : in BIT;
		i1 : in BIT;
		i0 : in BIT;
		s0,s1 : in BIT ;
		O : out BIT
	);
	end MUX41;
	
	architecture behave of MUX41 is
	begin
		O <= (i0 and s0 and s1) or (i1 and (not s0) and s1 ) or ( i2 and s0 and (not s1)) or ( i3 and (not s0) and (not s1));
		
	end behave;