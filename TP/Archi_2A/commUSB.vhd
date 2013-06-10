library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

-- commUSB module

entity commUSB is
        port (
            mclk     : in std_logic;
            pdb      : inout std_logic_vector(7 downto 0);
            astb     : in std_logic;
            dstb     : in std_logic;
            pwr      : in std_logic;
            pwait    : out std_logic;
            pc2board : out std_logic_vector(127 downto 0);
            board2pc : in std_logic_vector(127 downto 0)
        ) ;
end commUSB ;

architecture synthesis of commUSB is

    constant	stEppReady   : std_logic_vector(7 downto 0) := "0000" & "0000";
    constant	stEppAwrA    : std_logic_vector(7 downto 0) := "0001" & "0100";
    constant	stEppAwrB    : std_logic_vector(7 downto 0) := "0010" & "0001";
    constant	stEppArdA    : std_logic_vector(7 downto 0) := "0011" & "0010";
    constant	stEppArdB    : std_logic_vector(7 downto 0) := "0100" & "0011";
    constant	stEppDwrA    : std_logic_vector(7 downto 0) := "0101" & "1000";
    constant	stEppDwrB    : std_logic_vector(7 downto 0) := "0110" & "0001";
    constant	stEppDrdA    : std_logic_vector(7 downto 0) := "0111" & "0010";
    constant	stEppDrdB    : std_logic_vector(7 downto 0) := "1000" & "0011";

    signal	stEppCur     : std_logic_vector(7 downto 0) := stEppReady;
    signal	stEppNext    : std_logic_vector(7 downto 0);

    attribute fsm_extract : string;
    attribute fsm_extract of stEppCur: signal is "no";
    attribute fsm_extract of stEppNext: signal is "no";

    attribute fsm_encoding : string;
    attribute fsm_encoding of stEppCur: signal is "user";
    attribute fsm_encoding of stEppNext: signal is "user";

    attribute signal_encoding : string;
    attribute signal_encoding of stEppCur: signal is "user";
    attribute signal_encoding of stEppNext: signal is "user";

    signal	clkMain	     : std_logic;

    signal	ctlEppWait   : std_logic;
    signal	ctlEppAstb   : std_logic;
    signal	ctlEppDstb   : std_logic;
    signal	ctlEppDir    : std_logic;
    signal	ctlEppWr     : std_logic;
    signal	ctlEppAwr    : std_logic;
    signal	ctlEppDwr    : std_logic;
    signal	busEppOut    : std_logic_vector(7 downto 0);
    signal	busEppIn     : std_logic_vector(7 downto 0);
    signal	busEppData   : std_logic_vector(7 downto 0);
    signal	regEppAdr    : std_logic_vector(3 downto 0);

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------

