# OPENDICOM objeto DICOM CDA

DICOM Encapsulated Document CDA (SOP CLASS 1.2.840.10008.5.1.4.1.1.104.2) es el objeto raíz que usamos para integrar la información de citas y de informes dentro des PACS. Tanto la cita como el informe adoptan una misma arquitectura genérica.

Una selección de la metadata se guarda en atributos DICOM. La modalidad DICOM del objeto es OT cuando se trata de una cita y DOC cuando se trata de un informe.

La selección de metadata ya mencionada y todos los detalles adicionales se almacenan en el documento encapsulado.

El documento encapsulado se parece a una matrioshka, con varios niveles de encapsulación interna.

![matrioska](wooden-bethlehem-matrioska.jpg)

Los niveles del documento encapsulado de opendicom (desde el más externo al más interno) son:


1. **DICOM**: metadata de un SOP Instance 1.2.840.10008.5.1.4.1.1.104.2 
[http://dicom.nema.org/medical/dicom/current/output/html/part03.html#sect_A.45.2](http://dicom.nema.org/medical/dicom/current/output/html/part03.html#sect_A.45.2).
1. **Displayable**: capa XML que contiene transormmador xslt 1.0 y otros objetos para que el navegador que reciba el objeto lo pueda mostrar automaticamente en formato amigable para el usuario. Para lograr eso, usamos la técnica descrita en 
[https://www.w3.org/TR/1999/REC-xslt-19991116#section-Embedding-Stylesheets](https://www.w3.org/TR/1999/REC-xslt-19991116#section-Embedding-Stylesheets).
1. **Signed Clinical Document**: capa de firma electronica que se conforma con los lineamientos de Salud.uy (firma XML DSIG con una firma envolvente) que se encuentran en 
[https://hcen.salud.uy/documents/22124/38305/SaludUy_FirmaElectronica_0.7.pdf](https://hcen.salud.uy/documents/22124/38305/SaludUy_FirmaElectronica_0.7.pdf).
1. **CDA**: Clinical Document de HL7 
[http://vico.org/CDAR22005_HL7SP/infrastructure/cda/cda.htm](http://vico.org/CDAR22005_HL7SP/infrastructure/cda/cda.htm)cumpliendo además con las especificación de Salud.uy que se encuentran en 
[https://hcen.salud.uy/web/pub/documentacion](https://hcen.salud.uy/web/pub/documentacion) (Guía CDA Mínimo, Guía OIDS, Guía Identificación de Personas, Guía Ontología de Documentos) y la especificación del CDA para informe imagenologico DICOM encontrado en 
[http://dicom.nema.org/medical/dicom/current/output/pdf/part20.pdf](http://dicom.nema.org/medical/dicom/current/output/pdf/part20.pdf).
1. **PDF** o **AUDIO**: Los elementos <text> del CDA pueden contener elementos <LinkHtml> caracterizados por un atributo @href. El mismo puede contener datos binarios codificados base 64 correspondientes a un mime type que el navegador sabe presentar (
[https://tools.ietf.org/html/rfc2397](https://tools.ietf.org/html/rfc2397) 
[https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs)). Especializamos esta segunda posibilidad para transportar documentos PDFs cuando corresponde, por ejemplo en caso de escaneo de orden de servicio manuscrita.
