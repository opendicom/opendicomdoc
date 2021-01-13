# storedicom deploy

## Ubicación del directorio spool

storedicom usa un directorio y subdirectorios para conservar los resultados de las varias etapas del procesamiento de los objetos dicom recibidos. En instalaciones de mucho tráfico, es aconsejable ubicar este directorio en un partición distinta del sistema operativo sobre un almacenamiento de tipo ssd dentro del servidor, pues rápido y siempre accesible. Nuestra ubicación preferida es un volumen llamado IN:

/Volumes/IN/aetDeRecepción/

## Ubicación del directorio de aplicación

La aplicación storedicom usa varios ejecutables, archivos de configuración y script de inicio recurrente. Elegimos para las próximas versiones /Users/Shared/storedicom para agrupar todos estos archivos. (en la vieja versión actual, el directorio se llama storescp).

Contiene:

Lo especifico a storescp

- storescp (ejecutable abierto permanentemente para recibir los nuevos objetos DICOM. Este ejecutable es usado tal como viene en la caja de herramientas dcmtk)
- dicom.dic (complemento necesario de storescp que contiene el diccionario de atributos DICOM)
- classifier.sh (script ejecutado al finalizar la recepción por dcmtk para clasificar los estudios recibidos dentro de la subcarpeta CLASSIFIED)
- LaunchDaemons/org.dcmtk.storescp.custodian.aetscp.104.plist (el nombre es específico para cada instalación. Luego de la parte común org.dcmtk.storescp se agregan el custodian, el aet y el puerto de recepción y finalmente la extensión .plist. Este archivo lista los parámetros invocados cada vez que se inicia storescp )
- org.dcmtk.storescp.custodian.aetscp.log (llamado acorde al nombre del aet de recepción. Contiene el log de dcmtk storescp. es un alias al archivo verdadero a crear en /Volumes/LOG/org.dcmtk.storescp.custodian.aetscp.log )

Lo especifico a storedicom

- storedicom/ (carpeta de la aplicación)
- storedicom/build/Developmenmt/storedicom (binario de la aplicación)
- com.opendicom.custodian.aetscp.plist (permite seleccionar el custodian en función de los aet y/o ip de las modalidades dicom que mandan objetos dicom.
- LaunchDaemons/com.opendicom.storedicom.custodian.aetscp.plist ( Este archivo lista los parámetros invocados cada vez que se inicia storedicom )
- com.opendicom.storedicom.custodian.aetscp.log ( Es un alias al archivo verdadero a crear en /Volumes/LOG/com.opendicom.storedicom.custodian.aetscp.log )

Utilitarios para la limpieza del directorio spool

- clean_stowed.sh

## Instalación

El proyecto github contiene toda la estructura y configuración de todas las instalaciones. Se especializa la instalación con las configuraciones de sistema launchctl para las cuales se selecciona el archivo correspondiente a la instalación.

Le falta los symlinks a archivos de log, que hay que crear antes.

Falta también crear la estructura de subdirectorios del (de los) directorio(s) spool

## Detalles

Los anexos a este README detallan el contenido de algunos de los elementos de la instalación
