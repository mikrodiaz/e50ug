# MK-E50UG
Imagenes de Docker para MikroTik E50UG

Tienes el nuevo hEX refresh E50UG y no conseguiste correr PIHOLE o ADGUARD en este equipo, aqui esta la sulución.

Ya pase por eso y luego de una investigación el equipo es ARM pero tiene un procesador que solo es compatible con imagenes para AMR32v5, cosa que ya no desarrolan, pero existen imagenes bases para esa arquitectura y versión especfica y lo mismo pasa con el binario de Adguard, en mi caso me gusta mucho Adguard/home para el hogar y trabajo lo que hice fue construir una imagen de Docker que si fuera compatible con mi equipo como ya sabemos el nueno hEX refresh E50UG.

Imagen subida por mi a DOCKERHUB: https://hub.docker.com/r/adiaz876/adguard

Remote Image: adiaz876/adguard:e50ug

Use una memoria USB adicional para instalar ya que el equipo cuenta con muy poca memoria para la instalación.

![image](https://github.com/user-attachments/assets/d2047530-0c4b-4f0e-bee5-248a2b6e3347)
