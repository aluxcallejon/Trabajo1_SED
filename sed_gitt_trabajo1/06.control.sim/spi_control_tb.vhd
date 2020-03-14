-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, el fichero de simulación no tiene)
-- **********************************************************************
ENTITY spi_control_test IS
END    spi_control_test;

-- **********************************************************************
-- ARQUITECTURA   (descripción de los estímulos)
-- **********************************************************************
ARCHITECTURE spi_control_test_arq OF spi_control_test IS
    --Declaración de componentes




    --señales internas
     
    
	
	
    
    constant ciclo : time := 1 ms; 


BEGIN
    -- ///////////////////////////////////////////////////////////////////////////////
    -- Se crea el componente U4 y se conecta a las señales internas de la arquitectura
    -- ///////////////////////////////////////////////////////////////////////////////
    U4: spi_control PORT MAP(
                                clk       =>  CLK_test,

								-- completar resto de señales



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
	    -- valores iniciales para "todas" las entradas
        TRANSMITE_test  <= '0';
        RESETN_test  <= '0';
        wait for 2.5*ciclo;
        
        -- resetn='1'. Termina el resetn






        -- Señal de captura




        
        wait;            -- espera infinita: fin de simulación
    end process tb;
    
    

    
END spi_control_test_arq;





























