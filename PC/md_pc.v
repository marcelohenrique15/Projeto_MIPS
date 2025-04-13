module PCPlus4(
    input wire [31:0] PC,
    output wire [31:0] PC4
);
    assign PC4 = PC + 4;
endmodule