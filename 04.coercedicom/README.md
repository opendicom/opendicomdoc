# coercedicom

Verifica y normaliza los objetos DICOM creados por las modalidades antes de ingresarlos en forma defitiva al PACS.

Recibe los objetos desde un directorio spool, les hace pasar por un pipeline de verificación y modificación y, en caso de preprocesamiento éxitoso, crea el objeto preprocesado dentro de una carpeta spool para su envio por lotes a un pacs.

El pipeline de procesamiento de los objetos dicom recibidos está materializado por una estructura de directorios, dentro de la cual los objetos están desplazados a medida que avanza su procesamiento.

El directorio raíz de esta estructura tiene por nombre el aet usado para este canal. Es posible crear más de un canal de recepción, cada uno con su propio directorio raíz. 

Es recomendable ubicar este directorio raíz dentro de un volumen de acceso rápido en lectura y escritura. Clasificados del mejor al mínimo listamos: ssd, raid5, NAS conectado con enlace 1000baseT.

Este directorio contiene 7 subdirectorios:

- CLASSIFIED
- MISMATCH_SOURCE
- MISMATCH_CDAWL
- MISMATCH_PACS
- ORIGINALS
- FAILURE
- SUCCESS


Funcionalidades:

- agrupar objetos y mandarlos más allá de una red local insegura a un servidor remoto.
- comprimir las imágenes en jpeg 2000 sin pérdida antes de atravesar un enlace con ancho de banda limitado
- verificar previo al envio la identificación correcta (o compatible) del paciente con los objetos ya presentes en el pacs de destino
- uniformizar los nombres de instituciones
- ...

