-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, visto como una caja negra)
-- **********************************************************************
ENTITY spi_inicio IS
    PORT (
        clk     : IN std_logic;
        resetn  : IN std_logic;
        inicio  : IN std_logic;          -- desplaza una posicion
        
        pulso1_captura   : OUT  std_logic;          -- estado los 8 bits de entrada
        pulso2_transmite : OUT  std_logic
    );
END spi_inicio;



-- **********************************************************************
-- ARQUITECTURA   (descripción de la circuitería)
-- **********************************************************************
ARCHITECTURE spi_inicio_arq OF spi_inicio IS
    
     -- Señales internas para los estados


BEGIN

    -- ------------------------------------------------------
    -- Proceso síncrono del autómata
    -- ------------------------------------------------------
    PROCESS (clk,resetn)
    BEGIN

    -- Incluir código





    END PROCESS;
    
   
    -- ------------------------------------------------------
    -- Proceso combinacional. Se asigna las salidas  
    -- ------------------------------------------------------
    PROCESS (estado_s)
    BEGIN
        pulso1_captura    <= '0';       -- valor por defecto
        pulso2_transmite  <= '0';       -- valor por defecto  

        -- Añadir condiciones en función del estado
        
        
        
        
        
    END PROCESS;
 
    -- ------------------------------------------------------
    -- Proceso combinacional. Asigna la señal "estado_c"
    -- ------------------------------------------------------
    PROCESS(xxx,yyy)
    BEGIN
    
        -- Instrucciones secuenciales
    
    
    
    END PROCESS;

    
END spi_inicio_arq;













