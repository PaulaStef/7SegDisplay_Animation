----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

 entity Counter2 is
	  port(Clk : in BIT;
	  CLR : in BIT;
      Q : out bit_vector (1 downto 0));
  end Counter2;
  architecture behave of Counter2 is 
  component DFF
  port(D : in BIT;
  Clk : in BIT;
  CL : in BIT;
  q : inout BIT);
  end component;
  Signal D,NQ: BIT;
  Signal Qt: bit_vector (1 downto 0);
  begin 
  NQ <= not Qt(0);
  Bit0: DFF port map(NQ,Clk,CLR,Qt(0));
  D <= Qt(0) xor Qt(1);
  Bit1: DFF port map(D,Clk,CLR,Qt(1)); 
  Q <= Qt;
  end behave;