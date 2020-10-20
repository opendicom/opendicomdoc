# opendicomdoc
(documentación de los productos Opendicom)

Opendicom brinda soluciones para facilitar el acceso a la imagenología médica fuera de la clínica via HTTP. Diseñamos servicios propios fáciles de integrar con la informática preexistente de las clínicas imagenológicas y coherentes con las tecnologías DICOM definidas en 

- **parte 18**: Webservices (sintaxis HTTP REST aplicada al modelo de objeto DICOM)
- **parte 20**: Imaging Reports using HL7 Clinical Document Architecture (modelo XML de documento clínico CDA adaptado al informe imagenologico)

La arquitectura de software incluye tres niveles superpuestos relacionados por API claramente definido:

1. La base **dicom** es constituida por las infraestructuras DICOM existentes, aplicaciones, sistema de archivos y base de datos de PACS, por ejemplo el PACS dcm4chee-arc.
2. **httpdicom** interactua con uno o más nodos de la infraestructura DICOM y publica servicios REST para su consumo por aplicaciones de RIS/HIS del hospital y cualquier programa que necesita datos de imagenología médica. Este nivel no incluye gestión de usuarios ni de sesión
3. **html5dicom** es un ejemplo de estos programas que consumen servicios de httpdicom. Permite la interacción del usuario mediante comunicación html5 (teleradiología-telediagnóstico). Dentro de las función provistas, listamos control de acceso, búsqueda de estudios, visualización y descarga de estudios, edición de informes médicos.                                                                                                                                                                                                             

Además proveemos dos modulos para la puesta en funcionamiento de las listas de trabajo (Modality WorkList):

4. **storedicom** se interpone entre las modalidades de adquisición y un PACS capaz de recibir archivos a traves de http. La función de spoolstow es de validar los objetos DICOM que se reciben, normalizar ciertos atributos, como por ejemplo el nombre de la institución y comprimir la data de las imágenes en jpeg 2000.
5. **mwldicom** brinda un interfaz rest de uso sencillo para gestionar una lista de trabajo (Modality WorkList)                                                                                                                                                                                                          

La presente documentación dedica un capitulo a cada uno de estos productos.

Capitulo 6 está dedicado a la instalación. 

Capitulo 7 está dedicado al servicio de reparación. 

Capitulo 8 es una síntesis escritas en lenguaje simple enfocando a la apología del producto.

Finalizamos la documentación con el capitulo 9 para los anexos que definen precisamente formatos de información usados por html5dicom y httpdicom.
