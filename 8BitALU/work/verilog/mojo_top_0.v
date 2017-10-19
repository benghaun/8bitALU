/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [7:0] result;
  
  reg [5:0] alufn;
  
  reg [7:0] a;
  
  reg [7:0] b;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [6-1:0] M_testSM_alufn;
  wire [8-1:0] M_testSM_a;
  wire [8-1:0] M_testSM_b;
  wire [1-1:0] M_testSM_error;
  wire [8-1:0] M_testSM_errorA;
  wire [8-1:0] M_testSM_errorB;
  wire [8-1:0] M_testSM_errorResult;
  wire [8-1:0] M_testSM_errorAlufn;
  reg [8-1:0] M_testSM_result;
  reg [1-1:0] M_testSM_pause;
  testSM_2 testSM (
    .clk(clk),
    .rst(rst),
    .result(M_testSM_result),
    .pause(M_testSM_pause),
    .alufn(M_testSM_alufn),
    .a(M_testSM_a),
    .b(M_testSM_b),
    .error(M_testSM_error),
    .errorA(M_testSM_errorA),
    .errorB(M_testSM_errorB),
    .errorResult(M_testSM_errorResult),
    .errorAlufn(M_testSM_errorAlufn)
  );
  reg [23:0] M_errorCounter_d, M_errorCounter_q = 1'h0;
  
  wire [8-1:0] M_addSubtract_out;
  wire [1-1:0] M_addSubtract_z;
  wire [1-1:0] M_addSubtract_v;
  wire [1-1:0] M_addSubtract_n;
  reg [8-1:0] M_addSubtract_a;
  reg [8-1:0] M_addSubtract_b;
  reg [1-1:0] M_addSubtract_alufn0;
  reg [1-1:0] M_addSubtract_error;
  addSubtract_3 addSubtract (
    .a(M_addSubtract_a),
    .b(M_addSubtract_b),
    .alufn0(M_addSubtract_alufn0),
    .error(M_addSubtract_error),
    .out(M_addSubtract_out),
    .z(M_addSubtract_z),
    .v(M_addSubtract_v),
    .n(M_addSubtract_n)
  );
  
  wire [8-1:0] M_bool_out;
  reg [4-1:0] M_bool_alufn;
  reg [8-1:0] M_bool_a;
  reg [8-1:0] M_bool_b;
  reg [1-1:0] M_bool_error;
  bool_4 bool (
    .alufn(M_bool_alufn),
    .a(M_bool_a),
    .b(M_bool_b),
    .error(M_bool_error),
    .out(M_bool_out)
  );
  
  wire [8-1:0] M_comparator_out;
  reg [1-1:0] M_comparator_z;
  reg [1-1:0] M_comparator_n;
  reg [1-1:0] M_comparator_v;
  reg [2-1:0] M_comparator_alufn;
  reg [1-1:0] M_comparator_error;
  comparator_5 comparator (
    .z(M_comparator_z),
    .n(M_comparator_n),
    .v(M_comparator_v),
    .alufn(M_comparator_alufn),
    .error(M_comparator_error),
    .out(M_comparator_out)
  );
  
  wire [8-1:0] M_shifter_out;
  reg [2-1:0] M_shifter_alufn;
  reg [8-1:0] M_shifter_a;
  reg [3-1:0] M_shifter_b;
  reg [1-1:0] M_shifter_error;
  shifter_6 shifter (
    .alufn(M_shifter_alufn),
    .a(M_shifter_a),
    .b(M_shifter_b),
    .error(M_shifter_error),
    .out(M_shifter_out)
  );
  
  wire [8-1:0] M_multiplier_out;
  reg [8-1:0] M_multiplier_a;
  reg [8-1:0] M_multiplier_b;
  reg [1-1:0] M_multiplier_error;
  multiplier_7 multiplier (
    .a(M_multiplier_a),
    .b(M_multiplier_b),
    .error(M_multiplier_error),
    .out(M_multiplier_out)
  );
  
  always @* begin
    M_errorCounter_d = M_errorCounter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    if (io_dip[0+7+0-:1] == 1'h1) begin
      alufn = io_dip[0+0+5-:6];
      a = io_dip[16+7-:8];
      b = io_dip[8+7-:8];
    end else begin
      a = M_testSM_a;
      b = M_testSM_b;
      alufn = M_testSM_alufn;
    end
    M_testSM_pause = io_button[1+0-:1];
    M_addSubtract_a = a;
    M_addSubtract_b = b;
    M_addSubtract_alufn0 = alufn[0+0-:1];
    M_addSubtract_error = io_button[0+0-:1];
    M_comparator_z = M_addSubtract_z;
    M_comparator_n = M_addSubtract_n;
    M_comparator_v = M_addSubtract_v;
    M_comparator_alufn = alufn[1+1-:2];
    M_comparator_error = io_button[0+0-:1];
    M_bool_a = a;
    M_bool_b = b;
    M_bool_alufn = alufn[0+3-:4];
    M_bool_error = io_button[0+0-:1];
    M_shifter_a = a;
    M_shifter_b = b[0+2-:3];
    M_shifter_alufn = alufn[0+1-:2];
    M_shifter_error = io_button[0+0-:1];
    M_multiplier_a = a;
    M_multiplier_b = b;
    M_multiplier_error = io_button[0+0-:1];
    
    case (alufn[4+1-:2])
      2'h0: begin
        result = M_addSubtract_out;
        if (M_testSM_alufn[0+1-:2] == 2'h2) begin
          result = M_multiplier_out;
        end
      end
      2'h1: begin
        result = M_bool_out;
      end
      2'h2: begin
        result = M_shifter_out;
      end
      2'h3: begin
        result = M_comparator_out;
      end
      default: begin
        result = 8'h00;
      end
    endcase
    M_testSM_result = result;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    led[0+5-:6] = alufn;
    io_led[16+7-:8] = a;
    io_led[8+7-:8] = b;
    io_led[0+7-:8] = result;
    if (M_testSM_error && io_dip[0+7+0-:1] == 1'h0) begin
      M_errorCounter_d = M_errorCounter_q + 1'h1;
      io_led[16+7-:8] = M_testSM_errorA * M_errorCounter_q[23+0-:1];
      io_led[8+7-:8] = M_testSM_errorB * M_errorCounter_q[23+0-:1];
      io_led[0+7-:8] = M_testSM_errorResult * M_errorCounter_q[23+0-:1];
      led = M_testSM_errorAlufn * M_errorCounter_q[23+0-:1];
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_errorCounter_q <= 1'h0;
    end else begin
      M_errorCounter_q <= M_errorCounter_d;
    end
  end
  
endmodule
