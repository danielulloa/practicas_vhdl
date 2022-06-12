# Controlador de memoria
Implemente en VHDL una máquina de estados finitos (FSM) que controle un bloque de memoria. La FSM recibe dos entradas, ready que indica cuando la memoria está preparada, READ/~WRITE (r_w) que indica si se desea realizar una lectura o escritura y una señal de reset. La FSM genera dos variables, ce y we que se aplican al 'output enable' y al 'write enable' del bloque de memoria. El diagrama de transición de estados es el siguiente:
![diagrama](./estados_4.png)
