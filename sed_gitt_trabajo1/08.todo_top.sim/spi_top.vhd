-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- **********************************************************************
-- ENTIDAD     (entradas/salidas, el fichero de simulación no tiene)
-- **********************************************************************
ENTITY spi_top IS
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
END spi_top;

-- **********************************************************************
-- ARQUITECTURA   (descripción de los estímulos)
-- **********************************************************************
ARCHITECTURE spi_top_arq OF spi_top IS
    --Declaración de componentes
    COMPONENT spi_desplaza
    PORT (
        clk     : IN std_logic;
        resetn  : IN std_logic;
        bit_i   : IN std_logic;          -- bit de byte (a GND si no lo necesita)
        captura : IN std_logic;          -- captura los 8 bits de entrada
        desplaza: IN std_logic;          -- desplaza una posicion
        byte    : IN std_logic_vector(7 DOWNTO 0);

        bit_o   : OUT std_logic
    );
    END COMPONENT;

    COMPONENT spi_inicio
    PORT (
        clk     : IN std_logic;
        resetn  : IN std_logic;
        inicio  : IN std_logic;             -- desplaza una posicion
        
        pulso1_captura   : OUT  std_logic;  -- estado los 8 bits de entrada
        pulso2_transmite : OUT  std_logic
    );
    END COMPONENT;

    COMPONENT spi_control
     PORT(
          clk       :  IN   std_logic;
          resetn    :  IN   std_logic;
          transmite :  IN   std_logic;

          SSn       :  OUT  std_logic;
          SCK       :  OUT  std_logic
     );
    END COMPONENT;



    -- Entradas
    SIGNAL DESPLAZA: std_logic;
    SIGNAL CAPTURA : std_logic;
    SIGNAL ARRANCA : std_logic;

    SIGNAL BIT_I: std_logic;

    -- Salida
    SIGNAL FIN_8BITS: std_logic;


BEGIN

    --  --------------
    SCK  <=  DESPLAZA;            -- Salida externa de la ENTITY
    --  --------------
    

    -- ///////////////////////////////////////////////////////////////////////////////
    -- Se crea el componente U1 y se conecta a las señales internas de la arquitectura
    -- ///////////////////////////////////////////////////////////////////////////////
    U1: spi_desplaza PORT MAP(
                                clk       =>  clk,
                                resetn    =>  resetn,
                                captura   =>  CAPTURA,
                                bit_i     =>  BIT_I,        -- Entrada. Procede de la salida del componente U2:bit_o
                                desplaza  =>  DESPLAZA,
                                byte      =>  byte0,

                                bit_o     =>  MOSI
                            );

    U2: spi_desplaza PORT MAP(
                                clk       =>  clk,
                                resetn    =>  resetn,
                                captura   =>  CAPTURA,
                                bit_i     =>  '0',            -- Entrada a GND. Por aquí entra nivel bajo '0'
                                desplaza  =>  DESPLAZA,
                                byte      =>  byte1,

                                bit_o     =>  BIT_I           -- Salida. Va a la entrada del componente U1:bit_i
                            );

    U3: spi_inicio PORT MAP(
                                clk       =>  clk,
                                resetn    =>  resetn,
                                inicio    =>  inicio,
                                -- ------------------------
                                pulso1_captura   =>  CAPTURA,
                                pulso2_transmite =>  ARRANCA
                            );

    U4: spi_control PORT MAP(
                                clk       =>  clk,
                                resetn    =>  resetn,
                                transmite =>  ARRANCA,
                                -- ------------------------
                                SSn       =>  SSn,              -- SSn, Salida externa
                                SCK       =>  DESPLAZA          -- SCK, salida externa  
                            );

 
END spi_top_arq;



















