begin

    ------------------------------------------------------------------------
	-- Map basic status and control signals
    ------------------------------------------------------------------------

	clkMain <= mclk;

	ctlEppAstb <= astb;
	ctlEppDstb <= dstb;
	ctlEppWr   <= pwr;
	pwait      <= ctlEppWait;	-- drive WAIT from state machine output

	-- Data bus direction control. The internal input data bus always
	-- gets the port data bus. The port data bus drives the internal
	-- output data bus onto the pins when the interface says we are doing
	-- a read cycle and we are in one of the read cycles states in the
	-- state machine.
	busEppIn <= pdb;
	pdb <= busEppOut when ctlEppWr = '1' and ctlEppDir = '1' else "ZZZZZZZZ";

	-- Select either address or data onto the internal output data bus.
	busEppOut <= "0000" & regEppAdr when ctlEppAstb = '0' else busEppData;

	-- Decode the address register and select the appropriate data register
	busEppData <=
		board2pc(7 downto 0) when regEppAdr = "0000" else
		board2pc(15 downto 8) when regEppAdr = "0001" else
		board2pc(23 downto 16) when regEppAdr = "0010" else
		board2pc(31 downto 24) when regEppAdr = "0011" else
		board2pc(39 downto 32) when regEppAdr = "0100" else
		board2pc(47 downto 40) when regEppAdr = "0101" else
		board2pc(55 downto 48) when regEppAdr = "0110" else
		board2pc(63 downto 56) when regEppAdr = "0111" else
		board2pc(71 downto 64) when regEppAdr = "1000" else
		board2pc(79 downto 72) when regEppAdr = "1001" else
		board2pc(87 downto 80) when regEppAdr = "1010" else
		board2pc(95 downto 88) when regEppAdr = "1011" else
		board2pc(103 downto 96) when regEppAdr = "1100" else
		board2pc(111 downto 104) when regEppAdr = "1101" else
		board2pc(119 downto 112) when regEppAdr = "1110" else
		board2pc(127 downto 120) when regEppAdr = "1111" ;

	------------------------------------------------------------------------
	-- EPP Interface Control State Machine
	------------------------------------------------------------------------

	-- Map control signals from the current state
	ctlEppWait <= stEppCur(0);
	ctlEppDir  <= stEppCur(1);
	ctlEppAwr  <= stEppCur(2);
	ctlEppDwr  <= stEppCur(3);

	-- This process moves the state machine to the next state
	-- on each clock cycle
	process (clkMain)
		begin
			if clkMain = '1' and clkMain'Event then
				stEppCur <= stEppNext;
			end if;
		end process;

	-- This process determines the next state machine state based
	-- on the current state and the state machine inputs.
	process (stEppCur, stEppNext, ctlEppAstb, ctlEppDstb, ctlEppWr)
		begin
			case stEppCur is
				-- Idle state waiting for the beginning of an EPP cycle
				when stEppReady =>
					if ctlEppAstb = '0' then
						-- Address read or write cycle
						if ctlEppWr = '0' then
							stEppNext <= stEppAwrA;
						else
							stEppNext <= stEppArdA;
						end if;

					elsif ctlEppDstb = '0' then
						-- Data read or write cycle
						if ctlEppWr = '0' then
							stEppNext <= stEppDwrA;
						else
							stEppNext <= stEppDrdA;
						end if;

					else
						-- Remain in ready state
						stEppNext <= stEppReady;
					end if;

				-- Write address register
				when stEppAwrA =>
					stEppNext <= stEppAwrB;

				when stEppAwrB =>
					if ctlEppAstb = '0' then
						stEppNext <= stEppAwrB;
					else
						stEppNext <= stEppReady;
					end if;		

				-- Read address register
				when stEppArdA =>
					stEppNext <= stEppArdB;

				when stEppArdB =>
					if ctlEppAstb = '0' then
						stEppNext <= stEppArdB;
					else
						stEppNext <= stEppReady;
					end if;

				-- Write data register
				when stEppDwrA =>
					stEppNext <= stEppDwrB;

				when stEppDwrB =>
					if ctlEppDstb = '0' then
						stEppNext <= stEppDwrB;
					else
						stEppNext <= stEppReady;
					end if;

				-- Read data register
				when stEppDrdA =>
					stEppNext <= stEppDrdB;
								
				when stEppDrdB =>
					if ctlEppDstb = '0' then
						stEppNext <= stEppDrdB;
					else
				  		stEppNext <= stEppReady;
					end if;

				-- Some unknown state		
				when others =>
					stEppNext <= stEppReady;

			end case;
		end process;
		
    ------------------------------------------------------------------------
	-- EPP Address register
    ------------------------------------------------------------------------

	process (clkMain, ctlEppAwr)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppAwr = '1' then
					regEppAdr <= busEppIn(3 downto 0);
				end if;
			end if;
		end process;

    ------------------------------------------------------------------------
	-- EPP Data registers
    ------------------------------------------------------------------------
 	-- The following processes implement the interface registers.
	-- The ctlEppDwr signal is an output from the state machine that says
	-- we are in a 'write data register' state. This is combined with the
	-- address in the address register to determine which register to write.

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0000" then
					pc2board(7 downto 0) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0001" then
					pc2board(15 downto 8) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0010" then
					pc2board(23 downto 16) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0011" then
					pc2board(31 downto 24) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0100" then
					pc2board(39 downto 32) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0101" then
					pc2board(47 downto 40) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0110" then
					pc2board(55 downto 48) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "0111" then
					pc2board(63 downto 56) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1000" then
					pc2board(71 downto 64) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1001" then
					pc2board(79 downto 72) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1010" then
					pc2board(87 downto 80) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1011" then
					pc2board(95 downto 88) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1100" then
					pc2board(103 downto 96) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1101" then
					pc2board(111 downto 104) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1110" then
					pc2board(119 downto 112) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

	process (clkMain, regEppAdr, ctlEppDwr, busEppIn)
		begin
			if clkMain = '1' and clkMain'Event then
				if ctlEppDwr = '1' and regEppAdr = "1111" then
					pc2board(127 downto 120) <= busEppIn(7 downto 0);
				end if;
			end if;
		end process;

----------------------------------------------------------------------------

end synthesis ;

