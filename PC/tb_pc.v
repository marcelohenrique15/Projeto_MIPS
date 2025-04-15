`timescale 1ns/1ps

module testbench;

    reg [31:0] PC;
    wire [31:0] PC4;

    // Instanciar o módulo PCPlus4
    PCPlus4 uut (
        .PC(PC),
        .PC4(PC4)
    );

    initial begin
        $dumpfile("pcplus4.vcd");
        $dumpvars;

        // Teste 1
        PC = 0; #10;
        $display("PC = %d -> PC4 = %d", PC, PC4); // Esperado: 4

        // Teste 2
        PC = 4; #10;
        $display("PC = %d -> PC4 = %d", PC, PC4); // Esperado: 8

        // Teste 3
        PC = 100; #10;
        $display("PC = %d -> PC4 = %d", PC, PC4); // Esperado: 104

        // Teste 4
        PC = 32'hFFFFFFFF; #10;
        $display("PC = %h -> PC4 = %h", PC, PC4); // Esperado: 0x00000003 (overflow)

        $finish;
    end

endmodule
