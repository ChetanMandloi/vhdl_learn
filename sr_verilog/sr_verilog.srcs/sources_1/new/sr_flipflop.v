module sr_flipflop(
    input clk,
    input set,
    input reset,
    input ena,
    output reg q,
    output reg q_n
    );
    
    always @ (posedge clk)
        begin
            if (ena == 1'b1)
                begin
                    if (set == 1'b1 && reset == 1'b1)
                        begin
                            q <= q;
                            q_n <= ~q;
                        end
                    else if (set == 1'b1 && reset == 1'b0)
                        begin
                            q <= 1'b0;
                            q_n <= 1'b1;
                        end
                    else if (set == 1'b0 && reset == 1'b1)
                        begin
                            q <= 1'b1;
                            q_n <= 1'b0;
                        end
                    else
                        begin
                            q <= 1'bz;
                            q_n <= 1'bz;
                        end
                end
            else
                begin
                    q <= 1'b0;
                    q_n <= 1'b0;
                end
        end
    
endmodule
