module data_memory (
    input wire [31:0] Address,
    input wire [31:0] WriteData,
    input wire MemWrite,
    input wire clk,
    output reg [31:0] ReadData
);
    reg [31:0] Memory [0:1023];

    always @(posedge clk) begin
        if (MemWrite) begin
            Memory[Address >> 2] <= WriteData;
        end
    end

    always @(*) begin
        ReadData = Memory[Address >> 2];
    end
endmodule