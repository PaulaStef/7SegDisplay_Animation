--------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMUX_anim is
	port(
		X : in BIT;
		s0 : in BIT;
		s1 : in BIT;
		y1 : out BIT;
		y2 : out BIT;
		y3 : out BIT;
		y4 : out BIT
	);
	end DMUX_anim;
		architecture behave of DMUX_anim is
		begin 
			y4 <= X and s0 and s1;  
			y3 <= X and s1 and (not s0);
			y2 <= X and (not s1) and s0;
			y1 <= X and (not s1) and (not s0);
			
		end behave;



