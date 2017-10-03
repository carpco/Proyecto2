
module project (
	clk_clk,
	sseg0_external_connection_export,
	sseg1_external_connection_export,
	sseg2_external_connection_export,
	sseg3_external_connection_export,
	switch_external_connection_export,
	led_external_connection_export);	

	input		clk_clk;
	output	[7:0]	sseg0_external_connection_export;
	output	[7:0]	sseg1_external_connection_export;
	output	[7:0]	sseg2_external_connection_export;
	output	[7:0]	sseg3_external_connection_export;
	input	[1:0]	switch_external_connection_export;
	output	[7:0]	led_external_connection_export;
endmodule
