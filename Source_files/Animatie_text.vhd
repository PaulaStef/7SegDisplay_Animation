library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use IEEE.std_logic_unsigned.all;
	
	entity Animatie_text is
		port (
		Anim : in bit_vector (1 downto 0); 
		Clock : in bit;
		Anod : out bit_vector (3 downto 0);
		segment : out bit_vector (6 downto 0)
			);
	end Animatie_text;  
	
	architecture Behavioral of Animatie_text is	 
	
	component MUX4_1 is
	  Port( a,b,c,d : in bit_vector(6 downto 0);
	  s0,s1 : in bit;
	  y: out bit_vector(6 downto 0) );
    end component; 
	
	component mux_4to1 is
      port(
 
     A,B,C,D : in bit_vector (4 downto 0);
     S0,S1: in bit;
     Z: out bit_vector (4 downto 0) );
     end component;
	
	component Comp5_bit is
	  Port( a,b : in bit_vector (4 downto 0);
	  H,L,E : out bit );
    end component;	
	
	  component DMUX1_4  is
	port(
		a : in BIT_VECTOR(6 downto 0);
		s0 : in BIT;
		s1 : in BIT;
		y1 : out BIT_VECTOR(6 downto 0);
		y2 : out BIT_VECTOR(6 downto 0);
		y3 : out BIT_VECTOR(6 downto 0);
		y4 : out BIT_VECTOR(6 downto 0)
	);
  end component; 
  
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
	
	component Registru7_biti is
	port(
		sin : in BIT_VECTOR(6 downto 0);
		Clk : in BIT;
		sout : out bit_vector(6 downto 0)
	);
	end component; 
	
	component Registru_deplasare is
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
	end component;
	
	component Counter2	is
	port(
		Clk : in BIT;
		CLR : in BIT;
		Q : out bit_vector (1 downto 0)
	);
	end component;
	
	component Clock_divider is
		port (
		Clk : in BIT;
		Reset : in BIT;
		sout : out Bit_vector(1 downto 0)
			);
	end Component;
	
	component Blk_box is 
	port(
	Enable : in bit;
	A,B,C,D : in bit_vector (6 downto 0);
	Lit1,Lit2,Lit3,Lit4 : out bit_vector (6 downto 0)
	);
    end component;
	
	component ROMmem is
	port (
	addr : in bit_vector(4 downto 0);
	Mem : out bit_vector (6 downto 0)
		);
    end component; 
	
	constant adr1 : bit_vector (4 downto 0) :="10100";  --U
	constant adr2 : bit_vector (4 downto 0) :="10011";  --T 
	constant adr3 : bit_vector (4 downto 0) :="00010";  --C
	constant adr4 : bit_vector (4 downto 0) :="01101";  --N	
	Signal empty : bit_vector (6 downto 0) :="0000000";  --- gol
	Signal ADR_c : bit_vector (4 downto 0);
	SIGNAL LITERA,Dm_A,Dm_B,Dm_C,Dm_D,A,B,C,D,Lit1,Lit2,Lit3,Lit4 : bit_vector (6 downto 0);
	SIGNAL S,Q ,Sel_adr : bit_vector (1 downto 0) ;
	SIGNAL A1_1,A1_2,A1_3,A1_4,A2_1,A2_2,A2_3,A2_4,A3_1,A3_2,A3_3,A3_4,A4_1,A4_2,A4_3,A4_4 : bit_vector (6 downto 0);
	SIGNAL Enable,anod_out : bit_vector (3 downto 0); 
	SIGNAL H,L,E,C_A,C_B,C_C,C_D,Nex,S0,S1 : bit ;
	
	begin
		Adr : mux_4to1 port map(adr1,adr2,adr3,adr4,Sel_adr(0),Sel_adr(1),ADR_c); --Se alege adresa folosind un mux cu selectiile de la numarator
		Num : Counter2 port map(Clock,'0',Sel_adr);	 --Numaratorul care va da selectiile
		Mem : ROMmem port map(ADR_c,Litera);  --Se elege litera din memorie
		Dmux : DMUX1_4 port map(Litera,Sel_adr(0),Sel_adr(1),Dm_A,Dm_B,Dm_C,Dm_D); --Se alege registrul in care se pastreaza	  
		Dmux_clk : DMUX_anim port map('1',Sel_adr(0),Sel_adr(1),C_A,C_B,C_C,C_D); --Un dmux care v-a avea ca iesiri clock-ul pentru registre
		REG1 : Registru7_biti port map(Dm_A,C_A,A);
		REG2 : Registru7_biti port map(Dm_B,C_B,B);
		REG3 : Registru7_biti port map(Dm_C,C_C,C);
		REG4 : Registru7_biti port map(Dm_D,C_D,D);

		---Prima anim
		Mux1_1 : MUX4_1 port map(A,empty,A,empty,S(0),S(1),A1_1);
		Mux2_1 : MUX4_1 port map(B,empty,B,empty,S(0),S(1),A1_2);
		Mux3_1 : MUX4_1 port map(C,empty,C,empty,S(0),S(1),A1_3);
		Mux4A2 : MUX4_1 port map(D,empty,D,empty,S(0),S(1),A1_4); 
		---A doua anim
		Mux1A2 : MUX4_1 port map(A,empty,empty,empty,S(0),S(1),A2_1); 
		Mux2_2 : MUX4_1 port map(B,A,empty,empty,S(0),S(1),A2_2);
		Mux3_2 : MUX4_1 port map(C,B,A,empty,S(0),S(1),A2_3);
		Mux4_2 : MUX4_1 port map(D,C,B,A,S(0),S(1),A2_4);
		---A treia anim
		--Mux1_3 : MUX4_1 port map(A,empty,empty,empty,S(0),S(1),A3_1); --Putem folosi A2_1
		Mux2_3 : MUX4_1 port map(empty,B,empty,empty,S(0),S(1),A3_2);
		Mux3_3 : MUX4_1 port map(empty,empty,C,empty,S(0),S(1),A3_3);
		Mux4_3 : MUX4_1 port map(empty,empty,empty,D,S(0),S(1),A3_4);
		---A patra anim
		Mux1_4 : MUX4_1 port map(A,A,A,A,S(0),S(1),A4_1);
		Mux2_4 : MUX4_1 port map(empty,B,B,B,S(0),S(1),A4_2);
		Mux3_4 : MUX4_1 port map(empty,empty,C,C,S(0),S(1),A4_3);
		--Mux4_4 : MUX4_1 port map(empty,empty,empty,D,S(0),S(1),A4_4); --Putem folosim A3_4
		---Divizor de frecv
		Divider : Clock_divider port map(Clock,'0',S); 
		--alegere anod
		AN : Registru_deplasare port map(Clock,'1','1','0',S0,S1,"0001",anod_out); 
		S0 <= anod_out(0) and anod_out(1) and anod_out(2) and anod_out(3);
		S1 <= not S0; 
		Anod <= anod_out;	
		--Alegere animatii
		Mux_an1 : MUX4_1 port map(A1_1,A2_1,A2_1,A4_1,Anim(0),Anim(1),Lit1);
		Mux_an2 : MUX4_1 port map(A1_2,A2_2,A3_2,A4_2,Anim(0),Anim(1),Lit2);
		Mux_an3 : MUX4_1 port map(A1_3,A2_3,A3_3,A4_3,Anim(0),Anim(1),Lit3);
		Mux_an4 : MUX4_1 port map(A1_4,A2_4,A3_4,A3_4,Anim(0),Anim(1),Lit4);
		--afisare
		Mux_afisare : MUX4_1 port map(Lit1,Lit2,Lit3,Lit4,Sel_adr(0),Sel_adr(1),segment);
	    
	end Behavioral;	

