Apuntes sobre los videos del curso de Susana Canel y otros apuntes teóricos.

https://www.youtube.com/c/SusanaCanel/videos

## AND2

En este video te muestro cómo usar en forma sencilla el ModelSim. Uso la versión 10.5b. Muestro cómo escribir un banco de pruebas (testbench).  La estructura de un testbench y algunas de sus características. Uso VHDL para simulación. Nuevas sentencias: wait, wait for, assert, report,  severity note, severity failure. Nuevo tipo de datos: datos físicos,  time (tiene valor y unidad).

https://www.youtube.com/watch?v=ECCojuso5nU

En este video continuo con el ejemplo que estábamos analizando de la  simulación de la compuerta AND de 2 entradas, te muestro cómo realizar  la simulación creando las formas de las señales. Te familiarizo con el  ModelSim explicándote cómo se realiza una nueva simulación cuando se  hace alguna modificación, cómo se pueden medir tiempos usando dos  cursores y cómo mostrar toda la simulación en el ancho de la ventana  (usando la lupa azul).

https://www.youtube.com/watch?v=NnUWXXSm27M

## Decodificador de 3 a 8 con habilitación

Con este video inicio la **Lección 2**, que corresponde a **descripciones VHDL de dispositivos combinacionales de propósitos generales** o MSI. Describo un decodificador de 3 entradas a 8 salidas activas en  alto, con entrada de habilitación también activa en alto. Uso las  sentencias *with-select* para generar la tabla de verdad y las sentencias *when else* para poner la condición de habilitación. Uso *when-others* para cubrir todos los casos y la expresión *(others =>’0′)* para generar un *std_logic_vector* en 0 sin tener que conocer la dimensión del vector (el *software* ya posee esa información).

https://www.youtube.com/watch?v=m_sGZptSEe0

En este video te explico cómo escribir un banco de pruebas (testbench)  para un decodificador de 3 a 8 con entrada de habilitación. Uso el  ModelSim de Intel-Altera, versión 10.5b. Muestro las formas de ondas  generadas. Te explico cómo dar por terminada la simulación y cómo cerrar el proyecto.

https://www.youtube.com/watch?v=SR_fcMu4ox4

En este video te muestro cómo generar los estímulos y controlar si la  salida del decodificador es la esperada usando una sentencia “for”.  Vemos que hay que realizar adaptaciones al testbench anterior cuando  usamos la sentencia for, incluir el package numeric_std y usar un  atributo ‘image. En la simulación comparo con las formas de ondas  generadas en el testbench anterior y veo las limitaciones que se  obtienen en la simulación cuando usamos la sentencia “for” para generar  las señales.

https://www.youtube.com/watch?v=bW4OGe_iGBM

## Multiplexor de 4 canales

En este video te muestro la descripción de un multiplexor de 4 canales  usando with-select para generar una tabla. Además adrede cometí un error en la descripción para mostrarte cómo lo informa el compilador.

https://www.youtube.com/watch?v=LngtnzPVU3I

En este video te explico un sencillo testbench para un multiplexor de 4  canales. Uso for loop. Luego provoco adrede errores en la descripción  del multiplexor para analizar cómo actúa “failure”. posteriormente  cambio “failure” por “warning” para no abortar la simulación y analizo  problemas al elegir el lote de pruebas.

https://www.youtube.com/watch?v=heUq3zRRQWI

En este video te muestro una optimización del testbench para el  multiplexor de 4 canales de manera de probar las 64 combinaciones  posibles de las entradas. Lo resuelvo con un for anidado dentro de otro for.
Para finalizar uso el testbench para simular y te muestro el resultado.

https://www.youtube.com/watch?v=3Zq5L2I9Q1Y

## Codificador prioridad de 4 vías

En este video realizo la descripción VHDL de un codificador de prioridad de 4 vías con señal de grupo. Explico las características de la  sentencia when-else que uso.

https://www.youtube.com/watch?v=aZ3jZNI52N0

En este video te explico un banco de pruebas (testbench) para un  codificador de prioridad de 4 entradas a 2 salidas codificadas y señal  de grupo. Uso el ModelSim de Intel-Altera, versión 10.5b. Uso un ciclo  “for-loop” y dentro de éste la sentencia “if” con las opciones “elsif” y “else”. Compilo y para finalizar uso el testbench para simular y te  muestro el resultado.

https://www.youtube.com/watch?v=dGqn_GS6rgg

## BCD binario a Aiken

