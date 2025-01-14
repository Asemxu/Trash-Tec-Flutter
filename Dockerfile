# Usa una imagen base de Flutter
FROM cirrusci/flutter:stable

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y wget gnupg software-properties-common apt-transport-https

# Añade el repositorio de Microsoft Edge
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"

# Instala Microsoft Edge
RUN apt-get update && apt-get install -y microsoft-edge-stable

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo los archivos necesarios para instalar las dependencias
COPY pubspec.* ./

# Instala las dependencias
RUN flutter pub get

# Copia el resto de los archivos del proyecto
COPY . .

# Establece variables de entorno para Edge
ENV EDGE_EXECUTABLE=/usr/bin/microsoft-edge

# Comando para iniciar la aplicación en modo desarrollo con Edge
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
