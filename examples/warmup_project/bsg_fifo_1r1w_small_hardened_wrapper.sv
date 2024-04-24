
module bsg_fifo_1r1w_small_hardened_wrapper #(parameter width_p = 16
                            , parameter els_p = 4
                            , parameter ready_THEN_valid_p = 0
                            )
    ( input                clk_i
    , input                reset_i

    , input                v_i
    , output               ready_param_o
    , input [width_p-1:0]  data_i

    , output               v_o
    , output [width_p-1:0] data_o
    , input                yumi_i
    );

    // Instantiate DUT
    bsg_fifo_1r1w_small_hardened #(.width_p(width_p)
                                  ,.els_p(els_p)
                                  ,.ready_THEN_valid_p(ready_THEN_valid_p)
                                  ) fifo
    (.*);

    // Bind Covergroups
    bind bsg_fifo_1r1w_small_hardened bsg_fifo_1r1w_small_hardened_cov
   #(.els_p(els_p)
    ) pc_cov
    (.*
    );

    // Dump Waveforms
    initial begin
        $fsdbDumpvars;
    end

endmodule
