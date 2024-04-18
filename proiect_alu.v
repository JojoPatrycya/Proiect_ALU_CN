// Define a Full Adder module
  module FullAdder (
    input signed  A,
    input signed B,
    input Cin,
    output signed Sum,
    output Cout
  );

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule // FullAdder

module ADD(A, B, sum);
	input signed [15:0] A,B;
	output signed [16:0] sum;
	wire [16:0] C;

	genvar i;
	// sets initial carryin to 0
	assign C[0] = 0;
	
	generate
		for (i = 0; i < 16; i = i+1)
		begin:addbit
			full_add stage(A[i],B[i],C[i],sum[i],C[i+1]);
		end
	endgenerate
	
	assign sum[16] = C[16];  //carry overflow, if the last carry is 1

endmodule // ADD


module full_add(input A, input B, input C0, output sum, output C1);
	assign sum = A^B^C0;
	assign C1 = (A&B)|(A&C0)|(B&C0);
endmodule // full_add


module SUB(A, B, difference);
   input signed [15:0] A, B;
   output signed [15:0] difference;
   
   assign difference = A + (~ B) +1;
endmodule // SUB


module MUL(A, B, product);
  input signed [15:0] A, B;
  output signed [31:0] product;
   
  assign product = A * B;
endmodule // MUL


