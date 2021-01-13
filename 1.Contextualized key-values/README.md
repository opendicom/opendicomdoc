# contextualized key-values representation of dicom objects (experimental)

La lectura de dicom binario es complicada. Dicom json es dificil de editar. Dicom native xml es pesado y requiere muchos recursos para su lectura y edición. Además dicom xml y dicom json fueron creados por separado y requieren traducción para pasr de uno a otro.

Por otro lado, recientemente con la aparición de XPath 3.1 y de JSON schema, existe un puente entre xml y json que permite pasar del uno al otro por transformaciones biunívocas, sin traducción. Es la ocasión de diseñar una nueva representación de los objetos dicom que esté optimizada para :
- la edición
- el almacenamiento en bases de datos.

La definición de esta representación se encuentra en __[github](https://github.com/jacquesfauquex/DICOM_contextualizedKey-values)__

Esta representación será pieza central de pipedicom (ver abajo).

