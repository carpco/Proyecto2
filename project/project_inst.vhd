	component project is
		port (
			clk_clk                           : in  std_logic                    := 'X';             -- clk
			sseg0_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			sseg1_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			sseg2_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			sseg3_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			switch_external_connection_export : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			led_external_connection_export    : out std_logic_vector(7 downto 0)                     -- export
		);
	end component project;

	u0 : component project
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			sseg0_external_connection_export  => CONNECTED_TO_sseg0_external_connection_export,  --  sseg0_external_connection.export
			sseg1_external_connection_export  => CONNECTED_TO_sseg1_external_connection_export,  --  sseg1_external_connection.export
			sseg2_external_connection_export  => CONNECTED_TO_sseg2_external_connection_export,  --  sseg2_external_connection.export
			sseg3_external_connection_export  => CONNECTED_TO_sseg3_external_connection_export,  --  sseg3_external_connection.export
			switch_external_connection_export => CONNECTED_TO_switch_external_connection_export, -- switch_external_connection.export
			led_external_connection_export    => CONNECTED_TO_led_external_connection_export     --    led_external_connection.export
		);

