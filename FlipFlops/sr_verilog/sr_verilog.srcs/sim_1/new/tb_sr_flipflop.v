module tb_sr_flipflop;

    reg clk, set, reset, ena;
    wire q, q_n;
    
    /*
     * 100Mhz (10ns) clock 
     */
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end
    
    always begin 
        ena = 1; #100;
        ena = 0; #100;
    end
    
    always begin
        set = 1; #25; // set = 1 reset = 1 ena = 1 so q = q q_n = ~q
        set = 1; #25; // set = 1 reset = 0 ena = 1 so q = 0 q_n = 1
        set = 0; #25; // set = 0 reset = 1 ena = 1 so q = 1 q_n = 0
        set = 0; #25; // set = 0 reset = 0 ena = 1 so q = z q_n = z
        
        set = 1; #25; // set = 1 reset = 1 ena = 0 so q = 0 q_n = 0
        set = 1; #25; // set = 1 reset = 0 ena = 0 so q = 0 q_n = 0
        set = 0; #25; // set = 0 reset = 1 ena = 0 so q = 0 q_n = 0
        set = 0; #25; // set = 0 reset = 0 ena = 0 so q = 0 q_n = 0
    end
    
    always begin
        reset = 1; #25; // set = 1 reset = 1 ena = 1 so q = q q_n = ~q
        reset = 0; #25; // set = 1 reset = 0 ena = 1 so q = 0 q_n = 1
        reset = 1; #25; // set = 0 reset = 1 ena = 1 so q = 1 q_n = 0
        reset = 0; #25; // set = 0 reset = 0 ena = 1 so q = z q_n = z
        
        reset = 1; #25; // set = 1 reset = 1 ena = 0 so q = 0 q_ = 0
        reset = 0; #25; // set = 1 reset = 0 ena = 0 so q = 0 q_ = 0
        reset = 1; #25; // set = 0 reset = 1 ena = 0 so q = 0 q_ = 0
        reset = 0; #25; // set = 0 reset = 0 ena = 0 so q = 0 q_ = 0
    end
    
    sr_flipflop sr_flipflop_i(
        .clk(clk),
        .set(set),
        .reset(reset),
        .ena(ena),
        .q(q),
        .q_n(q_n)
    );
    
endmodule
