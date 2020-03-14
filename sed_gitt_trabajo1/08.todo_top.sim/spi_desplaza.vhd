-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, visto como una caja negra)
-- **********************************************************************
ENTITY spi_desplaza IS
    PORT (
        clk     : IN std_logic;
        resetn  : IN std_logic;

        captura : IN  std_logic;          -- captura los 8 bits de entrada
        byte    : IN  std_logic_vector(7 DOWNTO 0);

        desplaza: IN std_logic;          -- desplaza una posicion
        bit_i   : IN std_logic;          -- bit de entrada (a GND si no lo necesita)
        
        bit_o   : OUT std_logic
    );
END spi_desplaza;



-- **********************************************************************
-- ARQUITECTURA   (descripción de la circuitería)
-- **********************************************************************
ARCHITECTURE spi_desplaza_arq OF spi_desplaza IS
     SIGNAL reg8bits : std_logic_vector(7 DOWNTO 0);
BEGIN
    -- ----------------------
    bit_o <=  xxxxxx;
    -- ----------------------

    PROCESS (clk,resetn)
    BEGIN
        IF (resetn='0') THEN
            reg8bits  <= (OTHERS => '0');
        ELSIF (clk' EVENT AND clk='1') THEN


            -- El código debe estar aquí. 
            -- Es el flanco de subida del reloj



        END IF;
    END PROCESS;
      
END spi_desplaza_arq;











