module bit4alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] SEL,
    output reg [3:0] RESULT,
    output reg CARRY
    );
  
 always @(*) begin
   RESULT = 4'b0000;
   CARRY  = 1'b0;
     case (SEL)
     3'b000: begin
     {CARRY, RESULT} = A + B;// Addition
             end
     3'b001: begin
      RESULT = A - B; // Subtraction
      CARRY  = 1'b0;
               end
     3'b010: begin
      RESULT = A & B; // AND
             end
     3'b011: begin
        RESULT = A | B;// OR
              end
     3'b100: begin
         RESULT = A ^ B;// XOR
              end
     3'b101: begin
         RESULT = ~A;// NOT A
              end
     3'b110: begin
         {CARRY, RESULT} = A + 4'b0001;// Increment A
                end
     3'b111: begin
           RESULT = A - 4'b0001;// Decrement A
           CARRY  = 1'b0;
                end
     default: begin
        RESULT = 4'b0000;
          CARRY  = 1'b0;
              end
     endcase
   end
endmodule
