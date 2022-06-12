# GHDL

Es un simulador open-source para VHDL que además permite analizar la sintaxis y graficar los estímulos de un testbench. GHDL soporta las versiones de 1987, 1993 y 2002 del estandar IEEE 1076. GHDL es multiplataforma.

## Instalación

Para facilitar la instalación de GHDL en Windows 10 primero necesitamos Powershell 6 o superior, por defecto la versión instalada es la 5.1. Abrir Powershell e instalar la versión más actual con el siguiente comando:

```powershell
winget install --id Microsoft.Powershell --source winget
```

*En caso de no poder instalar Powershell seguir el instructivo oficial en* https://docs.microsoft.com/en-us/powershell/

Cerrar la ventana actual de Powershell y ejecutar la última versión. El próximo paso es instalar un gestor de paquetes llamado scoop:

```powershell
iwr -useb get.scoop.sh | iex
```

Una vez finalizada la instalación agregar el bucket que contiene GHDL y el visualizador de estímulos GTKWave:

```
scoop bucket add vhdl 'https://github.com/danielulloa/scoop-vhdl.git'
```

Para instalar GHDL y GTKWave

```
scoop install ghdl gtkwave
```

## Post-Instalación

Verificar la instalación ejecutando el siguiente comando que muestra la versión de GHDL:

```
ghdl --version
```

el resultado de este comando debe ser el siguiente:

```
GHDL 0.37 (v0.37) [Dunoon edition]
 Compiled with GNAT Version: 9.1.0
 mcode code generator
Written by Tristan Gingold.

Copyright (C) 2003 - 2020 Tristan Gingold.
GHDL is free software, covered by the GNU General Public License.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```



## Uso

<u>Analizar archivos:</u>

```
ghdl -a archivo.vhdl
ghdl -a archivo_tb.vhdl
```

*En caso de que existan errores de sintaxis serán indicados en la terminal, caso contrario no se indica nada*

<u>Ejecutar:</u>

```
ghdl -e archivo_tb
```

<u>Simular:</u>

```
ghdl -r archivo_tb --vcd=out.vcd
```

Si se incluyeron sentencias report en el testbench en la terminal se imprime el mismo mensaje. Por ejemplo:

```
CompNORn_tb.vhdl:25:8:@0ms:(report note): Verificando la compuerta NOR de 4 entradas
CompNORn_tb.vhdl:42:8:@16ns:(report note): Verificación exitosa!
```

<u>Visualizar:</u>

```
gtkwave out.vcd
```

![image-20220301220339827](images/image-20220301220339827.png)

## Editores de texto recomendados

Se puede usar el Bloc de Notas, o cualquier editor de texto, por ejemplo Notepad++.

```
scoop bucket add extras
scoop install notepadplusplus
```

Visual Studio Code también puede ser útil pero hace un uso intensivo de recursos, para este caso se recomienda más de 4GB de memoria RAM.

Se recomienda el uso de VI, en particular neovim, por permitir al usuario realizar configuraciones avanzadas con solo editar un archivo de texto plano. La curva de aprendizaje puede resultar compleja, pero con la práctica se puede escribir mucho más rápido que con un editor de texto visual. https://vim-adventures.com/ es un juego con el cual se puede aprender vim.

```
scoop install neovim
```

El uso de extensiones hace que neovim se convierta en un poderoso entorno de desarrollo, algunas que pueden resultar sumamente útiles son coc, syntastic, airline, nerdtree y el gestor para su instalación vim-plug.

![image-20220301235907725](images/image-20220301235907725.png)

## Automatización

Se pueden escribir makefiles para automatizar el proceso de simulación y tambien generarlos con ghdl

```
ghdl --gen-makefile deco3a8_tb
```

En el caso de querer escribir el makefile se presenta el siguiente ejemplo:

```
all:
	ghdl -a deco3a8.vhdl
	ghdl -e deco3a8
	ghdl -a deco3a8_tb.vhdl
	ghdl -e deco3a8_tb
.PHONY: clean
clean:
	cmd \/C del *.cf

.PHONY: simulate
simulate:
	ghdl -r deco3a8_tb --stop-time=100ns --vcd=deco3a8.vcd

.PHONY: show
show:
	gtkwave deco3a8.vcd
```
