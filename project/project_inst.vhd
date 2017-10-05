	component project is
		port (
			button_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			clk_clk                           : in  std_logic                    := 'X';             -- clk
			led_external_connection_export    : out std_logic_vector(7 downto 0);                    -- export
			sseg0_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			sseg1_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			sseg2_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			sseg3_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			switch_external_connection_export : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			reset_reset_n                     : in  std_logic                    := 'X'              -- reset_n
		);
	end component project;

	u0 : component project
		port map (
			button_external_connection_export => CONNECTED_TO_button_external_connection_export, -- button_external_connection.export
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			led_external_connection_export    => CONNECTED_TO_led_external_connection_export,    --    led_external_connection.export
			sseg0_external_connection_export  => CONNECTED_TO_sseg0_external_connection_export,  --  sseg0_external_connection.export
			sseg1_external_connection_export  => CONNECTED_TO_sseg1_external_connection_export,  --  sseg1_external_connection.export
			sseg2_external_connection_export  => CONNECTED_TO_sseg2_external_connection_export,  --  sseg2_external_connection.export
			sseg3_external_connection_export  => CONNECTED_TO_sseg3_external_connection_export,  --  sseg3_external_connection.export
			switch_external_connection_export => CONNECTED_TO_switch_external_connection_export, -- switch_external_connection.export
			reset_reset_n                     => CONNECTED_TO_reset_reset_n                      --                      reset.reset_n
		);

