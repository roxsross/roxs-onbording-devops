# 🧪 Reto DevOps Día 1 - ¡Tu primer despliegue en la nube!

<div align="center">

![DevOps](https://img.shields.io/badge/DevOps-Challenge-blue?style=for-the-badge)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker)
![NGINX](https://img.shields.io/badge/NGINX-Configured-009639?style=for-the-badge&logo=nginx)

</div>

¡Bienvenid@ al primer desafío de los **90 Días de DevOps con Roxs**!

> 🎯 **Objetivo**: Desplegar una aplicación web usando Docker y NGINX en menos de 5 minutos

---

## 🚀 ¿Qué vas a lograr?

- ✅ **Desplegar** una aplicación estática usando NGINX
- ✅ **Containerizar** con Docker desde Google Cloud Shell  
- ✅ **Ver** tu app online sin instalar nada en tu máquina
- ✅ **Aprender** comandos básicos de Docker y NGINX

---

## 📋 Pre-requisitos

- ✅ Cuenta de Google (para acceder a Cloud Shell)
- ✅ Navegador web moderno
- ✅ Ganas de aprender DevOps 🤓

---

## ✅ Paso 1: ¡Ya estás listo para empezar!

¡Perfecto! Ya tienes el repositorio clonado y estás en el directorio correcto.

Verificá que estés en la ubicación correcta:

```bash
pwd
ls -la
```

**Deberías ver archivos como:**
- `setup.sh` - Script de despliegue automático
- `Dockerfile` - Configuración del contenedor
- `nginx.conf` - Configuración del servidor web
- `tutorial.md` - Este tutorial que estás leyendo

> 💡 **Tip**: Cloud Shell ya tiene Docker instalado y configurado

---

## ✅ Paso 2: Ejecutá el script mágico 🪄

```bash
bash setup.sh
```

### ¿Qué hace este script?

El script automatiza todo el proceso de despliegue:

1. **🔍 Verifica** que Docker esté funcionando
2. **🧹 Limpia** contenedores anteriores si existen  
3. **📥 Descarga** el template del sitio web
4. **🛠️ Construye** la imagen Docker con NGINX
5. **🚀 Levanta** el contenedor en el puerto 8080
6. **✅ Verifica** que todo esté funcionando

### Salida esperada:

```
🧪 ==============================================
    RETO DEVOPS DÍA 1 - ROXSROSS CHALLENGE    
===============================================

🔄 Verificando Docker...
✅ Docker está corriendo correctamente
🔄 Preparando entorno del sitio web...
🔄 Descargando template del sitio web...
🔄 Construyendo imagen Docker...
✅ Imagen Docker construida exitosamente
🔄 Iniciando contenedor NGINX...
✅ Contenedor iniciado correctamente
🔄 Esperando que el servidor esté listo...
✅ ¡El servidor está corriendo correctamente!

🎉 ================================================
          ¡DESPLIEGUE COMPLETADO! 
================================================
```

---

## 🌐 Paso 3: Abrí tu aplicación

### Opción 1: Vista previa automática

🔎 En la parte superior derecha del Cloud Shell, hacé clic en el botón **"Vista previa del puerto 8080"** (ícono 🔳↗️).

### Opción 2: URL directa

También podés acceder directamente usando la URL de tu Cloud Shell:

```
https://8080-<tu-session-id>.cloudshell.dev
```

Tu sitio se abrirá en una nueva pestaña del navegador mostrando un hermoso portafolio web.

---

## 🛠️ Paso 4: Explorá y verificá tu contenedor

### Ver contenedores activos:

```bash
docker ps --filter ancestor=nginx-bootstrap
```

**Salida esperada:**
```
CONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS         PORTS                  NAMES
abc123def456   nginx-bootstrap   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:8080->80/tcp   amazing_tesla
```

### Ver logs del contenedor:

```bash
docker logs $(docker ps -q --filter ancestor=nginx-bootstrap)
```

### Verificar el health check:

```bash
curl http://localhost:8080/health
```

**Salida esperada:** `healthy`

### Inspeccionar la imagen:

```bash
docker inspect nginx-bootstrap
```

---

## 🎨 Paso 5: Personalizá tu sitio (Opcional)

¿Querés personalizar el sitio? ¡Hacelo!

### Editar el contenido:

```bash
# Editar archivos HTML
nano site/index.html

# Reconstruir la imagen
docker build -t nginx-bootstrap .

# Detener contenedor anterior
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap)

# Levantar nuevo contenedor
docker run -d -p 8080:80 nginx-bootstrap
```

---

## 🐛 Troubleshooting

### Problema: "Puerto 8080 ya en uso"

```bash
# Ver qué está usando el puerto
sudo lsof -i :8080

# Detener todos los contenedores nginx-bootstrap
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap)
```

### Problema: "No se puede conectar al daemon de Docker"

```bash
# Verificar estado de Docker
docker info

# Si no está corriendo, iniciarlo
sudo systemctl start docker
```

### Problema: "Imagen no encontrada"

```bash
# Verificar imágenes disponibles
docker images

# Reconstruir la imagen
docker build -t nginx-bootstrap .
```

---

## 🎮 Mini-Juegos DevOps (¡Ahora que ya sabes lo básico!)

### 🏆 Desafío 1: "Adivina el Comando"
Antes de ejecutar cada comando, ¡intenta adivinar qué hace!

**Comando misterioso #1:**
```bash
docker ps -a | grep nginx-bootstrap | wc -l
```
<details>
<summary>🔍 ¡Click para ver la respuesta!</summary>
<br>
Este comando cuenta cuántos contenedores de nginx-bootstrap tienes (activos e inactivos). ¡Es como contar cuántas apps has desplegado!
</details>

### 🎲 Desafío 2: "Docker Roulette"
¡Vamos a explorar comandos de Docker aleatorios! Ejecuta estos después de tu despliegue:

```bash
# 🎯 Comando Sorpresa #1
docker exec $(docker ps -q --filter ancestor=nginx-bootstrap) ps aux

# 🎯 Comando Sorpresa #2
docker stats --no-stream $(docker ps -q --filter ancestor=nginx-bootstrap)

# 🎯 Comando Sorpresa #3
docker exec $(docker ps -q --filter ancestor=nginx-bootstrap) df -h
```

### 🧩 Puzzle DevOps: "Construye la imagen perfecta"
¿Puedes mejorar nuestro Dockerfile? ¡Intenta estos retos!

**Reto Fácil 🟢:** Agregar una etiqueta (LABEL) con tu nombre  
**Reto Medio 🟡:** Cambiar el puerto interno de 80 a 8080  
**Reto Difícil 🔴:** Agregar múltiples sitios estáticos  

---

## 📚 ¿Qué aprendiste?

✅ **Docker básico**: Construcción y ejecución de contenedores  
✅ **NGINX**: Configuración de servidor web  
✅ **Cloud Shell**: Herramientas de desarrollo en la nube  
✅ **Automatización**: Scripts para despliegue  
✅ **Troubleshooting**: Resolución de problemas comunes  



---

## 📱 Comparte tu éxito

¡Mostrá tu logro en redes sociales!

```
🎉 ¡Completé mi primer reto #DevOps! 
🐳 Deployé una app con Docker + NGINX en @GoogleCloud Shell
🚀 Parte del desafío #90DaysDevOps by @roxsross 

#Docker #NGINX #CloudShell #DevOps #Learning
```

---

## 🤝 Comunidad y ayuda

- 💬 **Discord**: [Únete a la comunidad DevOps](https://discord.gg/roxsross)
- 📺 **YouTube**: [Canal de RoxsRoss](https://youtube.com/@roxsross)
- 📚 **Blog**: [roxsross.github.io](https://roxsross.github.io)
- 🐦 **Twitter**: [@roxsross](https://twitter.com/roxsross)

---

## 🎪 ¿Quieres más diversión?

Si quieres explorar funcionalidades adicionales súper divertidas, ejecuta estos comandos:

### 🎮 Minijuegos interactivos
```bash
bash games.sh
```

### 🎯 Desafíos personalizados
```bash
bash challenge-generator.sh
```

### 🎨 Comandos divertidos
```bash
bash fun-commands.sh
```

---

<div align="center">

## 🎉 ¡FELICITACIONES! 

Has completado exitosamente tu **primer desafío DevOps**.

🏆 **¿Qué lograste?**
- ✅ Desplegaste una aplicación en la nube
- ✅ Aprendiste Docker básico  
- ✅ Configuraste NGINX
- ✅ Automatizaste un despliegue

---

**Creado con ❤️ por [RoxsRoss](https://github.com/roxsross)**  
*Transformando desarrolladores en DevOps Engineers*

</div>
