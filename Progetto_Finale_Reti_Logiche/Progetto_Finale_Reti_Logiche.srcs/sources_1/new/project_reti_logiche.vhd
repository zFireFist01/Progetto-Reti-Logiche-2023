library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity project_reti_logiche is
port (
    i_clk : in std_logic;
    i_rst : in std_logic;
    i_start : in std_logic;
    i_w : in std_logic;
    
    o_z0 : out std_logic_vector(7 downto 0);
    o_z1 : out std_logic_vector(7 downto 0);
    o_z2 : out std_logic_vector(7 downto 0);
    o_z3 : out std_logic_vector(7 downto 0);
    o_done : out std_logic;
    
    o_mem_addr : out std_logic_vector(15 downto 0);
    i_mem_data : in std_logic_vector(7 downto 0);
    o_mem_we : out std_logic;
    o_mem_en : out std_logic
);
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is
    type state_type is (S0, S1, S2, S3, S4, S5);
    signal next_state, current_state: state_type;
    signal sel_ch: std_logic_vector(1 downto 0);
    signal sel_addr: std_logic;
    signal sel_done: std_logic;
    signal sel_save: std_logic;
    signal addr : std_logic_vector(15 downto 0);
    signal ch: std_logic_vector(1 downto 0);
    signal save_z0: std_logic_vector(7 downto 0);
    signal save_z1: std_logic_vector(7 downto 0);
    signal save_z2: std_logic_vector(7 downto 0);
    signal save_z3: std_logic_vector(7 downto 0);
    
begin
    --Processo per la gestione del current_state
    state_reg:process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            current_state <= S0;
        elsif rising_edge(i_clk) then
            current_state <= next_state;
        end if;
    end process;
    

    --Processo per la gestione del next_state
    nextstate_FSM: process(current_state, i_start)
    begin
        next_state <= current_state;
        case current_state is
            when S0 => 
                if i_start = '0' then
                    next_state <= S0;
                else 
                    next_state <= S1;    
                end if;
            when S1 =>
                if i_start = '1' then 
                    next_state <= S2;
                end if;
            when S2 =>
                if i_start = '1' then
                    next_state <= S2;
                else
                    next_state <= S3;
                end if;
            when S3 => 
                if i_start = '0' then
                    next_state <= S4;
                end if;
            when S4 =>
                if i_start = '0' then
                    next_state <= S5;
                end if;
            when S5 =>
                if i_start = '0' then
                    next_state <= S0;
                end if;     
        end case;   
    end process;
    
    --Processo per la gestione dei segnali di controllo in ogni stato 
    output_FSM: process(current_state)
    begin
        sel_ch <= "00";
        sel_addr <= '0';
        sel_done <= '0';
        sel_save <= '0';
        o_mem_en <= '0';
        case current_state is 
            when S0 =>
                sel_ch <= "01";
            when S1 =>
                sel_ch <= "10";    
            when S2 =>
                sel_ch <= "00";
                sel_addr <= '1';
            when S3 =>
                sel_addr <= '0';
                o_mem_en <= '1';
            when S4 =>
                o_mem_en <= '0';
                sel_save <= '1';
            when S5 =>
                sel_save <= '0';
                sel_done <= '1';
         end case;
    end process;

    o_mem_we <= '0';
    
    
    --Processi per la gestione dei valori delle uscite
    o_z0_manage: process(sel_done)
    begin
        if sel_done = '1' then
            o_z0 <= save_z0;
        elsif sel_done = '0' then
            o_z0 <= (others => '0');
        end if;
    end process;

    o_z1_manage: process(sel_done)
    begin
        if sel_done = '1' then
            o_z1 <= save_z1;
        elsif sel_done = '0' then
           o_z1 <= (others => '0');
        end if;
    end process;

    o_z2_manage: process(sel_done)
    begin
        if sel_done = '1' then
            o_z2 <= save_z2;
        elsif sel_done = '0' then
            o_z2 <= (others => '0');
        end if;
    end process;

    o_z3_manage: process(sel_done)
    begin
        if sel_done = '1' then
            o_z3 <= save_z3;
        elsif sel_done = '0' then
            o_z3 <= (others => '0');
        end if;
    end process;

    done_manage: process(sel_done)
    begin
        if sel_done = '1' then 
            o_done <= '1';
        elsif sel_done = '0' then
            o_done <= '0';
        end if;
    end process;
    


    --Processi per la gestione dei registri che salvano i mesaggi ricevuti dalla memoria
    save_z0_manage: process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            save_z0 <= "00000000";
        elsif rising_edge(i_clk) then
            if sel_save = '1' and ch = "00" then
                save_z0 <= i_mem_data;
            end if;
        end if;
    end process;

    save_z1_manage: process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            save_z1 <= "00000000";
        elsif rising_edge(i_clk) then
            if sel_save = '1' and ch = "01" then
                save_z1 <= i_mem_data;
            end if;
        end if;
    end process;

    save_z2_manage: process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            save_z2 <= "00000000";
        elsif rising_edge(i_clk) then
            if sel_save = '1' and ch = "10" then
                save_z2 <= i_mem_data;
            end if;
        end if;
    end process;

    save_z3_manage: process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            save_z3 <= "00000000";
        elsif rising_edge(i_clk) then
            if sel_save = '1' and ch = "11" then
                save_z3 <= i_mem_data;
            end if;
        end if;
    end process;


    --Processo per la gestione dell'indirizzo di memoria ricevuto in maniera sequenziale
    addr_manage: process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            addr <= "0000000000000000";
        elsif rising_edge(i_clk) then
            if sel_ch = "01" then
                addr <= (others => '0');
            elsif sel_addr = '1' and i_start = '1' then
                addr <= addr(14 downto 0) & i_w;
            end if;
        end if;
    end process;
    

    --Processo per la gestione del canale di intestazione ricevuto in maniera sequenziale
    ch_manage: process(i_clk, i_rst)
    begin
        if i_rst = '1' then
            ch <= "00";
        elsif rising_edge(i_clk) then
            if sel_ch = "01" then
                if i_start = '1' then
                    ch(1) <= i_w;
                end if;
            elsif sel_ch = "10" then
                ch(0) <= i_w;
            end if;
        end if;
    end process;
    
    
    o_mem_addr <= addr;         
    
end Behavioral;
