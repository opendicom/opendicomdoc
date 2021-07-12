# contextualized key-values representation of dicom objects (experimental)

Tres representaciones de los objetos DICOM están definidas en el estándar: binaria, json y xml native. Fueron diseñadas para que sea posible la traducción de cualquiera de ella en cualquiera otra. Es decir que las dos nuevas (json y xml) copian parte de la syntaxis de la representación binaria original. Vale observar además que DICOM xml y DICOM json fueron creadas por separado y requieren traducción estructurales significativas para pasar de la una a la otra.


## Evaluación crítica de estas representaciones

- La lectura de DICOM binario es complicada (litte/big endian, gran variedad de tipos de datos, largo de los valores un/definido, secuencias e items, aplicación de charsets multiples para nombres de personas, aplicación de los charsets limitada a las fronteras de un item, etc). 
- Dicom json es dificil de editar en razón de la estructura profunda (y eventualmente recursiva) de los atributos secuencia y la inexistencia de herramienta de tipo XPath para json. 
- Dicom native xml es muy verboso y requiere muchos recursos para su lectura y edición (construcciónd el árbol DOM correspondiente). 


## Desafío implicito al modelo de datos

La metadata DICOM no es una lista plana de atributos. Permite profundidad gracias a un tipo de atributos llamada secuencia. El contenido de dichos atributos está constituido de items, cada uno de ellos siendo una lista de attributos. Las listas de cada item dentro de una secuencia no son necesariamente compuestas de los mismos atributos. Cada item puede contener dentro de su lista uno o más atributos de tipo secuencia.
Es decir que la estructura objectiva de la metadata (independientemnte de su modo de representación) es compleja en sí.


## map: una representación mejor para DICOM?

Mejor en este contexto significa más sencillo de escribir, leer y modificar. Dentro de la categoria de modelos de metadatos indexados, más sencillo que JSON, solo queda "map". O sea, la correspondencia key-value dentro de una lista sin profundidad. Tal modelo está incorporado en la mayoría de los lenguajes de programación modernos, que incluyen funciones de creación, introspección y modificación.

La dificuldad de uso de este modelo de datos para DICOM es la profundidad de los objetos de información. Se supera con reemplazar la key de un atributo por una key compuesta de todos los niveles de profundidad precisando el contexto además del significado del atributo. Para decirlo con una analogía referenciandose al ecosystema xml, se trata de reemplazar el nombre del elemento por el XPath que apunta al elemento.

Esta idea es al origen del desarrollo de DCKV (DICOM Contextualized Key Values).

Ejemplo de key en DCKV:

```"00000001_00081032.00000001_00080104-1100LO": [ "UPPER GI SERIES (STOMACH)" ]```

Usamos la notación JSON pero el modelado es independiente de JSON.

Parte key: 00000001_00081032.00000001_00080104-1100LO
Parte values (en este caso un solo valor): UPPER GI SERIES (STOMACH) 

Para la explicación del key definimos dos categorias de atributos DICOM en función del tipo de datos:
- atributoVertical (caracterizando exclusivamente los atributos de tipo secuencia)
- atributoHorizontal (incluyendo todos los otros tipos de atributos)


substrings de key: 

- ```nroItem_atributoVertical.``` 
se repite para cada nivel del contexto

- esta finalizado con la ocurrencia de  
```nroItem_etiquetaDeAttributoDICOM-```
 (un guión al final en lugar del punto) 
 
- se agrega la sigla oficial DICOM del tipo de dato del atributo (en este caso "LO", LOng string), eventualmente presentado de una información sobre el charest usado en el valor. "1100" corresponde a latin1. 

El string del ejemplo puede ser usado como key json. Cuando json está transformado en map, por ejemplo en un script javascript, cualquier valor de la lista puede referenciarse con la syntaxis 
```lista[key][índice del valor]```

No se requiere ningún DOM para buscar un elemento de la metadata.


## Principales propiedades relativas al diseño de la key en DCKV

- la clasificación alfabética deja los atributos exactmente en el mismo orden que un original binario.
- la syntaxis es URL-safe
- el atributo está autodefinido (no necesita información colateral por ejemplo relativa al charset usado)
- usa el padrón de diseño ```{map[array]}```


## ```{map[array]}```

```{map[array]}``` de DCKV se escribe naturalmente en JSON como
```
{
  "key" :[
     "value"
  ]
}
```

Pero además, con la aparición de XPath 3.1 y de JSON schema, existe un puente genérico entre json y xml que permite pasar del uno al otro por transformaciones biunívocas, sin traducción. map y array son parte de este puente genérico, lo que significa que si traducimos DICOM binario a DCKV escrito en json, podemos aplicar una función XPath básica estándar para tenerlo disponible en xml también.


## Conclusión

DCKV es una mejor representación porque simplifica el acceso y edicón granular a la metadata :
- gracias a estructuras de lenguajes de programación map y array 
- sin necesidad de construir previamente un DOM (como es el caso en la representación XML nativa.

Se escribe naturalmente en JSON, BSON y otros tipos de síntaxis key-values.
Se convierte naturalmente en XML gracias a una función de XPAth 3.1

Con DCKV, xml pasa a ser un modelado segundario de la metadata.

