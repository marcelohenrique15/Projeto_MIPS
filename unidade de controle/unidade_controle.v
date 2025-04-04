module ControlUnit(
    input [5:0] opcode, // Bits[31:26] instrução
    input[5:0] Funct, // Bits [5:0] para R type
    output reg [2:0] ALUOp, // Codificação para a ALU Control
    output reg MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump
    );

// Codificação dos opcodes
localparam RTYPE = 6'b000000;
localparam LW = 6'100011;
localparam SW = 6'b101011;
localparam BEQ = 6'b000100;
localparam ADDI = 6'b001000;
localparam J = 6'b000010;

always @(opcode or Funct) begin
    // Valores padrão e definições (def)
    ALUOp = 2'b00; // Def: codificação para a ALU Control identificar a operação certa
    MemtoReg = 0; // Def: seleciona o dado para escrita no registrador (0 - saída ALU, 1 - dado da memória)
    MemWrite = 0; // Def: habilita escrita na memória
    Branch = 0; // Def: instruções de branch (beq)
    ALUSrc = 0; // Def: escolhe a fonte do 2º operando da alu (0 - registrador, 1 - imediato)
    RegDst = 0; // Def: escolhe o registrador de destino (0 - rt, 1 - rd)
    RegWrite = 0; // Def: habilita escrita no banco de registradores
    Jump = 0; // Def: instruções de jump
    
    case(opcode)
        RTYPE: begin
            ALUOp = 2'b10;
            MemtoReg = 0;
            MemWrite = 0;
            Branch = 0;
            ALUSrc = 0;
            RegDst = 1;
            RegWrite = 1;
            Jump = 0;
        end

        LW: begin
            ALUOp = 2'b00; // Intrução ADD
            MemtoReg = 1;
            MemWrite = 0;
            Branch = 0;
            ALUSrc = 1;
            RegDst = 0;
            RegWrite = 1;
            Jump = 0;
        end

        SW: begin
            ALUOp = 2'b00; // Instrução ADD
            MemtoReg = 0;
            MemWrite = 1;
            Branch = 0;
            ALUSrc = 1;
            RegDst = 0;
            RegWrite = 0;
            Jump = 0;
        end

        BEQ: begin
            ALUOp = 2'b10; // Instrução SUB
            MemtoReg = 0;
            MemWrite = 0;
            Branch = 1;
            ALUSrc = 0;
            RegDst = 0;
            RegWrite = 0;
            Jump = 0;
        end

        ADDI: begin
            ALUOp = 2'b00; 
            MemtoReg = 0;
            MemWrite = 0;
            Branch = 0;
            ALUSrc = 1;
            RegDst = 0;
            RegWrite = 1;
            Jump = 0;
        end

        J: begin
            ALUOp = 2'b00; 
            MemtoReg = 0;
            MemWrite = 0;
            Branch = 0;
            ALUSrc = 0;
            RegDst = 0;
            RegWrite = 0;
            Jump = 1;
        end
    endcase
end

endmodule