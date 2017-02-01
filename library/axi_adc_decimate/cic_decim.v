// -------------------------------------------------------------
//
// Module: cic_decim
// Generated by MATLAB(R) 9.0 and the Filter Design HDL Coder 3.0.
// Generated on: 2016-07-05 15:46:18
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// OptimizeForHDL: on
// EDAScriptGeneration: off
// AddPipelineRegisters: on
// Name: cic_decim
// AddRatePort: on
// InputDataType: numerictype(1,12,11)
// TargetLanguage: Verilog
// TestBenchName: cicdecimfilt_copy_tb
// TestBenchStimulus: step ramp chirp noise 
// GenerateHDLTestBench: off

// -------------------------------------------------------------
// HDL Implementation    : Fully parallel
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time FIR Multirate Filter (real)
// -----------------------------------------
// Filter Structure    : Cascaded Integrator-Comb Decimator
// Decimation Factor   : 50000
// Differential Delay  : 1
// Number of Sections  : 6
// Stable              : Yes
// Linear Phase        : No
//
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module cic_decim
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                rate,
                load_rate,
                filter_out,
                ce_out
                );

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [11:0] filter_in; //sfix12_En11
  input   [15:0] rate; //ufix16
  input   load_rate; 
  output  signed [105:0] filter_out; //sfix106_En11
  output  ce_out; 

