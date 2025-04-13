module ControlUnit(
    input [5:0] opcode,
    input [5:0] Funct,
    output reg [1:0] ALUOp,
    output reg MemtoReg,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg Jump
);
    always @(*) begin
        ALUOp     = 2'b00;
        MemtoReg  = 0;
        MemWrite  = 0;
        Branch    = 0;
        ALUSrc    = 0;
        RegDst    = 0;
        RegWrite  = 0;
        Jump      = 0;

        case (opcode)
            6'b000000: begin  // R-type
                ALUOp    = 2'b10;
                RegDst   = 1;
                RegWrite = 1;
            end
            6'b100011: begin  // lw
                ALUOp     = 2'b00;
                MemtoReg  = 1;
                ALUSrc    = 1;
                RegWrite  = 1;
            end
            6'b101011: begin  // sw
                ALUOp     = 2'b00;
                ALUSrc    = 1;
                MemWrite  = 1;
            end
            6'b001000: begin  // addi
                ALUOp     = 2'b00;
                ALUSrc    = 1;
                RegWrite  = 1;
            end
            default: ;
        endcase
    end
endmodule