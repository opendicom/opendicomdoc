# storedicom

Permite la normalización de los objetos DICOM antes que entren en el repositorio definitivo, o sea el PACs.

Verifica y Modifica los objetos DICOM creados por las modalidades antes de ingresarlos en forma defitiva al PACS.

Recibe los objetos por servicio STORE SCP como si fuese un PACS, les hace pasar por un pipeline de verificación y modificación y finalmente intenta enviarlos al PACS como cliente STORE DICOMweb.

La aplicación se coloca dentro de la red imagenológica y se configura como SCP (aet, ip, puerto) de destino de las operaciones DICOM STORE SCU realizadas por las modalidades de adquisición de imágenes médicas (CR, DX, CT, MR, etc). Usamos el STORE SCP de la caja de herramientas de código libre dcmtk, muy confiable y universal.

El pipeline de procesamiento de los objetos dicom recibidos está materializado por una estructura de directorios, dentro de la cual los objetos están desplazados a medida que avanza su procesamiento.

El directorio raíz de esta estructura tiene por nombre el aet usado por dcmtk para este canal. Es posible crear más de un canal de recepción, cada uno con su propio directorio raíz. Es recomendable ubicar este directorio raíz dentro de un volumen de acceso rápido en lectura y escritura. Clasificados del mejor al mínimo listamos: ssd, raid5, NAS conectado con enlace 1000baseT.

Este directorio contiene 7 subdirectorios:

- ARRIVED
- CLASSIFIED
- COERCED
- DISCARDED
- ORIGINALS
- REJECTED
- STORED

## ARRIVED


