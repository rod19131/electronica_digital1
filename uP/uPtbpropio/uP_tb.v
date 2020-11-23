//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Proyecto 2 uP
module testbench();
    reg clock, reset;
    reg [3:0] pushbuttons;
    wire phase, c_flag, z_flag;
    wire [3:0] instr, oprnd, accu, data_bus, FF_out;
    wire [7:0] program_byte;
    wire [11:0] PC, address_RAM;

    uP uPmodulue(clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, accu, data_bus, FF_out, program_byte, PC, address_RAM);
    initial
        #1000 $finish;
    
    always 
        #5 clock = ~clock;
    
    initial begin
        clock = 0; reset = 0; pushbuttons = 4'b0110;
        #2 reset = 1;
        #1 reset = 0;
    end
    initial begin
        $dumpfile("uP_tb.vcd");
        $dumpvars(0, testbench);
    end
    initial begin
        #16
        if (accu === 4'hF) begin
            $display("Módulo ACCU funciona correctamente");
        end
        else
            $display("Módulo ACCU NO funciona correctamente");
    end

    initial begin
        #116
        if (c_flag === 1'b1 && z_flag === 1'b0 && data_bus === 4'h9) begin
            $display("Módulo ALU y buffer triestado ALU funciona correctamente");
        end
        else
            $display("Módulo ALU y/o buffer triestado ALU NO funciona correctamente");
    end

    initial begin
        #247
        if (data_bus === 4'h6) begin
            $display("Módulo INPUTS funciona correctamente");
        end
        else
            $display("Módulo INPUTS NO funciona correctamente");
    end
    
    initial begin
        #287
        if (data_bus === 4'hF) begin
            $display("Módulo BUSOPRND funciona correctamente");
        end
        else
            $display("Módulo BUSOPRND NO funciona correctamente");
    end

    initial begin
        #296
        if ( {instr, c_flag, z_flag, phase} === 7'h20 && accu === 4'hF) begin
            $display("Módulo DECODE funciona correctamente");
        end
        else
            $display("Módulo DECODE NO funciona correctamente");
    end

    initial begin
        #297
        if ( instr === 4'h4 && oprnd === 4'hF && program_byte === 8'h71) begin
            $display("Módulo FETCH funciona correctamente");
        end
        else
            $display("Módulo FETCH NO funciona correctamente");
    end
    initial begin
        #92
        if ( c_flag === 1'b0 && z_flag === 1'b1) begin
            $display("Módulo FLAGS funciona correctamente");
        end
        else
            $display("Módulo FLAGS NO funciona correctamente");
    end
    initial begin
        #238
        if ( FF_out === 4'h4 && instr === 4'hD && c_flag === 1'b0 && z_flag === 1'b0 && phase === 1'b0) begin
            $display("Módulo OUTPUTS funciona correctamente");
        end
        else
            $display("Módulo OUTPUTS NO funciona correctamente");
    end
    initial begin
        #6
        if (phase === 1'b1) begin
            $display("Módulo PHASE funciona correctamente");
        end
        else
            $display("Módulo PHASE NO funciona correctamente");
    end
    initial begin
        #14
        if (phase === 1'b1) begin
            $display("Módulo PHASE funciona correctamente");
        end
        else
            $display("Módulo PHASE NO funciona correctamente");
    end
    initial begin
        #209
        if (PC === 12'h00B) begin
            $display("Módulo PROGRAMCOUNTER funciona correctamente");
        end
        else
            $display("Módulo PROGRAMCOUNTER NO funciona correctamente");
    end
    initial begin
        #209
        if (PC === 12'h00B) begin
            $display("Módulo PROGRAMCOUNTER funciona correctamente");
        end
        else
            $display("Módulo PROGRAMCOUNTER NO funciona correctamente");
    end
    initial begin
        #109
        if (address_RAM === 12'hA28 && data_bus == 4'hA) begin
            $display("Módulo RAM funciona correctamente");
        end
        else
            $display("Módulo RAM NO funciona correctamente");
    end
    initial begin
        #9
        if (program_byte === 8'hDF && PC == 12'h001) begin
            $display("Módulo ROM funciona correctamente");
        end
        else
            $display("Módulo ROM NO funciona correctamente");
    end
endmodule

