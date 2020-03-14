-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, el fichero de simulación no tiene)
-- **********************************************************************
ENTITY spi_desplaza_test IS
END    spi_desplaza_test;

-- **********************************************************************
-- ARQUITECTURA   (descripción de los estímulos)
-- **********************************************************************
ARCHITECTURE spi_desplaza_test_arq OF spi_desplaza_test IS
    --Declaración de componentes
    COMPONENT spi_desplaza
    PORT (
				-- completar

    );
    END COMPONENT;

    -- Señales internas
    SIGNAL CLK_test      : std_logic;
    SIGNAL RESETN_test   : std_logic;

	                 -- Completar
	
	
	
    
    constant ciclo : time := 1 ms; 


BEGIN
    -- ///////////////////////////////////////////////////////////////////////////////
    -- Se crea el componente U1 y se conecta a las señales internas de la arquitectura
    -- ///////////////////////////////////////////////////////////////////////////////







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
        BYTE_test  <= "--------";      -- Primer  byte a transmitir
        wait for 2*ciclo;
        
        -- resetn='1'. Termina el resetn



        -- Señal de captura. Pulso de un ciclo de reloj







        -- 8 pulsos de DESPLAZA_test de un ciclo de clk 
        -- Se realizará mediante un bucle         







        
        wait;            -- espera infinita: fin de simulación
    end process tb;
    
    

    
END spi_desplaza_test_arq;





