En este video te describo un conversor de código BCD binario natural a código BCD Aiken, usando operaciones aritméticas que no están  permitidas para el tipo de datos *std_logic* y *std_logic_vector*, motivo por el cual tengo que usar el *package numeric_std* del IEEE. Este *package* incluye nuevos tipos de datos, entre ellos *unsigned*. Haciendo conversión de datos soluciono el problema. Primero cometo  adrede un error para que veas cómo te avisa el compilador que no puede  hacer operaciones aritméticas con el tipo de datos *std_logic_vector*. Una vez corregido, lo vuelvo a compilar y finalmente simulo para  comprobar el correcto comportamiento. También te muestro dónde se  encuentran los package en la instalación de Altera, en particular los  dos que hemos usado:

std_logic_1164  y   numeric_std

Los abro para mostrarte parte del contenido, por ejemplo los tipos de datos que usamos en esta descripción.

https://www.youtube.com/watch?v=iJbdA18rglk

En este video te explico cómo usar una tabla (un arreglo) para verificar si las salidas son las esperadas. Uso for…loop y el atributo ‘range.  Uso el atributo ‘image. Incluyo el package numeric_std para poder usar  las funciones: to_unsigned y to_integer.

https://www.youtube.com/watch?v=VV4L38-6bQ4

## Comparador genérico

En este video te muestro la descripción de un comparador genérico de números enteros de N bits. En la entidad uso *generic* para darle un valor por omisión a la cantidad N de bits. Incluyo el *package numeric_std* porque necesito usar datos de tipo *signed* para realizar las comparaciones. Para finalizar realizo la simulación.

https://www.youtube.com/watch?v=6YfPZKvKlaE

En este video te muestro un testbench para el comparador genérico de  números enteros de N bits. Uso tablas para generar los estímulos de las  entradas y también tablas (type … array) para generar las salidas  esperadas, de manera que con un simple for…loop verifico los 10 casos  que elegí como para cubrir todas las posibilidades. Uso los atributos  ‘range e ‘image. Incluyo el package numeric_std para poder usar la  función: to_integer.

https://www.youtube.com/watch?v=JNdnBBfbHsE

## Conversor genérico código Gray a Binario

Descripción VHDL de un conversor genérico de código Gray a binario natural de N bits. Uso *generic.* Uso la operación lógica xor entre vectores. Te muestro interesantes  operaciones entre subíndices, que permiten resolver problemas en forma  eficiente y compacta. Cometo adrede un error para destacar que las  señales de salida no se pueden “leer” con esta norma. Compilo, veo cómo  el *software* te informa de este error, lo corrijo, vuelvo a compilar y simulo.

https://www.youtube.com/watch?v=mvz8jaOafWw

En este video te explico el testbench para el conversor genérico, de N  bits, de código Gray  a código binario natural. Uso tablas para generar  el estímulo de entrada (type … array). Con un simple for…loop verifico  los 16 casos que elegí como para cubrir todas las posibilidades. Uso los atributos ‘range e ‘image. Incluyo el package numeric_std para poder  usar las función: to_integer.

https://www.youtube.com/watch?v=QibvBFWMqK8

## Multiplexor genérico

Descripción VHDL de un multiplexor genérico con entrada de habilitación activa en alto. Uso el *package numeric_std* para cambiar el tipo de datos de *std_logic_vector* a enteros (*unsigned, to_integer*). Uso *Generic* y constante de tipo *positive* (> 0). Luego de compilarlo sin errores, simulo el comportamiento.

https://www.youtube.com/watch?v=DtakxchcRAM

## Sumador binario genérico

Descripción y simulación de un sumador binario genérico de magnitudes de N bits. Uso el *package* *numeric_std* para cambiar el tipo de datos a *unsigned* para así de poder realizar la suma. Recuerdo que no existe el *casting* de un *std_logic* a *unsigned*, hay que transformarlo en un *std_logic_vector* de un solo elemento. Cambio el largo de un vector concatenándole un ‘0’ adelante.

https://www.youtube.com/watch?v=f0KHRFsTppM

En este video te muestro un testbench para el sumador genérico de  magnitudes de N bits. Uso tablas para generar los estímulos de entrada  (type … array) y también los valores esperados de la suma y del acarreo  de salida. Con un simple for…loop verifico los 11 casos que elegí en las tablas. Uso los atributos ‘range e ‘image. Incluyo el package  numeric_std para poder usar la función: to_integer.

https://www.youtube.com/watch?v=4Gds_AaxYGY

## Multiplicador de enteros

