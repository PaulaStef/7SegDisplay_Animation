----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registru7_biti is
	port(
		sin : in BIT_VECTOR(6 downto 0);
		Clk : in BIT;
		sout : out bit_vector(6 downto 0)
	);
	end Registru7_biti;
	
	architecture behave of Registru7_biti is
	component Flip_flop_D
	port(
		D : in BIT;
		Clk : in BIT;
		Q : out bit
	);
	end component;
	begin  
		D0: Flip_flop_D port map(sin(0),Clk,sout(0));
		D1: Flip_flop_D port map(sin(1),Clk,sout(1));
		D2: Flip_flop_D port map(sin(2),Clk,sout(2));
		D3: Flip_flop_D port map(sin(3),Clk,sout(3));
		D4: Flip_flop_D port map(sin(4),Clk,sout(4));
		D5: Flip_flop_D port map(sin(5),Clk,sout(5));
		D6: Flip_flop_D port map(sin(6),Clk,sout(6));
		
	end behave;

