-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, el fichero de simulación no tiene)
-- **********************************************************************
ENTITY spi_top_test IS
END    spi_top_test;

-- **********************************************************************
-- ARQUITECTURA   (descripción de los estímulos)
-- **********************************************************************
ARCHITECTURE spi_top_test_arq OF spi_top_test IS
    --Declaración de componentes
    COMPONENT spi_top
     PORT(
          clk      :  IN   std_logic;
          resetn   :  IN   std_logic;
          inicio   :  IN   std_logic;

          byte0    :  IN std_logic_vector(7 DOWNTO 0);
          byte1    :  IN std_logic_vector(7 DOWNTO 0);

          SSn      :  OUT  std_logic;
          SCK      :  OUT  std_logic;
          MOSI     :  OUT  std_logic
     );
    END COMPONENT;

    -- Entradas
    SIGNAL CLK_test     : std_logic;
    SIGNAL RESETN_test  : std_logic;
    SIGNAL INICIO_test  : std_logic;
    SIGNAL BYTE0_test   : std_logic_vector(7 downto 0);
    SIGNAL BYTE1_test   : std_logic_vector(7 downto 0);
    
    -- Salida
    SIGNAL SCK_test     : std_logic;
    SIGNAL MOSI_test    : std_logic;
    SIGNAL SSn_test     : std_logic;
    
    -- Internas
    SIGNAL STOP_test:  std_logic := '0' ;       -- Indica fin de simulación. Se pone a '1' al final de la simulacion. 
                                               -- Se utiliza para bloquear el reloj y apreciar mejor el final de la simulación.
    
    constant ciclo : time := 1 ms; 


BEGIN
    -- ///////////////////////////////////////////////////////////////////////////////
    -- Se crea el componente U10 y se conecta a las señales internas de la arquitectura
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
        -- Valor inicial de todas las entradas
        RESETN_test <= '0';
        INICIO_test <= '0';
        BYTE0_test  <= "--------";     -- poner valores adecuados
        BYTE1_test  <= "--------";     -- poner valores adecuados
        wait for 8*ciclo/7;
        
        -- resetn='1'. Termina el resetn
        
        
        
        
        -- Pulso de inicio de 5 ciclos (tamaño aleatorio)
        
        
        
        
        
        wait;                  -- espera infinita: fin de simulación
    end process tb;
    
    

    
END spi_top_test_arq;






























