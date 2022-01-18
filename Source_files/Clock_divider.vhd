
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Clock_divider is
		port (
		Clk : in BIT;
		Reset : in BIT;
		sout : out Bit_vector(1 downto 0)
			);
	end Clock_divider;
	
	architecture behave of Clock_divider is	
	begin 
	process
	variable a:integer:=0;
	variable b:bit_vector (1 downto 0):="00";
	begin 
	 if(Reset='1') then
		a:=0; b:="00";
	 elsif clk='1' and clk'event then
	  a:=a+1;
	  if a=100000000 and b="00" then
		   b:="01"; a:=0;
	   elsif a=100000000 and b="01" then
		   b:="10"; a:=0;
	   elsif a=100000000 and b="10" then
		   b:="11"; a:=0;
	   elsif a=100000000 and b="11" then
		   b:="00"; a:=0;
	   end if;
	 end if;
	 sout <=b;
	 wait on clk;
	end process;		
	end behave;