////////////////////////////////////////////////////////////////
//Module Architecture: cic_decim
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  // Signals
  reg  [15:0] rate_register; // ufix16
  reg  [15:0] cur_count; // ufix16
  wire phase_1; // boolean
  wire ce_delayline; // boolean
  reg  int_delay_pipe [0:4] ; // boolean
  wire ce_gated; // boolean
  reg  ce_out_reg; // boolean
  //   
  reg  signed [11:0] input_register; // sfix12_En11
  //   -- Section 1 Signals 
  wire signed [11:0] section_in1; // sfix12_En11
  wire signed [105:0] section_cast1; // sfix106_En11
  wire signed [105:0] sum1; // sfix106_En11
  reg  signed [105:0] section_out1; // sfix106_En11
  wire signed [105:0] add_cast; // sfix106_En11
  wire signed [105:0] add_cast_1; // sfix106_En11
  wire signed [106:0] add_temp; // sfix107_En11
  //   -- Section 2 Signals 
  wire signed [105:0] section_in2; // sfix106_En11
  wire signed [105:0] sum2; // sfix106_En11
  reg  signed [105:0] section_out2; // sfix106_En11
  wire signed [105:0] add_cast_2; // sfix106_En11
  wire signed [105:0] add_cast_3; // sfix106_En11
  wire signed [106:0] add_temp_1; // sfix107_En11
  //   -- Section 3 Signals 
  wire signed [105:0] section_in3; // sfix106_En11
  wire signed [105:0] sum3; // sfix106_En11
  reg  signed [105:0] section_out3; // sfix106_En11
  wire signed [105:0] add_cast_4; // sfix106_En11
  wire signed [105:0] add_cast_5; // sfix106_En11
  wire signed [106:0] add_temp_2; // sfix107_En11
  //   -- Section 4 Signals 
  wire signed [105:0] section_in4; // sfix106_En11
  wire signed [105:0] sum4; // sfix106_En11
  reg  signed [105:0] section_out4; // sfix106_En11
  wire signed [105:0] add_cast_6; // sfix106_En11
  wire signed [105:0] add_cast_7; // sfix106_En11
  wire signed [106:0] add_temp_3; // sfix107_En11
  //   -- Section 5 Signals 
  wire signed [105:0] section_in5; // sfix106_En11
  wire signed [105:0] sum5; // sfix106_En11
  reg  signed [105:0] section_out5; // sfix106_En11
  wire signed [105:0] add_cast_8; // sfix106_En11
  wire signed [105:0] add_cast_9; // sfix106_En11
  wire signed [106:0] add_temp_4; // sfix107_En11
  //   -- Section 6 Signals 
  wire signed [105:0] section_in6; // sfix106_En11
  wire signed [105:0] sum6; // sfix106_En11
  reg  signed [105:0] section_out6; // sfix106_En11
  wire signed [105:0] add_cast_10; // sfix106_En11
  wire signed [105:0] add_cast_11; // sfix106_En11
  wire signed [106:0] add_temp_5; // sfix107_En11
  //   -- Section 7 Signals 
  wire signed [105:0] section_in7; // sfix106_En11
  reg  signed [105:0] diff1; // sfix106_En11
  wire signed [105:0] section_out7; // sfix106_En11
  wire signed [105:0] sub_cast; // sfix106_En11
  wire signed [105:0] sub_cast_1; // sfix106_En11
  wire signed [106:0] sub_temp; // sfix107_En11
  reg  signed [105:0] cic_pipeline7; // sfix106_En11
  //   -- Section 8 Signals 
  wire signed [105:0] section_in8; // sfix106_En11
  reg  signed [105:0] diff2; // sfix106_En11
  wire signed [105:0] section_out8; // sfix106_En11
  wire signed [105:0] sub_cast_2; // sfix106_En11
  wire signed [105:0] sub_cast_3; // sfix106_En11
  wire signed [106:0] sub_temp_1; // sfix107_En11
  reg  signed [105:0] cic_pipeline8; // sfix106_En11
  //   -- Section 9 Signals 
  wire signed [105:0] section_in9; // sfix106_En11
  reg  signed [105:0] diff3; // sfix106_En11
  wire signed [105:0] section_out9; // sfix106_En11
  wire signed [105:0] sub_cast_4; // sfix106_En11
  wire signed [105:0] sub_cast_5; // sfix106_En11
  wire signed [106:0] sub_temp_2; // sfix107_En11
  reg  signed [105:0] cic_pipeline9; // sfix106_En11
  //   -- Section 10 Signals 
  wire signed [105:0] section_in10; // sfix106_En11
  reg  signed [105:0] diff4; // sfix106_En11
  wire signed [105:0] section_out10; // sfix106_En11
  wire signed [105:0] sub_cast_6; // sfix106_En11
  wire signed [105:0] sub_cast_7; // sfix106_En11
  wire signed [106:0] sub_temp_3; // sfix107_En11
  reg  signed [105:0] cic_pipeline10; // sfix106_En11
  //   -- Section 11 Signals 
  wire signed [105:0] section_in11; // sfix106_En11
  reg  signed [105:0] diff5; // sfix106_En11
  wire signed [105:0] section_out11; // sfix106_En11
  wire signed [105:0] sub_cast_8; // sfix106_En11
  wire signed [105:0] sub_cast_9; // sfix106_En11
  wire signed [106:0] sub_temp_4; // sfix107_En11
  reg  signed [105:0] cic_pipeline11; // sfix106_En11
  //   -- Section 12 Signals 
  wire signed [105:0] section_in12; // sfix106_En11
  reg  signed [105:0] diff6; // sfix106_En11
  wire signed [105:0] section_out12; // sfix106_En11
  wire signed [105:0] sub_cast_10; // sfix106_En11
  wire signed [105:0] sub_cast_11; // sfix106_En11
  wire signed [106:0] sub_temp_5; // sfix107_En11
  reg  [6:0] bitgain; // ufix7
  wire signed [105:0] output_typeconvert; // sfix106_En11
  wire signed [105:0] muxinput_14; // sfix106_E3
  wire signed [105:0] muxinput_34; // sfix106_E23
  wire signed [105:0] muxinput_54; // sfix106_E43
  wire signed [105:0] muxinput_74; // sfix106_E63
  wire signed [105:0] muxinput_94; // sfix106_E83
  //   
  reg  signed [105:0] output_register; // sfix106_En11

  // Block Statements
  //   ------------------ CE Output Generation ------------------

  always @ (posedge clk or posedge reset)
    begin: ce_output
      if (reset == 1'b1) begin
        cur_count <= 16'b0000000000000000;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (load_rate ==  1'b1) begin
            cur_count <= 16'b0000000000000001;
          end
          else if (cur_count == rate_register - 1) begin
            cur_count <= 16'b0000000000000000;
          end
          else begin
            cur_count <= cur_count + 1;
          end
        end
      end
    end // ce_output

  assign  phase_1 = (cur_count == 16'b0000000000000001 && clk_enable == 1'b1)? 1 : 0;

  always @ (posedge clk or posedge reset)
    begin: ce_delay
      if (reset == 1'b1) begin
        int_delay_pipe[0] <= 1'b0;
        int_delay_pipe[1] <= 1'b0;
        int_delay_pipe[2] <= 1'b0;
        int_delay_pipe[3] <= 1'b0;
        int_delay_pipe[4] <= 1'b0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          int_delay_pipe[1] <= int_delay_pipe[0];
          int_delay_pipe[2] <= int_delay_pipe[1];
          int_delay_pipe[3] <= int_delay_pipe[2];
          int_delay_pipe[4] <= int_delay_pipe[3];
          int_delay_pipe[0] <= clk_enable;
        end
      end
    end // ce_delay
  assign ce_delayline = int_delay_pipe[4];

  assign ce_gated =  ce_delayline & phase_1;

  //   ------------------ CE Output Register ------------------

  always @ (posedge clk or posedge reset)
    begin: ce_output_register
      if (reset == 1'b1) begin
        ce_out_reg <= 1'b0;
      end
      else begin
          ce_out_reg <= ce_gated;
      end
    end // ce_output_register

  //   ------------------ Input Register ------------------

  always @ (posedge clk or posedge reset)
    begin: input_reg_process
      if (reset == 1'b1) begin
        input_register <= 0;
        rate_register <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          input_register <= filter_in;
          rate_register <= rate;
        end
      end
    end // input_reg_process

  //   ------------------ Section # 1 : Integrator ------------------

  assign section_in1 = input_register;

  assign section_cast1 = $signed({{94{section_in1[11]}}, section_in1});

  assign add_cast = section_cast1;
  assign add_cast_1 = section_out1;
  assign add_temp = add_cast + add_cast_1;
  assign sum1 = add_temp[105:0];

  always @ (posedge clk or posedge reset)
    begin: integrator_delay_section1
      if (reset == 1'b1) begin
        section_out1 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          section_out1 <= sum1;
        end
      end
    end // integrator_delay_section1

  //   ------------------ Section # 2 : Integrator ------------------

  assign section_in2 = section_out1;

  assign add_cast_2 = section_in2;
  assign add_cast_3 = section_out2;
  assign add_temp_1 = add_cast_2 + add_cast_3;
  assign sum2 = add_temp_1[105:0];

  always @ (posedge clk or posedge reset)
    begin: integrator_delay_section2
      if (reset == 1'b1) begin
        section_out2 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          section_out2 <= sum2;
        end
      end
    end // integrator_delay_section2

  //   ------------------ Section # 3 : Integrator ------------------

  assign section_in3 = section_out2;

  assign add_cast_4 = section_in3;
  assign add_cast_5 = section_out3;
  assign add_temp_2 = add_cast_4 + add_cast_5;
  assign sum3 = add_temp_2[105:0];

  always @ (posedge clk or posedge reset)
    begin: integrator_delay_section3
      if (reset == 1'b1) begin
        section_out3 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          section_out3 <= sum3;
        end
      end
    end // integrator_delay_section3

  //   ------------------ Section # 4 : Integrator ------------------

  assign section_in4 = section_out3;

  assign add_cast_6 = section_in4;
  assign add_cast_7 = section_out4;
  assign add_temp_3 = add_cast_6 + add_cast_7;
  assign sum4 = add_temp_3[105:0];

  always @ (posedge clk or posedge reset)
    begin: integrator_delay_section4
      if (reset == 1'b1) begin
        section_out4 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          section_out4 <= sum4;
        end
      end
    end // integrator_delay_section4

  //   ------------------ Section # 5 : Integrator ------------------

  assign section_in5 = section_out4;

  assign add_cast_8 = section_in5;
  assign add_cast_9 = section_out5;
  assign add_temp_4 = add_cast_8 + add_cast_9;
  assign sum5 = add_temp_4[105:0];

  always @ (posedge clk or posedge reset)
    begin: integrator_delay_section5
      if (reset == 1'b1) begin
        section_out5 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          section_out5 <= sum5;
        end
      end
    end // integrator_delay_section5

  //   ------------------ Section # 6 : Integrator ------------------

  assign section_in6 = section_out5;

  assign add_cast_10 = section_in6;
  assign add_cast_11 = section_out6;
  assign add_temp_5 = add_cast_10 + add_cast_11;
  assign sum6 = add_temp_5[105:0];

  always @ (posedge clk or posedge reset)
    begin: integrator_delay_section6
      if (reset == 1'b1) begin
        section_out6 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          section_out6 <= sum6;
        end
      end
    end // integrator_delay_section6

  //   ------------------ Section # 7 : Comb ------------------

  assign section_in7 = section_out6;

  assign sub_cast = section_in7;
  assign sub_cast_1 = diff1;
  assign sub_temp = sub_cast - sub_cast_1;
  assign section_out7 = sub_temp[105:0];

  always @ (posedge clk or posedge reset)
    begin: comb_delay_section7
      if (reset == 1'b1) begin
        diff1 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          diff1 <= section_in7;
        end
      end
    end // comb_delay_section7

  always @ (posedge clk or posedge reset)
    begin: cic_pipeline_process_section7
      if (reset == 1'b1) begin
        cic_pipeline7 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          cic_pipeline7 <= section_out7;
        end
      end
    end // cic_pipeline_process_section7

  //   ------------------ Section # 8 : Comb ------------------

  assign section_in8 = cic_pipeline7;

  assign sub_cast_2 = section_in8;
  assign sub_cast_3 = diff2;
  assign sub_temp_1 = sub_cast_2 - sub_cast_3;
  assign section_out8 = sub_temp_1[105:0];

  always @ (posedge clk or posedge reset)
    begin: comb_delay_section8
      if (reset == 1'b1) begin
        diff2 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          diff2 <= section_in8;
        end
      end
    end // comb_delay_section8

  always @ (posedge clk or posedge reset)
    begin: cic_pipeline_process_section8
      if (reset == 1'b1) begin
        cic_pipeline8 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          cic_pipeline8 <= section_out8;
        end
      end
    end // cic_pipeline_process_section8

  //   ------------------ Section # 9 : Comb ------------------

  assign section_in9 = cic_pipeline8;

  assign sub_cast_4 = section_in9;
  assign sub_cast_5 = diff3;
  assign sub_temp_2 = sub_cast_4 - sub_cast_5;
  assign section_out9 = sub_temp_2[105:0];

  always @ (posedge clk or posedge reset)
    begin: comb_delay_section9
      if (reset == 1'b1) begin
        diff3 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          diff3 <= section_in9;
        end
      end
    end // comb_delay_section9

  always @ (posedge clk or posedge reset)
    begin: cic_pipeline_process_section9
      if (reset == 1'b1) begin
        cic_pipeline9 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          cic_pipeline9 <= section_out9;
        end
      end
    end // cic_pipeline_process_section9

  //   ------------------ Section # 10 : Comb ------------------

  assign section_in10 = cic_pipeline9;

  assign sub_cast_6 = section_in10;
  assign sub_cast_7 = diff4;
  assign sub_temp_3 = sub_cast_6 - sub_cast_7;
  assign section_out10 = sub_temp_3[105:0];

  always @ (posedge clk or posedge reset)
    begin: comb_delay_section10
      if (reset == 1'b1) begin
        diff4 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          diff4 <= section_in10;
        end
      end
    end // comb_delay_section10

  always @ (posedge clk or posedge reset)
    begin: cic_pipeline_process_section10
      if (reset == 1'b1) begin
        cic_pipeline10 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          cic_pipeline10 <= section_out10;
        end
      end
    end // cic_pipeline_process_section10

  //   ------------------ Section # 11 : Comb ------------------

  assign section_in11 = cic_pipeline10;

  assign sub_cast_8 = section_in11;
  assign sub_cast_9 = diff5;
  assign sub_temp_4 = sub_cast_8 - sub_cast_9;
  assign section_out11 = sub_temp_4[105:0];

  always @ (posedge clk or posedge reset)
    begin: comb_delay_section11
      if (reset == 1'b1) begin
        diff5 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          diff5 <= section_in11;
        end
      end
    end // comb_delay_section11

  always @ (posedge clk or posedge reset)
    begin: cic_pipeline_process_section11
      if (reset == 1'b1) begin
        cic_pipeline11 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          cic_pipeline11 <= section_out11;
        end
      end
    end // cic_pipeline_process_section11

  //   ------------------ Section # 12 : Comb ------------------

  assign section_in12 = cic_pipeline11;

  assign sub_cast_10 = section_in12;
  assign sub_cast_11 = diff6;
  assign sub_temp_5 = sub_cast_10 - sub_cast_11;
  assign section_out12 = sub_temp_5[105:0];

  always @ (posedge clk or posedge reset)
    begin: comb_delay_section12
      if (reset == 1'b1) begin
        diff6 <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          diff6 <= section_in12;
        end
      end
    end // comb_delay_section12

  always @(rate_register)
  begin
    case(rate_register)
      16'b0000000000000101 : bitgain = 7'b0001110;
      16'b0000000000110010 : bitgain = 7'b0100010;
      16'b0000000111110100 : bitgain = 7'b0110110;
      16'b0001001110001000 : bitgain = 7'b1001010;
      default : bitgain = 7'b1011110;
    endcase
  end

  assign muxinput_14 = $signed({{14{section_out12[105]}}, section_out12[105:14]});

  assign muxinput_34 = $signed({{34{section_out12[105]}}, section_out12[105:34]});

  assign muxinput_54 = $signed({{54{section_out12[105]}}, section_out12[105:54]});

  assign muxinput_74 = $signed({{74{section_out12[105]}}, section_out12[105:74]});

  assign muxinput_94 = $signed({{94{section_out12[105]}}, section_out12[105:94]});

  assign output_typeconvert = (bitgain == 7'b0001110) ? muxinput_14 :
                             (bitgain == 7'b0100010) ? muxinput_34 :
                             (bitgain == 7'b0110110) ? muxinput_54 :
                             (bitgain == 7'b1001010) ? muxinput_74 :
                             muxinput_94;
  //   ------------------ Output Register ------------------

  always @ (posedge clk or posedge reset)
    begin: output_reg_process
      if (reset == 1'b1) begin
        output_register <= 0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end // output_reg_process

  // Assignment Statements
  assign ce_out = ce_out_reg;
  assign filter_out = output_register;
endmodule  // cic_decim