gamejam-ua
==========

Proyecto dedicado a la consecución de la primera GameJam en la UA que se celebra del 2 al 4 de Noviembre. En este README vendrá todas las reglas a seguir, estándar de código, estructuras de directorios, flujo a seguir, etc.

# Código #

Estructura de directorios
---------

La estructura de directorios es sencilla, pero paso a explicar cada directorio por separado.

`/`: este directorio contendrá el punto de entrada de la aplicación. **main.lua** es el fichero principal, y deberá contener las llamadas a los distintos `View` de los que constará el juego.

`/module`: los módules de los que se componga el juego deberán estar separados en módulos, el cual cada uno deberá contener el fichero de inicio **init.lua** que a su vez deberá definir unicamente el `View` correspondiente. El resto del código se deberá agrupar por elementos comunes en ficheros comunes y ser incluidos desde el **init.lua**.
El resto de directorios deberá quedar como el siguiente ejemplo:

    /
		module/
			assets/
				graphics/
					tilesets/
					sprites/
					ui/
				music/
				sounds/
				fonts/
					ttf/
					custom/
				maps/
					map1/
					map2/
				shaders/
			init.lua
			entities.lua
			ui.lua
			README
		README
		LICENSE
		main.lua

El módulo podrá contener adicionalmente un fichero README para explicar las funcionalidades que realiza.

Paso a explicar el contenido del directorio `assets`:

`graphics`: aquí irán los gráficos propiamente del juego, organizados por subcarpetas que se autoexplican a sí mismas. Procurar dejar cada cosa en su sitio. Si no existieran gráficos de determinado tipo en un módulo, simplemente no hacer la carpeta.

`music`: aquí irá la **música del juego**, melodías completas que no se consideren efectos de sonido.

`sounds`: aquí irán todos los efectos de sonido, golpes, clicks, etc. Tanto la música como los efectos de sonido deberán usar el formato **WAV**

`fonts`: aquí irán las fuentes. En `ttf` irán aquellas fuentes en formato TrueType. En `custom` aquellas fuentes custom compuestas de distintos mapas de bits.

`maps`: aquí irán los mapas del juego, separados por carpetas para su correcta organización. Dentro de cada carpeta deberá haber un fichero `tmx` de Tiled y su correspondiente `lua`, ambos con el mismo nombre de la carpeta.

`shaders`: aquí habrá aquellos shaders para efectos de píxeles que use el modulo en concreto. Todos con la extensión `glsl`. Recordar que LÖVE sólo acepta **GLSL 1.2**

