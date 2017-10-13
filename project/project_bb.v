
module project (
	button_external_connection_export,
	clk_clk,
	led_external_connection_export,
	reset_reset_n,
	sseg0_external_connection_export,
	sseg1_external_connection_export,
	sseg2_external_connection_export,
	sseg3_external_connection_export,
	switch_external_connection_export);	

	input	[2:0]	button_external_connection_export;
	input		clk_clk;
	output	[7:0]	led_external_connection_export;
	input		reset_reset_n;
	output	[7:0]	sseg0_external_connection_export;
	output	[7:0]	sseg1_external_connection_export;
	output	[7:0]	sseg2_external_connection_export;
	output	[7:0]	sseg3_external_connection_export;
	input	[2:0]	switch_external_connection_export;
endmodule
