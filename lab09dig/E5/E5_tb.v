//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 5
//Memoria ROM testbench
module testbench();

reg [6:0]in;
wire [12:0]out;

ROM rom(in, out);

initial begin

    $display("in      | out");
    $monitor("%b|   %b   ", in, out);
    in = 7'b0000000;
    #1 in = 7'b0000000;
    //7'bxxxxxx0
    #1 in = 7'b0000010;
    #1 in = 7'b0000100;
    //7'b00001x1
    #1 in = 7'b0000101;
    #1 in = 7'b0000111;
    //7'b00000x1
    #1 in = 7'b0000001;
    #1 in = 7'b0000011;
    //7'b00011x1
    #1 in = 7'b0001101;
    #1 in = 7'b0001111;
    //7'b00010x1
    #1 in = 7'b0001011;
    #1 in = 7'b0001001;
    //7'b0010xx1
    #1 in = 7'b0010101;
    #1 in = 7'b0010011;
    //7'b0011xx1
    #1 in = 7'b0011001;
    #1 in = 7'b0011111;
    //7'b0100xx1
    #1 in = 7'b0100111;
    #1 in = 7'b0100011;
    //7'b0101xx1
    #1 in = 7'b0101101;
    #1 in = 7'b0101001;
    //7'b0110xx1
    #1 in = 7'b0110001;
    #1 in = 7'b0110111;
    //7'b0111xx1
    #1 in = 7'b0111101;
    #1 in = 7'b0111011;
    //7'b1000x11
    #1 in = 7'b1000111;
    #1 in = 7'b1000011;
    //7'b1000x01
    #1 in = 7'b1000001;
    #1 in = 7'b1000101;
    //7'b1001x11
    #1 in = 7'b1001011;
    #1 in = 7'b1001111;
    //7'b1001x01
    #1 in = 7'b1001101;
    #1 in = 7'b1001001;
    //7'b1010xx1
    #1 in = 7'b1010001;
    #1 in = 7'b1010111;
    //7'b1011xx1
    #1 in = 7'b1011111;
    #1 in = 7'b1011101;
    //7'b1100xx1
    #1 in = 7'b1100111;
    #1 in = 7'b1100001;
    //7'b1101xx1
    #1 in = 7'b1101001;
    #1 in = 7'b1101111;
    //7'b1110xx1
    #1 in = 7'b1110001;
    #1 in = 7'b1110111;
    //7'b1111xx1
    #1 in = 7'b1111011;
    #1 in = 7'b1111101;

end

initial
    #100 $finish;

initial begin
    $dumpfile("E5_tb.vcd");
    $dumpvars(0, testbench); 
end

endmodule