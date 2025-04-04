module ControlUnit_tb;

    // Declaração das entradas e saídas
    reg [5:0] opcode;
    reg [5:0] Funct;
    wire [2:0] ALUOp;
    wire MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump;

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

    // Procedimento de teste
    initial begin
        // Inicialização
        $display("Iniciando simulação...");
        $monitor("opcode=%b | ALUOp=%b | MemtoReg=%b | MemWrite=%b | Branch=%b | ALUSrc=%b | RegDst=%b | RegWrite=%b | Jump=%b",
                 opcode, ALUOp, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump);

        // Teste 1: R-type (opcode = 000000)
        opcode = 6'b000000;
        Funct = 6'b000000; // Funct não é usado diretamente, mas incluído para completude
        #10;
        
        // Teste 2: LW (opcode = 100011)
        opcode = 6'b100011;
        #10;

        // Teste 3: SW (opcode = 101011)
        opcode = 6'b101011;
        #10;

        // Teste 4: BEQ (opcode = 000100)
        opcode = 6'b000100;
        #10;

        // Teste 5: ADDI (opcode = 001000)
        opcode = 6'b001000;
        #10;

        // Teste 6: J (opcode = 000010)
        opcode = 6'b000010;
        #10

        // Teste 7: Opcode inválido (padrão)
        opcode = 6'b111111;
        #10;

        // Finalização
        $display("Simulação concluída!");
        $finish;
    end

endmodule