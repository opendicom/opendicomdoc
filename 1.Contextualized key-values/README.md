# contextualized key-values representation of dicom objects (experimental)

Tres representaciones de los objetos DICOM están definidas en el estándar: binaria, json y native xml. Fueron diseñadas para que sean posibles la traducción de cualquiera de ella en cualquier otra representación. Es decir que las dos nuevas copian la syntaxis de la representación binaria original. Vale observar además que Dicom xml y dicom json fueron creados por separado y requieren traducción estructurales significativas para pasar de la una a la otra.


## Desafío implicito al modelo de datos

La metadata DICOM no es una lista plana de atributos. Permite profundidad gracias a un tipo de atributos llamada secuencia. El contenido de dichos atributos está constituido de items, cada uno de ellos siendo una lista de attributos. Las listas de cada item dentro de una secuencia no son necesariamente compuestas de los mismos atributos. Cada item puede contener dentro de su lista uno o más atributos de tipo secuencia.
Es decir que la estructura objectiva de la metadata (independientemnte de su modo de representación) es compleja en sí.

## Evaluación crítica

- La lectura de DICOM binario es complicada (litte/big endian, gran variedad de tipos de datos, largo de los valores un/definido, secuencias e items, aplicación de charsets multiples para nombres de personas, aplicación de los charsets limitada a las fronteras de un item, etc). 
- Dicom json es dificil de editar en razón de la estructura profunda (y eventualmente recursiva) de los atributos secuencia y la inexistencia de herramienta de tipo XPath para json. 
- Dicom native xml es muy verboso y requiere muchos recursos para su lectura y edición (construcciónd el árbol DOM correspondiente). 


## una representación mejor?

La complejidad a la cual se enfrenta cadarepresentación es la profundidad posible gracias a las secuencias de items. 





Por otro lado, recientemente con la aparición de XPath 3.1 y de JSON schema, existe un puente entre xml y json que permite pasar del uno al otro por transformaciones biunívocas, sin traducción. Es la ocasión de diseñar una nueva representación de los objetos dicom que esté optimizada para :
- la edición
- el almacenamiento en bases de datos.

La definición de esta representación se encuentra en __[github](https://github.com/jacquesfauquex/DICOM_contextualizedKey-values)__

Esta representación será pieza central de pipedicom (ver abajo).

