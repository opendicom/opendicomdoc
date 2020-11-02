# storedicom deploy

## ubicación del directorio spool

storedicom usa un directorio y subdirectorios para conservar los resultados de las varias etapas del procesamiento de los objetos dicom recibidos. En instalaciones de mucho tráfico, es aconsejable ubicar este directorio en un partición distinta del sistema operativo sobre un almacenamiento de tipo ssd dentro del servidor, pues rápido y siempre accesible. Nuestra ubicación preferida es un volumen llamado IN:

/Volumes/IN/aetDeRecepción/

## ubicación del directorio de aplicación

La aplicación storedicom usa varios ejecutables, archivos de configuración y script de inicio recurrente. Elegimos para las próximas versiones /Users/Shared/storedicom para agrupar todos estos archivos. (en la vieja versión actual, el directorio se llama storescp).

Contiene:

- storescp (ejecutable abierto permanentemente para recibir los nuevos objetos DICOM. Este ejecutable es usado tal como viene en la caja de herramientas dcmtk.)
- 
