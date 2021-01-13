# pipedicom

Los pedidos de interconexión de sistemas son cada vez más frecuentes:
- reenvio de una selección de objetos DICOM a otro sistema
- estadísticas
- flujos de trabajo,
- etc

Hemos escrito desde cero scripts o aplicaciones específicas una y otra vez sin capitalizar al máximo los esfuerzos realizados en un caso para solucionar otro. Pasó de esta forma porque usábamos herramientas de otros (dcmtk, dcm4che etc), no siempre las mismas, pues con APIs distintas,  dentro de aplicaciones monolíticas.

El mantenimiento era posible mientras dependía del creador de la solución y el número de clientes era pequeño. Queremos progresar tanto en cantidad de técnicos y de clientes, pues se hizo necesario pensar nuevamente todas las herramientas que hemos creado y buscamos la forma de modularizarlas en base a "ejecutables" de ejecución orquestada. Cada ejecutable está acompañado con documentación suficiente para que cualquier técnico pueda usarlo.

Varios casos de uso requieren leer la metadata DICOM y eventualmente modificarla. Para modificaciones complejas, lar representación de los objetos dicom en xml  y uso de xsl es la opción menos acrobática. En una arquitectura modular, modificaciones sucesivas pueden implicar serializaciones y parseos demás entrre modulo y modulo. Teniendo en cuenta que los archivos a modificar pueden ser miles para un solo estudio, se hace crítico optimizar la transmisión de los objetos entre modulos, las estructuras xml y procesamiento xsl. Este requerimiento es un buen ejemplo dónde el éstandar no es la mejor solución. En efecto, el formato dicom native xml es mucho más complejo de lo necesario. Lo hemos demostrado gracias a una alternativa más simple sin que pierda nada de la información estructurada en dicom native xml. Llamamos este nuevo formato "contextualized key values xmldicom". Desarrollamos la especificación en un schema xml (que permite cierta validación de las instancias) y varios codecs para transformación ida y vuelta a otras representaciones.

