#nasdicom

Para redes DICOM locales sin necesidad de proxy storedicom, reemplazamos todos los pacs dcm4chee2 existentes por la versión 2.18.3 (la última de dcm4chee 2) corriendo desde contenedores "docker" en el aplicativo portainer de NAS Synology, Asustor u otro. Reemplazamos dos máquinas (servidor y storage) por una sola especializada en el almacenamiento y distribución de datos (excelentes funciones de RAID6 y 4 interfaces de red Gigabit o inclusive interfaz 10 Gb en el caso del Synology DS1621xs+ que promocionamos.

Esta arquitectura tiene muchos beneficios:
- Óptima seguridad y velocidad de acceso a volúmenes desde la aplicación de PACS.
- deja libres las interfaces de red para la conectividad a la red de producción DICOM y redes de consumo
- el uso de docker simplifica instalación y actualización
- el requerimiento de java viejo (máx 1.7) aplica al contenedor exclusivamente

Para clientes acostumbrados a dcm4chee2 y no tienen requerimientos nuevos, es una excelente opción de recambio de hardware antes que el hardware anterior empiece a tener fallas diversas.
