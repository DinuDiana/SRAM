library verilog;
use verilog.vl_types.all;
entity sram is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        write_enable    : out    vl_logic;
        output_enable   : out    vl_logic;
        chip_enable     : out    vl_logic;
        lower_byte_ctrl : out    vl_logic;
        upper_byte_ctrl : out    vl_logic;
        sram_addr       : out    vl_logic_vector(17 downto 0);
        sram_data       : inout  vl_logic_vector(15 downto 0);
        address         : in     vl_logic_vector(3 downto 0);
        data            : in     vl_logic_vector(3 downto 0);
        write_enable_user: in     vl_logic;
        output_enable_user: in     vl_logic;
        data_out_7_segm : out    vl_logic_vector(6 downto 0);
        address_7_segm  : out    vl_logic_vector(6 downto 0);
        address_to_display: out    vl_logic_vector(17 downto 0);
        data_to_display : out    vl_logic_vector(15 downto 0)
    );
end sram;
