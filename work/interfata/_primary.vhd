library verilog;
use verilog.vl_types.all;
entity interfata is
    port(
        clock           : in     vl_logic;
        write_enable    : in     vl_logic;
        chip_enable     : in     vl_logic;
        output_enable   : in     vl_logic;
        data_in         : in     vl_logic_vector(3 downto 0);
        address         : in     vl_logic_vector(3 downto 0);
        data_out_7_segm : out    vl_logic_vector(6 downto 0);
        address_7_segm  : out    vl_logic_vector(6 downto 0);
        write_enable_to_chip: out    vl_logic;
        chip_enable_to_chip: out    vl_logic;
        output_enable_to_chip: out    vl_logic;
        sram_address    : out    vl_logic_vector(17 downto 0);
        sram_data       : inout  vl_logic_vector(15 downto 0)
    );
end interfata;
