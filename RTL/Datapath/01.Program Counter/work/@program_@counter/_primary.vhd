library verilog;
use verilog.vl_types.all;
entity Program_Counter is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        in_pc           : in     vl_logic_vector(31 downto 0);
        out_pc          : out    vl_logic_vector(31 downto 0)
    );
end Program_Counter;
