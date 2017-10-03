// project.v

// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module project (
		input  wire       clk_clk,                           //                        clk.clk
		output wire [7:0] led_external_connection_export,    //    led_external_connection.export
		output wire [7:0] sseg0_external_connection_export,  //  sseg0_external_connection.export
		output wire [7:0] sseg1_external_connection_export,  //  sseg1_external_connection.export
		output wire [7:0] sseg2_external_connection_export,  //  sseg2_external_connection.export
		output wire [7:0] sseg3_external_connection_export,  //  sseg3_external_connection.export
		input  wire [1:0] switch_external_connection_export  // switch_external_connection.export
	);

	wire         cpu_debug_reset_request_reset;                     // cpu:debug_reset_request -> [rst_controller:reset_in0, rst_controller:reset_in1, rst_controller_001:reset_in0, rst_controller_002:reset_in0]
	wire  [31:0] cpu_data_master_readdata;                          // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_waitrequest;                       // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire         cpu_data_master_debugaccess;                       // cpu:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire  [12:0] cpu_data_master_address;                           // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                        // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire         cpu_data_master_read;                              // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire         cpu_data_master_write;                             // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire  [31:0] cpu_data_master_writedata;                         // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                   // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_waitrequest;                // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [12:0] cpu_instruction_master_address;                    // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                       // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;    // cpu:debug_mem_slave_readdata -> mm_interconnect_0:cpu_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest; // cpu:debug_mem_slave_waitrequest -> mm_interconnect_0:cpu_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess; // mm_interconnect_0:cpu_debug_mem_slave_debugaccess -> cpu:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;     // mm_interconnect_0:cpu_debug_mem_slave_address -> cpu:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;        // mm_interconnect_0:cpu_debug_mem_slave_read -> cpu:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;  // mm_interconnect_0:cpu_debug_mem_slave_byteenable -> cpu:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;       // mm_interconnect_0:cpu_debug_mem_slave_write -> cpu:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;   // mm_interconnect_0:cpu_debug_mem_slave_writedata -> cpu:debug_mem_slave_writedata
	wire         mm_interconnect_0_ram_s1_chipselect;               // mm_interconnect_0:ram_s1_chipselect -> ram:chipselect
	wire  [31:0] mm_interconnect_0_ram_s1_readdata;                 // ram:readdata -> mm_interconnect_0:ram_s1_readdata
	wire   [9:0] mm_interconnect_0_ram_s1_address;                  // mm_interconnect_0:ram_s1_address -> ram:address
	wire   [3:0] mm_interconnect_0_ram_s1_byteenable;               // mm_interconnect_0:ram_s1_byteenable -> ram:byteenable
	wire         mm_interconnect_0_ram_s1_write;                    // mm_interconnect_0:ram_s1_write -> ram:write
	wire  [31:0] mm_interconnect_0_ram_s1_writedata;                // mm_interconnect_0:ram_s1_writedata -> ram:writedata
	wire         mm_interconnect_0_ram_s1_clken;                    // mm_interconnect_0:ram_s1_clken -> ram:clken
	wire         mm_interconnect_0_sseg0_s1_chipselect;             // mm_interconnect_0:sseg0_s1_chipselect -> sseg0:chipselect
	wire  [31:0] mm_interconnect_0_sseg0_s1_readdata;               // sseg0:readdata -> mm_interconnect_0:sseg0_s1_readdata
	wire   [1:0] mm_interconnect_0_sseg0_s1_address;                // mm_interconnect_0:sseg0_s1_address -> sseg0:address
	wire         mm_interconnect_0_sseg0_s1_write;                  // mm_interconnect_0:sseg0_s1_write -> sseg0:write_n
	wire  [31:0] mm_interconnect_0_sseg0_s1_writedata;              // mm_interconnect_0:sseg0_s1_writedata -> sseg0:writedata
	wire         mm_interconnect_0_sseg1_s1_chipselect;             // mm_interconnect_0:sseg1_s1_chipselect -> sseg1:chipselect
	wire  [31:0] mm_interconnect_0_sseg1_s1_readdata;               // sseg1:readdata -> mm_interconnect_0:sseg1_s1_readdata
	wire   [1:0] mm_interconnect_0_sseg1_s1_address;                // mm_interconnect_0:sseg1_s1_address -> sseg1:address
	wire         mm_interconnect_0_sseg1_s1_write;                  // mm_interconnect_0:sseg1_s1_write -> sseg1:write_n
	wire  [31:0] mm_interconnect_0_sseg1_s1_writedata;              // mm_interconnect_0:sseg1_s1_writedata -> sseg1:writedata
	wire         mm_interconnect_0_sseg2_s1_chipselect;             // mm_interconnect_0:sseg2_s1_chipselect -> sseg2:chipselect
	wire  [31:0] mm_interconnect_0_sseg2_s1_readdata;               // sseg2:readdata -> mm_interconnect_0:sseg2_s1_readdata
	wire   [1:0] mm_interconnect_0_sseg2_s1_address;                // mm_interconnect_0:sseg2_s1_address -> sseg2:address
	wire         mm_interconnect_0_sseg2_s1_write;                  // mm_interconnect_0:sseg2_s1_write -> sseg2:write_n
	wire  [31:0] mm_interconnect_0_sseg2_s1_writedata;              // mm_interconnect_0:sseg2_s1_writedata -> sseg2:writedata
	wire         mm_interconnect_0_sseg3_s1_chipselect;             // mm_interconnect_0:sseg3_s1_chipselect -> sseg3:chipselect
	wire  [31:0] mm_interconnect_0_sseg3_s1_readdata;               // sseg3:readdata -> mm_interconnect_0:sseg3_s1_readdata
	wire   [1:0] mm_interconnect_0_sseg3_s1_address;                // mm_interconnect_0:sseg3_s1_address -> sseg3:address
	wire         mm_interconnect_0_sseg3_s1_write;                  // mm_interconnect_0:sseg3_s1_write -> sseg3:write_n
	wire  [31:0] mm_interconnect_0_sseg3_s1_writedata;              // mm_interconnect_0:sseg3_s1_writedata -> sseg3:writedata
	wire         mm_interconnect_0_timer_s1_chipselect;             // mm_interconnect_0:timer_s1_chipselect -> timer:chipselect
	wire  [15:0] mm_interconnect_0_timer_s1_readdata;               // timer:readdata -> mm_interconnect_0:timer_s1_readdata
	wire   [2:0] mm_interconnect_0_timer_s1_address;                // mm_interconnect_0:timer_s1_address -> timer:address
	wire         mm_interconnect_0_timer_s1_write;                  // mm_interconnect_0:timer_s1_write -> timer:write_n
	wire  [15:0] mm_interconnect_0_timer_s1_writedata;              // mm_interconnect_0:timer_s1_writedata -> timer:writedata
	wire  [31:0] mm_interconnect_0_switch_s1_readdata;              // switch:readdata -> mm_interconnect_0:switch_s1_readdata
	wire   [1:0] mm_interconnect_0_switch_s1_address;               // mm_interconnect_0:switch_s1_address -> switch:address
	wire         mm_interconnect_0_led_s1_chipselect;               // mm_interconnect_0:led_s1_chipselect -> led:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                 // led:readdata -> mm_interconnect_0:led_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                  // mm_interconnect_0:led_s1_address -> led:address
	wire         mm_interconnect_0_led_s1_write;                    // mm_interconnect_0:led_s1_write -> led:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                // mm_interconnect_0:led_s1_writedata -> led:writedata
	wire         irq_mapper_receiver0_irq;                          // timer:irq -> irq_mapper:receiver0_irq
	wire  [31:0] cpu_irq_irq;                                       // irq_mapper:sender_irq -> cpu:irq
	wire         rst_controller_reset_out_reset;                    // rst_controller:reset_out -> [cpu:reset_n, irq_mapper:reset, mm_interconnect_0:cpu_reset_reset_bridge_in_reset_reset]
	wire         rst_controller_reset_out_reset_req;                // rst_controller:reset_req -> [cpu:reset_req, rst_translator:reset_req_in]
	wire         rst_controller_001_reset_out_reset;                // rst_controller_001:reset_out -> [led:reset_n, mm_interconnect_0:sseg0_reset_reset_bridge_in_reset_reset, sseg0:reset_n, sseg1:reset_n, sseg2:reset_n, sseg3:reset_n, switch:reset_n, timer:reset_n]
	wire         rst_controller_002_reset_out_reset;                // rst_controller_002:reset_out -> [mm_interconnect_0:ram_reset1_reset_bridge_in_reset_reset, ram:reset]
	wire         rst_controller_002_reset_out_reset_req;            // rst_controller_002:reset_req -> ram:reset_req

	project_cpu cpu (
		.clk                                 (clk_clk),                                           //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                   //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (cpu_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	project_led led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_001_reset_out_reset), //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_external_connection_export)       // external_connection.export
	);

	project_ram ram (
		.clk        (clk_clk),                                //   clk1.clk
		.address    (mm_interconnect_0_ram_s1_address),       //     s1.address
		.clken      (mm_interconnect_0_ram_s1_clken),         //       .clken
		.chipselect (mm_interconnect_0_ram_s1_chipselect),    //       .chipselect
		.write      (mm_interconnect_0_ram_s1_write),         //       .write
		.readdata   (mm_interconnect_0_ram_s1_readdata),      //       .readdata
		.writedata  (mm_interconnect_0_ram_s1_writedata),     //       .writedata
		.byteenable (mm_interconnect_0_ram_s1_byteenable),    //       .byteenable
		.reset      (rst_controller_002_reset_out_reset),     // reset1.reset
		.reset_req  (rst_controller_002_reset_out_reset_req), //       .reset_req
		.freeze     (1'b0)                                    // (terminated)
	);

	project_led sseg0 (
		.clk        (clk_clk),                               //                 clk.clk
		.reset_n    (~rst_controller_001_reset_out_reset),   //               reset.reset_n
		.address    (mm_interconnect_0_sseg0_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_sseg0_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_sseg0_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_sseg0_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_sseg0_s1_readdata),   //                    .readdata
		.out_port   (sseg0_external_connection_export)       // external_connection.export
	);

	project_led sseg1 (
		.clk        (clk_clk),                               //                 clk.clk
		.reset_n    (~rst_controller_001_reset_out_reset),   //               reset.reset_n
		.address    (mm_interconnect_0_sseg1_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_sseg1_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_sseg1_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_sseg1_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_sseg1_s1_readdata),   //                    .readdata
		.out_port   (sseg1_external_connection_export)       // external_connection.export
	);

	project_led sseg2 (
		.clk        (clk_clk),                               //                 clk.clk
		.reset_n    (~rst_controller_001_reset_out_reset),   //               reset.reset_n
		.address    (mm_interconnect_0_sseg2_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_sseg2_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_sseg2_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_sseg2_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_sseg2_s1_readdata),   //                    .readdata
		.out_port   (sseg2_external_connection_export)       // external_connection.export
	);

	project_led sseg3 (
		.clk        (clk_clk),                               //                 clk.clk
		.reset_n    (~rst_controller_001_reset_out_reset),   //               reset.reset_n
		.address    (mm_interconnect_0_sseg3_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_sseg3_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_sseg3_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_sseg3_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_sseg3_s1_readdata),   //                    .readdata
		.out_port   (sseg3_external_connection_export)       // external_connection.export
	);

	project_switch switch (
		.clk      (clk_clk),                              //                 clk.clk
		.reset_n  (~rst_controller_001_reset_out_reset),  //               reset.reset_n
		.address  (mm_interconnect_0_switch_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_switch_s1_readdata), //                    .readdata
		.in_port  (switch_external_connection_export)     // external_connection.export
	);

	project_timer timer (
		.clk        (clk_clk),                               //   clk.clk
		.reset_n    (~rst_controller_001_reset_out_reset),   // reset.reset_n
		.address    (mm_interconnect_0_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver0_irq)               //   irq.irq
	);

	project_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                             (clk_clk),                                           //                           clk_clk.clk
		.cpu_reset_reset_bridge_in_reset_reset   (rst_controller_reset_out_reset),                    //   cpu_reset_reset_bridge_in_reset.reset
		.ram_reset1_reset_bridge_in_reset_reset  (rst_controller_002_reset_out_reset),                //  ram_reset1_reset_bridge_in_reset.reset
		.sseg0_reset_reset_bridge_in_reset_reset (rst_controller_001_reset_out_reset),                // sseg0_reset_reset_bridge_in_reset.reset
		.cpu_data_master_address                 (cpu_data_master_address),                           //                   cpu_data_master.address
		.cpu_data_master_waitrequest             (cpu_data_master_waitrequest),                       //                                  .waitrequest
		.cpu_data_master_byteenable              (cpu_data_master_byteenable),                        //                                  .byteenable
		.cpu_data_master_read                    (cpu_data_master_read),                              //                                  .read
		.cpu_data_master_readdata                (cpu_data_master_readdata),                          //                                  .readdata
		.cpu_data_master_write                   (cpu_data_master_write),                             //                                  .write
		.cpu_data_master_writedata               (cpu_data_master_writedata),                         //                                  .writedata
		.cpu_data_master_debugaccess             (cpu_data_master_debugaccess),                       //                                  .debugaccess
		.cpu_instruction_master_address          (cpu_instruction_master_address),                    //            cpu_instruction_master.address
		.cpu_instruction_master_waitrequest      (cpu_instruction_master_waitrequest),                //                                  .waitrequest
		.cpu_instruction_master_read             (cpu_instruction_master_read),                       //                                  .read
		.cpu_instruction_master_readdata         (cpu_instruction_master_readdata),                   //                                  .readdata
		.cpu_debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //               cpu_debug_mem_slave.address
		.cpu_debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                                  .write
		.cpu_debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                                  .read
		.cpu_debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                                  .readdata
		.cpu_debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                                  .writedata
		.cpu_debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                                  .byteenable
		.cpu_debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                                  .waitrequest
		.cpu_debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                                  .debugaccess
		.led_s1_address                          (mm_interconnect_0_led_s1_address),                  //                            led_s1.address
		.led_s1_write                            (mm_interconnect_0_led_s1_write),                    //                                  .write
		.led_s1_readdata                         (mm_interconnect_0_led_s1_readdata),                 //                                  .readdata
		.led_s1_writedata                        (mm_interconnect_0_led_s1_writedata),                //                                  .writedata
		.led_s1_chipselect                       (mm_interconnect_0_led_s1_chipselect),               //                                  .chipselect
		.ram_s1_address                          (mm_interconnect_0_ram_s1_address),                  //                            ram_s1.address
		.ram_s1_write                            (mm_interconnect_0_ram_s1_write),                    //                                  .write
		.ram_s1_readdata                         (mm_interconnect_0_ram_s1_readdata),                 //                                  .readdata
		.ram_s1_writedata                        (mm_interconnect_0_ram_s1_writedata),                //                                  .writedata
		.ram_s1_byteenable                       (mm_interconnect_0_ram_s1_byteenable),               //                                  .byteenable
		.ram_s1_chipselect                       (mm_interconnect_0_ram_s1_chipselect),               //                                  .chipselect
		.ram_s1_clken                            (mm_interconnect_0_ram_s1_clken),                    //                                  .clken
		.sseg0_s1_address                        (mm_interconnect_0_sseg0_s1_address),                //                          sseg0_s1.address
		.sseg0_s1_write                          (mm_interconnect_0_sseg0_s1_write),                  //                                  .write
		.sseg0_s1_readdata                       (mm_interconnect_0_sseg0_s1_readdata),               //                                  .readdata
		.sseg0_s1_writedata                      (mm_interconnect_0_sseg0_s1_writedata),              //                                  .writedata
		.sseg0_s1_chipselect                     (mm_interconnect_0_sseg0_s1_chipselect),             //                                  .chipselect
		.sseg1_s1_address                        (mm_interconnect_0_sseg1_s1_address),                //                          sseg1_s1.address
		.sseg1_s1_write                          (mm_interconnect_0_sseg1_s1_write),                  //                                  .write
		.sseg1_s1_readdata                       (mm_interconnect_0_sseg1_s1_readdata),               //                                  .readdata
		.sseg1_s1_writedata                      (mm_interconnect_0_sseg1_s1_writedata),              //                                  .writedata
		.sseg1_s1_chipselect                     (mm_interconnect_0_sseg1_s1_chipselect),             //                                  .chipselect
		.sseg2_s1_address                        (mm_interconnect_0_sseg2_s1_address),                //                          sseg2_s1.address
		.sseg2_s1_write                          (mm_interconnect_0_sseg2_s1_write),                  //                                  .write
		.sseg2_s1_readdata                       (mm_interconnect_0_sseg2_s1_readdata),               //                                  .readdata
		.sseg2_s1_writedata                      (mm_interconnect_0_sseg2_s1_writedata),              //                                  .writedata
		.sseg2_s1_chipselect                     (mm_interconnect_0_sseg2_s1_chipselect),             //                                  .chipselect
		.sseg3_s1_address                        (mm_interconnect_0_sseg3_s1_address),                //                          sseg3_s1.address
		.sseg3_s1_write                          (mm_interconnect_0_sseg3_s1_write),                  //                                  .write
		.sseg3_s1_readdata                       (mm_interconnect_0_sseg3_s1_readdata),               //                                  .readdata
		.sseg3_s1_writedata                      (mm_interconnect_0_sseg3_s1_writedata),              //                                  .writedata
		.sseg3_s1_chipselect                     (mm_interconnect_0_sseg3_s1_chipselect),             //                                  .chipselect
		.switch_s1_address                       (mm_interconnect_0_switch_s1_address),               //                         switch_s1.address
		.switch_s1_readdata                      (mm_interconnect_0_switch_s1_readdata),              //                                  .readdata
		.timer_s1_address                        (mm_interconnect_0_timer_s1_address),                //                          timer_s1.address
		.timer_s1_write                          (mm_interconnect_0_timer_s1_write),                  //                                  .write
		.timer_s1_readdata                       (mm_interconnect_0_timer_s1_readdata),               //                                  .readdata
		.timer_s1_writedata                      (mm_interconnect_0_timer_s1_writedata),              //                                  .writedata
		.timer_s1_chipselect                     (mm_interconnect_0_timer_s1_chipselect)              //                                  .chipselect
	);

	project_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (cpu_irq_irq)                     //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (cpu_debug_reset_request_reset),      // reset_in0.reset
		.reset_in1      (cpu_debug_reset_request_reset),      // reset_in1.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (cpu_debug_reset_request_reset),      // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_002 (
		.reset_in0      (cpu_debug_reset_request_reset),          // reset_in0.reset
		.clk            (clk_clk),                                //       clk.clk
		.reset_out      (rst_controller_002_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_002_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_in1      (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

endmodule