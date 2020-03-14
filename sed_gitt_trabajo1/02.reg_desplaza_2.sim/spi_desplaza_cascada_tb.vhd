-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, el fichero de simulación no tiene)
-- **********************************************************************
ENTITY spi_desplaza_cascada_test IS
END    spi_desplaza_cascada_test;

-- **********************************************************************
-- ARQUITECTURA   (descripción de los estímulos)
-- **********************************************************************
ARCHITECTURE spi_desplaza_cascada_test_arq OF spi_desplaza_cascada_test IS
    --Declaración de componentes
    COMPONENT spi_desplaza
    PORT (
        clk     : IN std_logic;
        resetn  : IN std_logic;

        captura : IN  std_logic;          -- captura los 8 bits de entrada
        byte    : IN  std_logic_vector(7 DOWNTO 0);

        desplaza: IN std_logic;          -- desplaza una posicion
        bit_i   : IN std_logic;          -- bit de entrada (a GND si no lo necesita)
        bit_o   : OUT std_logic
    );
    END COMPONENT;

    -- Entradas
    SIGNAL CLK_test      : std_logic;
    SIGNAL RESETN_test   : std_logic;
    SIGNAL CAPTURA_test  : std_logic;
    SIGNAL DESPLAZA_test : std_logic;
    SIGNAL BYTE_0_test : std_logic_vector(7 downto 0);
    SIGNAL BYTE_1_test : std_logic_vector(7 downto 0);
    
    -- Salida
    SIGNAL bit_o_test    : std_logic;
    
    
    -- interna. Conecta salida serie de U1:bit_o con la entrada serie de U2:bit_i
    SIGNAL conecta_serie : std_logic;
    
    constant ciclo : time := 1 ms; 


BEGIN
    -- ///////////////////////////////////////////////////////////////////////////////
    -- Se crea el componente U1 y se conecta a las señales internas de la arquitectura
    -- ///////////////////////////////////////////////////////////////////////////////
    U1: spi_desplaza PORT MAP(
                                clk       =>  CLK_test,
                                resetn    =>  RESETN_test,
                                captura   =>  CAPTURA_test,
                                byte      =>  BYTE_0_test,

                                desplaza  =>  DESPLAZA_test,
                                bit_i     =>  conecta_serie,         -- procede de la salida del componente U2:bit_o
                                bit_o     =>  BIT_o_test
                            );

    U2: spi_desplaza PORT MAP(
                                clk       =>  CLK_test,
                                resetn    =>  RESETN_test,
                                captura   =>  CAPTURA_test,
                                byte      =>  BYTE_1_test,

                                desplaza  =>  DESPLAZA_test,
                                bit_i     =>  '0',                 -- entrada conectado a GND
                                bit_o     =>  conecta_serie        -- va a la entrada del componente U1:bit_i
                            );
    -- ======================================================================
    -- Proceso del reloj. Se asigna la entrada CLK_test
    -- ======================================================================
    GenCLK: process
    begin
        CLK_test<= '0';     wait for ciclo/2;
        CLK_test<= '1';     wait for ciclo/2;
    end process GenCLK;

    -- ======================================================================
    -- Proceso para el banco de pruebas para el componente de tipo "tren"
    -- ======================================================================
    tb: PROCESS
    BEGIN
	    -- Valores iniciales para "todas" las entradas
        RESETN_test  <= '0';
        CAPTURA_test <= '0';
        DESPLAZA_test<= '0';
        BYTE_0_test  <= "--------";      -- Primer  byte a transmitir
        BYTE_1_test  <= "--------";      -- Segundo byte a transmitir
        wait for 2*ciclo;
        
        -- resetn='1'. Termina el resetn



        -- Señal de captura. Pulso de un ciclo de reloj







        -- 16 pulsos de DESPLAZA_test de un ciclo de clk 
        -- Se realizará mediante un bucle         







        
        wait;            -- espera infinita: fin de simulación
    end process tb;
    
    

    
END spi_desplaza_cascada_test_arq;





























