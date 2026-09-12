odule bit4ALU_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] SEL;
    wire [3:0] RESULT;
    wire CARRY;
 bit4alu DUT ( // Instantiate the ALU
        .A(A),
        .B(B),
        .SEL(SEL),
        .RESULT(RESULT),
        .CARRY(CARRY)
    );

    initial begin
        $monitor("Time=%0t | A=%b | B=%b | SEL=%b | RESULT=%b | CARRY=%b",
                  $time, A, B, SEL, RESULT, CARRY);
        // Test 1: Addition
        A = 4'b0011;
        B = 4'b0010;
        SEL = 3'b000;
        #10;
        // Test 2: Addition with carry
        A = 4'b1111;
        B = 4'b0001;
        SEL = 3'b000;
        #10;
        // Test 3: Subtraction
        A = 4'b1001;
        B = 4'b0011;
        SEL = 3'b001;
        #10;
        // Test 4: AND
        A = 4'b1100;
        B = 4'b1010;
        SEL = 3'b010;
        #10;
        // Test 5: OR
        A = 4'b1100;
        B = 4'b1010;
        SEL = 3'b011;
        #10;
        // Test 6: XOR
        A = 4'b1100;
        B = 4'b1010;
        SEL = 3'b100;
        #10;
        // Test 7: NOT A
        A = 4'b1010;
        B = 4'b0000;
        SEL = 3'b101;
        #10;
        // Test 8: Increment A
        A = 4'b0101;
        B = 4'b0000;
        SEL = 3'b110;
        #10;
        // Test 9: Increment with carry
        A = 4'b1111;
        B = 4'b0000;
        SEL = 3'b110;
        #10;
        // Test 10: Decrement A
        A = 4'b1000;
        B = 4'b0000;
        SEL = 3'b111;
        #10;
        // Test 11: Decrement zero
        A = 4'b0000;
        B = 4'b0000;
        SEL = 3'b111;
        #10;
        $finish;
    end
endmodule
