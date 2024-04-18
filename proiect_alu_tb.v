module ALU16_Testbench;

  // Inputs
  reg signed [15:0] A;
  reg signed  [15:0] B;
  reg [3:0] op;
  reg  clk;
  reg reset;
  
   
  // Outputs
  wire signed [15:0] out;
  wire overflow;
  wire zero;
  
   

  // Instantiate the ALU16 module
  ALU16 alu_inst ( .A(A), .B(B), .op(op), .out(out), .overflow(overflow), .zero(zero),.clk(clk));

  // Test procedure
  initial begin
    clk = 0;
    reset = 1;
    // Test addition with various values
    clk=1;
    A = -16'd529;
    B = 16'd10;
    op = 4'b0000;  // Addition operation code
     
    #10; // Wait for simulation time
    $display("Test 1: Addition (A = %d, B = %d)", A, B);
    $display("  Expected output: %d",A+B);
    $display("  Actual output:   %h (decimal: %d)", out, out);
    $display("  Zero:             %b", zero);

    #10;

    // Test subtraction with various values
    A = 16'd1245;
    B = 16'd433;
    op = 4'b0001;  // Subtraction operation code

    #10;
    $display("Test 2: Subtraction (A = %d, B = %d)", A, B);
    $display("  Expected output: %d",A-B);
    $display("  Actual output:   %h (decimal: %d)", out, out);
    $display("  Zero:             %b", zero);

    #10;
    
    // Test multiplication with various values (may overflow for larger values)
    A = 16'd30;
    B = -16'd41;
    op = 4'b0010;  // Multiplication operation code
    
     
     #10 
     
    $display("Test 3: Multiplication (A = %d, B = %d)", A, B);
    $display("  Expected output: %d",A*B);
    $display("  Actual output:   %h (decimal: %d)", out, out);
    $display("  Zero:             %b", zero);

    #10;

    // Test division with various values
    A = 16'd16900;
    B = 16'd20;
    op = 4'b0011;  // Division operation code

    #10;
    $display("Test 4: Division (A = %d, B = %d)", A, B);
    $display("  Expected output: %d", A/B);
    $display("  Actual output:   %h (decimal: %d)", out, out);
    $display("  Zero:             %b", zero);

    #10;

    // Test shift left with various values
    A = 16'd85;
    op = 4'b0100;  // Shift left operation code
    B = 4;        // Number of positions to shift (modify as needed)

    #10;
    $display("Test 5: Shift Left (A = %d, B = %d)", A, B);
    $display("  Expected output: %d",A<<B);
    $display("  Actual output:   %h (decimal: %d)", out, out);
    $display("  Zero:             %b", zero);

    #10;

     A=16'd167;
     op=4'b0101; // Shift Right operation code
     B=3; // Number of position to shift

     #10
     $display("Test 6: Shift Right( A = %d, B = %d)", A, B);
     $display(" Expected output: %d", A>>B);
     $display(" Actual output:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);

     #10

     A=16'd8;
     B=16'd12;
     op=4'b0110; // XOR operation code
     

     #10
     $display("Test 7: XOR( A = %d, B = %d)", A, B);
     $display(" Expected output: %d", A^B);
     $display(" Actual output:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);
     
     #10

     A=16'd6553;
     B=16'd133;
     op=4'b0111; // XNOR operation code
     

     #10
     $display("Test 8: XNOR( A = %d, B = %d)", A, B);
     $display(" Expected output: %d", ~(A^B));
     $display(" Actual output:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);

     #10

     A=16'd123;
     op=4'b1000; // NOT operation code

     #10
     $display("Test 9: NOT( A= %d)", A);
     $display(" Expected output: %d",~A);
     $display(" Actual output:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);
     

     #10

     A=16'd3;
     B=16'd2;
     op=4'b1001; //AND operation code
     
     #10
     $display("Test 10: AND( A= %d, B= %d)", A, B);
     $display(" Expected output: %d", A & B);
     $display(" Actual autput:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);
     
     #10

     A=16'd3;
     B=16'd2;
     op=4'b1010; //OR operation code
     
     #10
     $display("Test 11: OR( A= %d, B= %d)", A, B);
     $display(" Expected output: %d", A | B);
     $display(" Actual autput:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);


     #10

     A=16'd30;
     B=16'd40;
     op=4'b1011; //booth operation code
     
     #10
     
     $display("Test 12: BOOTH( A= %d, B= %d)", A, B);
     $display(" Expected output: %d", A * B);
     $display(" Actual autput:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);

     #10
     

     A=16'd80;
     B=16'd40;
     op=4'b1100; //restoring division operation code
     
     #10
      
     $display("Test 13:NON RESTORING( A= %d, B= %d)", A, B);
     $display(" Expected output: %d", A / B);
     $display(" Actual autput:   %h (decimal: %d)", out, out);
     $display(" Zero:            %b", zero);

      
     #10

       
     reset = 0;
    #100; // Wait for some time to allow observation
     
    $finish;
  end
   always #10 clk = !clk;
   
endmodule
