-- **********************************************************************
-- LIBRERIAS
-- **********************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- **********************************************************************
-- ENTIDAD     (entradas/salidas, visto como una caja negra)
-- **********************************************************************
ENTITY spi_control IS
     PORT(
          clk       :  IN   std_logic;
          resetn    :  IN   std_logic;
          transmite :  IN   std_logic;

          SSn       :  OUT  std_logic;
          SCK       :  OUT  std_logic
     );
END spi_control;



-- **********************************************************************
-- ARQUITECTURA     (instrucciones)
-- **********************************************************************
ARCHITECTURE spi_control_arq OF spi_control IS
     TYPE ESTADOS IS (reposo, byte0, separa, byte1);
     SIGNAL estadoByte_s, estadoByte_c : ESTADOS;              -- Estados aut�mata "Trama"
     
     TYPE ESTADOS8BITS IS (reposo,reloj_1, reloj_0);
     SIGNAL estado8bits_s, estado8bits_c : ESTADOS8BITS;       -- Estados aut�mata "Bits"
     
     
     SIGNAL cuenta_s, cuenta_c: std_logic_vector(2 downto 0);  -- contador que cuenta de 0 a 7 
     
     SIGNAL  ini_8bits,fin_8bits :  std_logic;                 -- Se�ales internas para comunicarse los dos aut�matas

BEGIN
    -- ------------------------------------------------------
    -- Proceso s�ncrono para ambos aut�matas. Se asigna �estadoByte_s�, "estado78bits_s" y "cuenta_s"
    -- ------------------------------------------------------
    PROCESS (clk,resetn)
    BEGIN
        IF (resetn='0') THEN            -- resetn activo a nviel bajo
            estadoByte_s   <=reposo;
            estado8bits_s  <=reposo;
            cuenta_s       <= "000";

        ELSIF (clk'EVENT AND clk='1') THEN
            estadoByte_s   <= estadoByte_c;
            estado8bits_s  <= estado8bits_c;
            cuenta_s       <= cuenta_c;

       END IF;
    END PROCESS;

    -- ------------------------------------------------------
    -- Aut�mata "Trama". Proceso combinacional
    -- Se asignan las salidas del aut�mata "Trama": SSn y ini_8bits
    -- ------------------------------------------------------
    Trama_comb_salidas: PROCESS (estadoByte_s,transmite)
    BEGIN
        SSn <= '0';                      -- Valor por defecto 
        ini_8bits  <= transmite;         -- Valor por defecto: entrada "transmite" que es un pulso de un ciclo de reloj
                                         -- M�s adelante, en un determinado estado volver� a dar otro pulso para el 
                                         -- comienzo de los 8 ciclos del segundo byte


        -- Incluir c�digo con posibles nuevos valores de las se�ales SSn y  ini_8bits en funci�n del estado







     END PROCESS;

    -- ------------------------------------------------------
    -- Aut�mta "Trama"
    -- Proceso combinacional. Se asigna la se�al interna "estadoByte_c".  
    -- ------------------------------------------------------
   Trama_comb_transiciones: PROCESS (estadoByte_s, fin_8bits, transmite)
    BEGIN
 
        CASE estadoByte_s IS
            WHEN reposo =>
                
            --  -------------------------------------
            WHEN byte0 =>



            --  -------------------------------------
            WHEN separa =>
                

            --  -------------------------------------
            WHEN byte1 =>



            WHEN OTHERS =>

        END CASE;
   END PROCESS;


   
   
    -- ------------------------------------------------------
    -- Aut�mata "Bits". Proceso combinacional
    -- Se asignan las salidas del aut�mata "Bits": SCK y fin_8bits
    -- ------------------------------------------------------
    Bits_comb_salidas: PROCESS (estado8bits_s)
    BEGIN
        SCK          <= '0';     -- valor de reposo
        fin_8bits    <= '0';     -- valor de reposo



        -- Incluir c�digo para que las se�ales SCK y fin_8bits de un pulso a nivel alto en los estados apropiados



        

     END PROCESS;

   
    -- ------------------------------------------------------
    -- Aut�mta "Trama"
    -- Proceso combinacional. Se asigna la se�al interna "estadoByte_c" y "cuenta_c" 
    -- ------------------------------------------------------
    Bits_comb_transiciones: PROCESS (estado8bits_s, cuenta_s, ini_8bits)
    BEGIN
        -- --------------------
        cuenta_c      <= cuenta_s;        -- valor por defecto. Se queda en la cuenta actual
        estado8bits_c <= estado8bits_c;   -- valor por defecto. Se queda en el estado actual
        -- --------------------

        CASE estado8bits_s IS
            WHEN reposo =>
                
            -- -----------------------------------------------------
            WHEN reloj_1 =>
 
 
            -- -----------------------------------------------------
            WHEN reloj_0 =>
                                            
 
            -- -----------------------------------------------------
            WHEN OTHERS =>

           END CASE;
   END PROCESS;
   
   
END spi_control_arq;





















