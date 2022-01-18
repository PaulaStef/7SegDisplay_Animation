----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 ENTITY DFF IS
      PORT(d, clk,CL : IN BIT;
           q : OUT BIT);
    END DFF;
	
  Architecture behave OF DFF IS
  begin
	  process(clk)
  variable q_temp : BIT;
 begin
  IF(CL= '1') then
	  q_temp :='0';
  elsif(clk'EVENT and clk='1') then
       q_temp := d;
  end if;
     q <= q_temp;
  end process;
 end behave;

