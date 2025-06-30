# 🧪 DevOps Challenge Day 1 - NGINX Bootstrap App
# Imagen base optimizada de NGINX
FROM nginx:alpine

# Metadatos del contenedor
LABEL maintainer="roxsross <roxsross@gmail.com>"
LABEL description="Aplicación web estática con NGINX para el desafío DevOps"
LABEL version="1.0"

# Copiar configuración personalizada de NGINX
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar archivos del sitio web
COPY site/ /usr/share/nginx/html/

# Crear directorio para logs (buena práctica)
RUN mkdir -p /var/log/nginx

# Exponer puerto 80
EXPOSE 80

# Comando por defecto (aunque NGINX ya lo tiene)
CMD ["nginx", "-g", "daemon off;"]
