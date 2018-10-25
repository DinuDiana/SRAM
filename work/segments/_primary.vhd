library verilog;
use verilog.vl_types.all;
entity segments is
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        enable          : in     vl_logic;
        \out\           : out    vl_logic_vector(6 downto 0)
    );
end segments;
