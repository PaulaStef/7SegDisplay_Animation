
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMUX1_4  is
	port(
		a : in BIT_VECTOR(6 downto 0);
		s0 : in BIT;
		s1 : in BIT;
		y1 : out BIT_VECTOR(6 downto 0);
		y2 : out BIT_VECTOR(6 downto 0);
		y3 : out BIT_VECTOR(6 downto 0);
		y4 : out BIT_VECTOR(6 downto 0)
	);
  end DMUX1_4;
  
  architecture behave of DMUX1_4 is 
  component DMUX_anim
	port(
		X : in BIT;
		s0 : in BIT;
		s1 : in BIT;
		y1 : out BIT;
		y2 : out BIT;
		y3 : out BIT;
		y4 : out BIT
	);
	end component;
	begin 
		OUT1 : DMUX_anim port map(a(0),s0,s1,y1(0),y2(0),y3(0),y4(0)); 
		OUT2 : DMUX_anim port map(a(1),s0,s1,y1(1),y2(1),y3(1),y4(1));
		OUT3 : DMUX_anim port map(a(2),s0,s1,y1(2),y2(2),y3(2),y4(2));
		OUT4 : DMUX_anim port map(a(3),s0,s1,y1(3),y2(3),y3(3),y4(3));
		OUT5 : DMUX_anim port map(a(4),s0,s1,y1(4),y2(4),y3(4),y4(4));
		OUT6 : DMUX_anim port map(a(5),s0,s1,y1(5),y2(5),y3(5),y4(5));
		OUT7 : DMUX_anim port map(a(6),s0,s1,y1(6),y2(6),y3(6),y4(6));
		
	end behave; 

