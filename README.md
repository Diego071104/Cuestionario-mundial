# Cuestionario-mundial
La aplicacion de Quiniela para 2026 la hice utilizando flutter y dart para que con esto las perosnas puedan hacer predicciones mediante
una interfaz sencilla e intuitiva.

El funcionamiento de la aplicación inicia con una pantalla principal donde el usuario puede comenzar la quiniela e ingresar su nombre como
participante. Despues, se muestran distintos partidos y el usuario introduce la cantidad de goles que considera que anotará cada selección.
Una vez completadas las predicciones, la aplicación compara automáticamente los resultados ingresados con marcadores correctos previamente definidos dentro del sistema y calcula la cantidad de aciertos exactos y puntos obtenidos.

La estructura funciona mediante diferentes pantallas que se hcieron con widgets de flutter. El archivo principal que es el main.dart
contiene toda la parte logica asi como la interaacion con la app. A su vez se utiizan aqui mismo clases como StatelessWidget y StatefulWidget para construir las interfaces y manejar datos que van cambiando.

El codigo funciona principalmente bajo estos puntos:
. Lista de 4 partidos del mundial almacenada en variables List, Map<String, dynamic
. Tambein con controladores TextEditingController para capturar los goles ingresados por el usuario y ciclos for para recorrer automáticamente todos los partidos,
. Asi mismo condicionales if que comparan las predicciones del usuario con los resultados correctos.

Finalmente cuando el usuario presiona ver resultados  la función  que se llama verResultados() procesa todas las respuestas del usuario, cuenta los aciertos exactos qure tuvo en base a los resultados "correctos"  y calcula la puntuación final de cuantos partiudos tuvo bien de los 4 donde cada uno que esta bien vale 3 puntos teniendo una calificacion maxima de 12. Por ultimo, la aplicación navega hacia una pantalla de resultados utilizando Navigator.push(), donde se muestran los datos obtenidos por el participante.
