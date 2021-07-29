# httpdicom

Federador de pacs que distribuye los queries y consolida las respuesta y consta con un caché para optimizar los accesos a pacs. Para asegurar un algo rendimiento permite conexión directa a la base de datos y a los sistemas de archivos de los pacs para obtener la información sin uso del aplicativo de pacs. Es una muy buena alternativa para la modernización de instituciones que constan con un viejo pacs dcm4chee. Es posible  cerrar el aplicativo, copiar la base de datos y mantener exclusivamente el acceso a los sistemas de archivo o copia de los mismos para mantener el acceso a las informaciones contenidas en el pacs obsoleto en paralelo a las informaciones que entran en un pacs de ultima generación. Con esta arquitectura, el mismo punto de acceso permite llegar a ambas la vieja y nueva información.

httpdicom en interna se relaciona con servidores pacs que comunican en dicom binario y hacia afuera brinda servicios rest:
- búsqueda de estudios
- fuente de datos para el widget html5 datatables (incluyendo paginación de los resultados)
- entrega de CDA encapsulados
- entrega de manifiesto weasis y cornerstone con filtrado de las series entregadas
- streaming zip de estudios a la carpeta de download o directamente a OsiriX 

