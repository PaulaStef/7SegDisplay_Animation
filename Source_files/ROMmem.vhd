
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROMmem is
	port (
	addr : in bit_vector(4 downto 0);
	Mem : out bit_vector (6 downto 0)
		);
end ROMmem;

architecture behave of ROMmem is
constant data0 : bit_vector (6 downto 0) :="0001000";  --A
constant data1 : bit_vector (6 downto 0) :="1100000";  --B
constant data2 : bit_vector (6 downto 0) :="0110001";  --C
constant data3 : bit_vector (6 downto 0) :="1000010";  --D
constant data4 : bit_vector (6 downto 0) :="0110000";  --E
constant data5 : bit_vector (6 downto 0) :="0111000";  --F
constant data6 : bit_vector (6 downto 0) :="0100000";  --G
constant data7 : bit_vector (6 downto 0) :="1001000";  --H
constant data8 : bit_vector (6 downto 0) :="1001111";  --I
constant data9 : bit_vector (6 downto 0) :="1000011";  --J
constant data10 : bit_vector (6 downto 0) :="1011000"; --K
constant data11 : bit_vector (6 downto 0) :="1110001"; --L
constant data12 : bit_vector (6 downto 0) :="1110001"; --M
constant data13 : bit_vector (6 downto 0) :="1101000"; --N
constant data14 : bit_vector (6 downto 0) :="0000001"; --O
constant data15 : bit_vector (6 downto 0) :="0011000"; --P
constant data16 : bit_vector (6 downto 0) :="0010000"; --Q
constant data17 : bit_vector (6 downto 0) :="1101110"; --R
constant data18 : bit_vector (6 downto 0) :="0100100"; --S
constant data19 : bit_vector (6 downto 0) :="0001111"; --T
constant data20 : bit_vector (6 downto 0) :="1000001"; --U
constant data21 : bit_vector (6 downto 0) :="1100011"; --V
constant data22 : bit_vector (6 downto 0) :="1000000"; --W
constant data23 : bit_vector (6 downto 0) :="1101100"; --X
constant data24 : bit_vector (6 downto 0) :="1001100"; --Y
constant data25 : bit_vector (6 downto 0) :="0010010"; --Z

type rom_array is array(0 to 25) of bit_vector(6 downto 0);	

constant rom : rom_array := ( data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,
data16,data17,data18,data19,data20,data21,data22,data23,data24,data25);
begin  
	process(addr) 
	begin
		case addr is
			when "00000" => Mem<=rom(0);
			when "00001" => Mem<=rom(1);
			when "00010" => Mem<=rom(2);
			when "00011" => Mem<=rom(3);
			when "00100" => Mem<=rom(4);
			when "00101" => Mem<=rom(5);
			when "00110" => Mem<=rom(6);
			when "00111" => Mem<=rom(7);
			when "01000" => Mem<=rom(8);
			when "01001" => Mem<=rom(9);
			when "01010" => Mem<=rom(10);
			when "01011" => Mem<=rom(11);
			when "01100" => Mem<=rom(12);
			when "01101" => Mem<=rom(13);
			when "01110" => Mem<=rom(14);
			when "01111" => Mem<=rom(15);
			when "10000" => Mem<=rom(16);
			when "10001" => Mem<=rom(17);
			when "10010" => Mem<=rom(18);
			when "10011" => Mem<=rom(19);
			when "10100" => Mem<=rom(20);
			when "10101" => Mem<=rom(21);
			when "10110" => Mem<=rom(22);
			when "10111" => Mem<=rom(23);
			when "11000" => Mem<=rom(24);
			when "11001" => Mem<=rom(25);
			when others => NULL;
		end case;
	end process;
	
end behave;	
