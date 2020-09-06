//Alejandro Rodríguez 19131
//Lab 6
//testbench
module testbench();
    reg clk, rst;
    reg [3:0] d;
    wire [3:0] q;
    dff4 FF1(clk, rst, d, q);
    
 // Prueba del funcionamiento del flip flop tipo D de 4 bits   
    initial begin
        clk = 0; rst = 0; d = 4'b0000;
        #1 rst = 1;
        #1 rst = 0;
        #11 d = 4'b0001;
        #11 d = 4'b0101;
        #15 d = 4'b1111;
        //Prueba del reset asíncrono en un flanco negativo
        #1 rst = 1;
        #1 rst = 0;
        #9 d = 4'b1101;
        #9 d = 4'b1001;
        #8 d = 4'b0111;
        #100 $finish;
    end 
    //generación del reloj con período de 10 unidades de tiempo
    always
        #5 clk = ~clk;
    initial begin
        $dumpfile("E5_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule
