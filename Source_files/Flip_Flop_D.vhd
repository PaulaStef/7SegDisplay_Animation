library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

	entity Flip_flop_D is
	port(
		D : in BIT;
		Clk : in BIT;
		Q : out BIT
	);
	end Flip_flop_D;
	
	architecture behave of Flip_Flop_D is	
	begin
  process(Clk)
   variable q_temp : BIT;
    begin
  if(Clk'EVENT and Clk='1') then
       q_temp := D;
  end if;
      Q <= q_temp;
  end process;
	end behave;

