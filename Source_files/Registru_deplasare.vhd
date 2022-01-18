----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registru_deplasare is
	port(
		clk : in BIT;
		SL : in BIT;
		SR : in BIT;
		CL : in BIT;
		S0 : in BIT;
		S1 : in BIT;
		i : in BIT_VECTOR(3 downto 0);
		q : out bit_vector (3 downto 0)
	);
	end Registru_deplasare;	
	
	architecture behave of Registru_deplasare is
	component DFF
	port(
		d : in BIT;
		clk : in BIT;
		CL : in BIT;
		q : out bit
	);
	end component;
	
	component MUX41
	port(
		i0 : in BIT;
		i1 : in BIT;
		i2 : in BIT;
		i3 : in BIT;
		s0,s1 : in BIT;
		o : out BIT
	);
	end component;
	 SIGNAL o,qt: BIT_VECTOR(3 DOWNTO 0); 
	begin  
		 U1:MUX41 PORT MAP(SL, qt(2), i(3), qt(3), s0,s1, o(3));
         U2:MUX41 PORT MAP(qt(3), qt(1), i(2), qt(2), s0,s1, o(2));
         U3:MUX41 PORT MAP(qt(2), qt(0), i(1), qt(1), s0,s1, o(1));
         U4:MUX41 PORT MAP(qt(1), SR, i(0), qt(0), s0,s1, o(0));
         U5:DFF PORT MAP(o(3), clk, CL, qt(3));
         U6:DFF PORT MAP(o(2), clk, CL, qt(2));
         U7:DFF PORT MAP(o(1), clk, CL, qt(1));
         U8:DFF PORT MAP(o(0), clk, CL, qt(0));
         Q <= qt; 
	end behave;

