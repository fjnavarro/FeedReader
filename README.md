# FeedReader

Lector RSS en `Objective-C`, prueba técnica para la empresa **atSistemas**. 

*La práctica se realizó el 17-07-2017

===================

Es un sencillo lector RSS, que descarga las noticias del feed de Xataka Andorid http://www.xatakandroid.com/tag/feeds/rss2.xml y las muestra en un lista de tabla.

## Libreras usadas ##

- AFNetworking 3: facilita la comunicación con apis/webservices [https://github.com/AFNetworking/AFNetworking]
 
- XMLDictionary: facilita el parseo de un XML y lo transforma en un diccionario [https://github.com/nicklockwood/XMLDictionary]

- SDWebImage: proporciona un sistema de caché en las imágenes [https://github.com/rs/SDWebImage] (cambiar por otro en versiones posteriores)

## Nota ##

La librera SDWebImage trae un bug con celdas personalizadas en una tabla, corregir antes de pasar a producción.

Para este fácil desarrollo he usado el patrón MVC, dividíendolo en carpetas Models, Views y Controllers.

Mejoras para una siguiente versión.

- Aplicar CoreData para persistencia.




## Autor ##

* Francisco José Navarro García <fran@fjnavarro.com>
* Resumen CV: http://fjnavarro.com/CV/fjnavarroResumenCV.pdf
* Twitter : *[@fjnavarro_](https://twitter.com/fjnavarro_)*
* Linkedin: *[https://www.linkedin.com/in/fjnavarrogarcia](https://www.linkedin.com/in/fjnavarrogarcia)*
* Blog    : *[http://www.fjnavarro.com/](http://www.fjnavarro.com/)*