Descripción VHDL de un multiplicador genérico de números enteros de N bits. Uso el *package numeric_std* para poder realizar la operación multiplicación usando un multiplicador embebido del cual dispone la FPGA Cyclone II. Realizo un cambio de tipo de datos para poder realizar la multiplicación. Uso datos tipo *signed* ya que los datos del enunciado son números enteros. Muestro en el *RTL Viewer* cómo la operación multiplicación se la representa a través de un  multiplicador embebido. Finalmente vemos en la simulación el correcto  funcionamiento.

https://www.youtube.com/watch?v=vXmvVDMj7rI

En este video te explico el testbench para probar el multiplicador  genérico de números enteros de N bits. Muestro cómo el ModelSim modela  la alta impedancia.

https://www.youtube.com/watch?v=OpWwhFyZY0o

## Sumador-Restador

Descripción VHDL de un sumador-restador genérico de números enteros de N bits. Uso el *package numeric_std* porque voy a usar operaciones matemáticas, uso datos tipos *signed*, definidos en ese *package*. Para que sea genérico defino en *generic* la constante N que representa la cantidad de bits de los operandos. Uso operaciones lógicas y analizo la precedencia de operandos y la  necesidad de usar paréntesis. Genero el indicador de desborde (*overflow*). Te muestro el circuito esquemático generado por la herramienta *Netlist Viewer*, opción *RTL Viewer*. Finalmente muestro la simulación.

https://www.youtube.com/watch?v=JV4O69iFZNI

En este video te muestro un testbench para un sumador/restador de  números enteros. Pruebo con números enteros de 4 bits, eligiendo  distintas sumas y restas con números con igual o distintos signos de  manera de cubrir todos los casos posibles. Analizo el indicador (*flag*) de desborde (*overflow*).  

https://www.youtube.com/watch?v=pX7X7Tt9hsQ

## Conversor binario a Gray con ROM

Descripción VHDL de una memoria ROM genérica usada para convertir de código binario natural de 4 bits a código Gray. Incluyo el *package numeric_std* para usar datos *unsigned* y la función *to_integer* para el *casting*. Defino un nuevo tipo de datos con *type* y arreglos con *array*. Escribo una tabla con el código Gray que será el contenido de la memoria ROM. Analizo el *hardware* sintetizado con la herramienta *Technology Map Viewer* del Quartus II. Y finalmente realizo la simulación para comprobar el correcto funcionamiento.

https://www.youtube.com/watch?v=ufagWGD9Wy8

En este video te muestro un testbench para probar una memoria Rom usada  como conversor de código binario natural de 4 bits a código Gray.  inyecto direcciones y verifico que el contenido de la ROM sea el  esperado, para el caso en que la ROM esté habilitada. Pruebo que la  salida de datos se encuentre en alta impedancia cuando no está  habilitada.
Para finalizar uso el testbench para simular y te muestro el resultado.

https://www.youtube.com/watch?v=By6X4QjoSik

## Decodificador genérico

Descripción VHDL de un decodificador genérico de N bits, con habilitación activa en alto y salida activa en alto. Uso de proceso explícito:  process. Uso del package numeric_std, para usar tipo de datos unsigned.  Uso de la función to_integer para poder usar los std_logic_vector como  subíndices. Uso de de generic.

https://www.youtube.com/watch?v=P8EfRfPFkP0

En este video te muestro el testbench de un multiplexor genérico, de N  canales, con entrada de habilitación. El testbench se realiza para un  caso en particular. Uso “others” para dar el valor inicial a las señales del testbench. Sentencia for…loop. Uso generic map dado que la  descripción era genérica. Uso port map. Uso el package numeric_std que  necesita la función to_unsigned.

https://www.youtube.com/watch?v=iWEEqdE2lek

En este video te muestro la descripción de un testbench para un  decodificador genérico de N bits con entrada de habilitación. Uso dos  simples for…loop, uno para el decodificador habilitado y otro para  cuando está inhabilitado, verificando así todos los casos posibles. En  el assert uso la expresión: “2**i” o sea, 2 elevado al índice del for,  para generar las salidas esperadas. Uso el atributo ‘image. Incluyo el  package numeric_std para poder usar las funciones: to_integer,  to_unsigned.

https://www.youtube.com/watch?v=4B9F0dc94N4

## Árbol de paridad genérico

Descripción VHDL de un árbol de paridad genérico, de N bits. Defino un proceso explícito, *process* y una variable. Uso una sentencia secuencial *for…loop*. Comento la diferencia entre señales y variables y entre procesos implícitos y explícitos. Uso una etiqueta, *label*. Te muestro el *RTL Viewer* y el resultado de la simulación.

https://www.youtube.com/watch?v=UjywM3PFjIs

