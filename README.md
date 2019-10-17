# docditaes
(DOCumentación en formato DITA de html5dicom y httpdicom en ESpañol)

Opendicom diseña soluciones para facilitar el acceso a la imagenología médica fuera de la clínica.

Sus desarrollos se inspiran esencialmente en dos partes del estándar DICOM:

- **parte 18**: Webservices (sintaxis HTTP REST aplicada al modelo de objeto DICOM)
- **parte 20**: Imaging Reports using HL7 Clinical Document Architecture (modelo XML de documento clínico CDA adaptado al informe imagenologico)

La arquitectura de software incluye tres niveles superpuestos relacionados por API claramente definido:


1. La base está constituida por las infraestructuras DICOM existentes, incluyendo servidores, por ejemplo el PACS dcm4chee-arc.
2. httpdicom interactua con los nodos de la infraestructura DICOM y presenta servicios REST que pueden ser consumidos por RIS/HIS y cualquier programa que necesita datos de imagenología médica. Este nivel no incluye gestión de usuarios ni de sesión
3. html5dicom es un ejemplo de estos programas que consumen servicios de httpdicom. Permite la interacción del usuario mediante comunicación html5 (teleradiología-telediagnóstico). Dentro de las función provistas, listamos control de acceso, búsqueda de estudios, visualización y descarga de estudios, edición de informes médicos.                                                                                                                                                                                                             


La documentación está subdividida entre estos tres niveles.

Agregamos un capitulo 4. dedicado a síntesis escritas en lenguaje simple y enfocando las bondades del producto. Los articulos en este capitulo convencen el comprador que html5dicom + httpdicom brinda solución a casos de uso dónde las limitaciones de los otros sistemas competidores son patentes.

Finalizamos la documentación con anexos 5. que definen precisamente formatos de información usados por html5dicom y httpdicom.