module partialproduct(input1,segment,output1); 
	input [15:0] input1; 
	input [2:0] segment; 
	output reg [31:0] output1; 
	 
      	always @(*) begin 
	   case (segment) 
	     3'b000:output1=$signed(1'b0); 
	     3'b001:output1=$signed(input1); 
	     3'b010:output1=$signed(input1); 
	     3'b011: 
	       begin 
		  output1=$signed(input1); 
		  output1=$signed(input1)<<<1; 
	       end 
	     3'b100:begin 
		output1=$signed(input1); 
		output1=$signed(~output1+1'b1); 
		output1=$signed(output1)<<<1; 
	     end 
	     3'b101:begin 
		output1=$signed(input1); 	
		output1=$signed(~output1+1'b1); 
	     end 
	     3'b110:begin 
		output1=$signed(input1); 
		output1=$signed(~output1+1'b1); 
	     end 
	     3'b111:output1=$signed(16'b0);	 
	   endcase 
	end 
	 
endmodule 


module BOOTH_4(A,B,product); 
	input [15:0] A; 
	input [15:0] B; 
	output [31:0] product; 
	wire [31:0] temp [14:0]; 
	 
	partialproduct p0(A,{B[1:0],1'b0},temp[0]); 
	partialproduct p1(A,B[3:1],temp[1]); 
	partialproduct p2(A,B[5:3],temp[2]); 
	partialproduct p3(A,B[7:5],temp[3]); 
	 
	 
	 
	assign product = $signed(temp[0])+$signed(temp[1]<<<2)+$signed(temp[2]<<<4)+$signed(temp[3]<<<6); 
	 
	 
endmodule 



module DIV(A, B, quotient);
  input signed [15:0] A, B;
  output signed [15:0] quotient;
   
  assign quotient = A / B;
endmodule // DIV


module non_rest_div(A, B, quot, clk);
   input [15:0] A, B;
   output reg [15:0] quot;
   reg [15:0] reminder;
   
   input clk, reset;

   reg [15:0] c = 0, M, newc;
   reg [15:0] Q;
   reg [15:0] n = 16;
   reg [31:0] pp;

   reg p=0;

   always @(posedge clk)
     begin
	if(!reset) begin
	   if( ! p) begin
	     Q = A;
	     M = B;
	     p = 1;
	  end
	else begin
	   if(n != 0) begin
	      if(c[15] == 0) begin
		 pp= {c, Q} << 1;
		 newc = pp[31:15] +(~ M + 1);
		 Q = pp[31:0];
		 
		     end
	      else begin
		 pp= {c, Q} <<1;
		 newc= pp[31:15] + M;
		 Q = pp[31:0];
	      end
	      
	      c = newc;
	      if(c[15] == 0) begin
		 Q[0] = 1;
		 end
	      else begin
		 Q[0] = 0;

	      end
	      n = n-1;
	   end // if (n != 0)
	end // else: !if( ! p)
	   

	
	if( n == 0) begin
	   if( c[15]) begin
	      c = c + M;
	   end
	   quot = Q;
	   reminder = c;
	end
	end // if (!reset)

     end // always @ (posedge clk)
    
	
   
endmodule // Rest_div


module SHIFT_LEFT(A, B, result);
  input signed [15:0] A;
  input [15:0] B;
  output signed [15:0] result;
   
  assign result = A << B;
endmodule


module SHIFT_RIGHT(A, B, result);
  input signed [15:0] A;
  input [15:0] B;
  output signed [15:0] result;
   
  assign result = A >> B;
endmodule // SHIFT_RIGHT


module XOR(A, B, result);
  input signed [15:0] A, B;
  output signed [15:0] result;
   
  assign result = A ^ B;
endmodule // XOR


module XNOR(A, B, result);
  input signed [15:0] A, B;
  output signed [15:0] result;
  assign result = ~(A ^ B);
endmodule // XNOR


module NOT(A, result);
  input signed [15:0] A;
  output signed [15:0] result;
   
  assign result = ~A;
endmodule // NOT


module AND (A, B, result);
   input signed [15:0] A;
   input signed [15:0] B;
   output signed [15:0]   result;

   assign result= A & B;
   

endmodule


module OR(A, B, result);
  input signed [15:0] A, B;
  output signed [15:0] result;
   
  assign result = A | B;
endmodule


module ALU16 (
  input signed [15:0] A,
  input signed [15:0] B,
  input [3:0] op,
  output reg signed [15:0] out,
  output reg zero,
  input clk,
  input reset
);

    wire [16:0] sum_add;  //signal for the inputs result
    wire [15:0] difference;
    wire [31:0] product;
    wire [15:0] quotient;
    wire [15:0] shift_left;
    wire [15:0] shift_right;
    wire [15:0] xor_result;
    wire [15:0] xnor_result;
    wire [15:0] not_result;
    wire [15:0] and_result;
    wire [15:0] or_result;
    wire [31:0] product2;
    wire [15:0] quotient2;
   
    ADD add_inst(.A(A), .B(B), .sum(sum_add));
    SUB sub_inst(.A(A), .B(B), .difference(difference));
    MUL mul_inst(.A(A), .B(B), .product(product));
    BOOTH_4 booth_inst(.A(A), .B(B), .product(product2));
    DIV div_inst(.A(A), .B(B), .quotient(quotient));
    non_rest_div non_rest_div_inst(.A(A), .B(B), .quot(quotient2),.clk(clk));
    SHIFT_LEFT shl_inst(.A(A), .B(B), .result(shift_left));
    SHIFT_RIGHT shr_inst(.A(A), .B(B), .result(shift_right));
    XOR xor_inst(.A(A), .B(B), .result(xor_result));
    XNOR xnor_inst(.A(A), .B(B), .result(xnor_result));
    NOT not_inst(.A(A), .result(not_result));
    AND and_inst(.A(A), .B(B), .result(and_result));
    OR or_inst(.A(A), .B(B), .result(or_result));





   
  // Assign outputs based on operation code
  always @(*) begin
    case (op)
      0: begin // (Addition)
        out <= sum_add[16:0];
        zero <= (out == 0); //Assign the variable 'zero' the value 1 if the result is 0, or 0 otherwise
      end
      1: begin // (Subtraction)
        out <= difference[15:0];
        zero <= (out == 0);
      end
      2: begin // (Multiplication)
        out <= product;
        zero <= (out == 0);
      end
      3: begin // (Division)
        out <= quotient[15:0];
        zero <= (out == 0);
      end
      4: begin // (Shift Left)
        out <= shift_left[15:0];  
        zero <= (out == 0);
      end
      5: begin // (Shift Right)
        out <= shift_right[15:0];  
        zero <= (out == 0);
      end
      6: begin // (XOR)
        out <= xor_result[15:0];
        zero <= (out == 0);
      end
      7: begin // (XNOR)
        out <= xnor_result[15:0];
        zero <= (out == 0);
      end
      8: begin // (NOT)
        out <= not_result[15:0];
        zero <= (out == 0);
      end
      9: begin // (AND)
	 out<= and_result[15:0];
	 zero <= (out ==0);
      end
      10: begin // (OR)
	  out <= or_result[15:0];
	  zero <= (out == 0);
      end
      11: begin //booth
	  out<=product2[15:0];
          zero <= (out == 0);
      end
      12: begin //non_restoring division
	  out<=quotient2[15:0];
          zero <= (out == 0);
      end
      
      default: begin
          out <= 0;
          zero <= 1;
      end
    endcase
  end

endmodule