En este video te muestro el testbench para un árbol genérico de paridad  par e impar. Lo resuelvo mediante un for…loop. Con el índice del for  genero los estímulos para la entrada y uso tablas (array) para generar  los resultados esperados. Uso el package numeric_std para la funciones  to_integer, to_unsigned y unsigned. Uso los atributos ‘range e ‘image.  
Para finalizar uso el testbench para simular y te muestro el resultado.  

https://www.youtube.com/watch?v=iVHZ4zucrnI

# Arquitectura algorítmica

## NOR genérica

Descripción VHDL, usando **arquitectura algorítmica** de una compuerta NOR genérica, de N bits. este tipo de arquitectura por ser secuencial ncesita del uso de procesos explícitos, *process.* El proceso contiene solamente sentencias secuenciales y procesos  implícitos de asignación simple. En este ejemplo uso las sentencias *for…loop* e *if*. Defino una variable auxiliar. Muestro el *RTL Viewer* y el *Technology Map Viewer*, generados. Simulo para comprobar el correcto funcionamiento. Como introducción sintetizo lo visto hasta el momento: **arquitecturas por comportamiento** y los diferentes estilos.

https://www.youtube.com/watch?v=qBRS11dh2o0

En este video te muestro el testbench para una compuerta NOR genérica.  Lo resuelvo mediante un for…loop para todos los casos excepto uno. Con  el índice del for genero los estímulos para la entrada. Uso el package  numeric_std para la función to_integer, y unsigned. Uso el atributo  ‘image.  
Para finalizar uso el testbench para simular y te muestro el resultado.

https://www.youtube.com/watch?v=9qxchm-y4iQ

## NAND genérica

https://www.youtube.com/watch?v=oYbK_Gjp6aI

En este video te muestro el testbench para una compuerta NAND genérica.  Lo resuelvo mediante un for…loop para todos los casos excepto uno. Con  el índice del for genero los estímulos para la entrada. Uso el package  numeric_std para la función to_integer, y unsigned. Uso el atributo  ‘image.  Para finalizar uso el testbench para simular y te muestro el  resultado.

https://www.youtube.com/watch?v=biB3MyJeH6o

## Descripción estructural de un circuito

En este video vemos la descripción VHDL de un circuito usando  arquitectura estructural. Instancio componentes. Genero una library y un package propios. Informo al Quartus que voy a usar mi library y mi  package y las descripciones de los componentes. Vemos los circuitos  sintetizados por RTL Viewer y Technology Map Viewer, comparándolos con  el circuito y con la tabla de verdad y ecuaciones del circuito.

https://www.youtube.com/watch?v=RJwa__v48n8

En este video te muestro un testbench para el circuito definido en forma estructural. Uso tablas para generar los estímulos de las entradas  (type … array). Uso dos subíndices para acceder a un dato de la tabla y a un determinado bit del dato. Con un simple for…loop verifico los 16  casos. Uso los atributos ‘range e ‘image. Incluyo el package numeric_std para poder usar la función: to_integer.

https://www.youtube.com/watch?v=JjbSmiT4E6A

## Descripción de un circuito que maneja hardware

Descripción de un circuito para usar en la plaqueta DE1 de Altera. Se  trata de manejar el display de 7 segmentos de 4 dígitos de la plaqueta.  Al circuito entran dos señales BCD de 4 bits y una señal de modo. La  salida son los 4 dígitos de un display de 7 segmentos, en los que se  exhiben los datos de entrada, el mayor de ellos y el resultado de la  suma. Y un indicador (un LED) de si la suma está entre 10 y 15 (no es  BCD). Muestro el RTL Viewer.

https://www.youtube.com/watch?v=Y_QyV4EaJno

En este video te muestro el testbench para  un display de  4 dígitos de  7 segmentos.  
Para finalizar uso el testbench para simular y te muestro el resultado.  

https://www.youtube.com/watch?v=3jSvdBdlBbI

## Hardware sintetizado y efectos de eliminación de una señal de la descripción

En este video analizo el RTL y el Technology Map Viewers comparándolos  con la descripción VHDL y explicando que son los LE (Logic Element) y la LUT ( look-up-table) y cómo verlos en el Technology Map. Modifico la  descripción eliminando una señal y muestro los efectos sobre el hardware sintetizado y los tiempos de propagación de las señales. Muestro las  etapas del diseño CAD.  Muestro como se asignan las patas. Explico la  diferencia entre programar y configurar. Muestro cómo se usa el  programador del Quartus II, para configurar la FPGA. Archivo de  extensión SOF para bajar a la SRAM del Cyclone II.

https://www.youtube.com/watch?v=_nz_TNJBOGM

