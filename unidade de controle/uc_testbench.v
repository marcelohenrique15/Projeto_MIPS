module ControlUnit_tb;

    // Declaração dos sinais
    reg [5:0] opcode;
    reg [5:0] Funct;
    wire [1:0] ALUOp;
    wire MemtoReg;
    wire MemWrite;
    wire Branch;
    wire ALUSrc;
    wire RegDst;
    wire RegWrite;
    wire Jump;

    // Instanciação do módulo ControlUnit
    ControlUnit uut (
        .opcode(opcode),
        .Funct(Funct),
        .ALUOp(ALUOp),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .Jump(Jump)
    );

    // Bloco inicial para estímulos
    initial begin
        // Inicialização
        opcode = 6'b000000;
        Funct = 6'b000000;

        // Teste 1: Instrução R-type (opcode = 000000)
        #10;
        opcode = 6'b000000;
        $display("Teste R-type: ALUOp=%b, MemtoReg=%b, MemWrite=%b, Branch=%b, ALUSrc=%b, RegDst=%b, RegWrite=%b, Jump=%b",
                 ALUOp, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump);

        // Teste 2: Instrução lw (opcode = 100011)
        #10;
        opcode = 6'b100011;
        $display("Teste lw: ALUOp=%b, MemtoReg=%b, MemWrite=%b, Branch=%b, ALUSrc=%b, RegDst=%b, RegWrite=%b, Jump=%b",
                 ALUOp, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump);

        // Teste 3: Instrução sw (opcode = 101011)
        #10;
        opcode = 6'b101011;
        $display("Teste sw: ALUOp=%b, MemtoReg=%b, MemWrite=%b, Branch=%b, ALUSrc=%b, RegDst=%b, RegWrite=%b, Jump=%b",
                 ALUOp, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump);

        // Teste 4: Instrução addi (opcode = 001000)
        #10;
        opcode = 6'b001000;
        $display("Teste addi: ALUOp=%b, MemtoReg=%b, MemWrite=%b, Branch=%b, ALUSrc=%b, RegDst=%b, RegWrite=%b, Jump=%b",
                 ALUOp, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump);

        // Teste 5: Opcode inválido (opcode = 111111)
        #10;
        opcode = 6'b111111;
        $display("Teste opcode inválido: ALUOp=%b, MemtoReg=%b, MemWrite=%b, Branch=%b, ALUSrc=%b, RegDst=%b, RegWrite=%b, Jump=%b",
                 ALUOp, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump);

        // Finaliza a simulação
        #10;
        $finish;
    end

endmodule
