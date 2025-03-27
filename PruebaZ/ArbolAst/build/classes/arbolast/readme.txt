PARA COMPILAR Y EJECUTAR SIGA LOS SIGUIENTES PASOS (EN NETBEANS):

1. Debe agregar el JAR de java-cup-11b.jar: click derecho Libraries -> Add JAR/Folder

2. Ubicarse en la carpeta del proyecto:

cd <ruta>/astejemplo/src/astejemplo/

3. Ejecutar los siguientes comandos:

jflex lexico.jflex
cup -parser AnalisisSintactico -symbols Simbolo sintactico.cup


