# PCS

Por defecto instalamos toda la solución en una sola máquina con sistema operativo MacOS dedicada que llamamos PCS (Picture Communication System). Podemos agregarle funcionalidad de PACS cuando le agregamos a esta máquina un NAS seguro para almacenamiento duradero.

El hardware por defecto es la mac mini, con un SSD 120GB y un HD 1TB con instalación muy específica. A los modelos que vienen con un solo SSD se debe conectar un HD externo.

## Sistema operativo

macos 10.15 Catalina, exclusivamente 64 bit, con partición de restauración en cada disco.


## Sistema de archivos

APFS con distincción mayúscula/minúscula. Este sistema diferencia 3 tipos de contenedores:
- los dispositivos físicos (SSD, HD, memoria USB, etc)
- las particiones de tamaño fijo
- los volumenes de tamaño dinámico que comparten el espacio de una partición 

Instalamos dos equipos de almacenamiento para minimizar los tiempos de recuperación en caso de falla de dispositivo físico de almacenamineto. Si falla el SSD, la máquina puede inmediatamente bootear desde el HD (que contiene una copia del sistema operativo).
Si falla el HD el sistema puede seguir recibiendo datos mientras se configura una nueva unidad HD con respaldos. Para lograr eso reservamos una partición de 80GB para sistema y otra de 40GB para datos entrantes en ambos dispositivos físicos.

En caso de falla de SSD, para perder lo menos posible de lo más reciente, creamos una partición TM (Time Machine), de tamaño fijo equivalente al doble de SSD + IN.

El resto del HD es una gran partición subdividida en volumenes compartiendo un mismo espacio físico que simplifiquen la administración de la solución. Se tratan de los volúmenes siguientes:

- LOG : los archivos de log de todos los servicios
- TMP : los archivos temporales de todos los servicios
- DICOM : los archivos del PACS clasificados por carpetas año, mes, día, hora, estudio, serie
- GITHUB : el código de los servicios actualizados por github
- DOCKER : los paquetes docker de servicios dockerizados

[diskutilList.txt](Ver el listado completo de las particiones)



