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

## 🎮 Mini-Juegos DevOps (¡Aprende jugando!)

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

## 📋 Pre-requisitos

- ✅ Cuenta de Google (para acceder a Cloud Shell)
- ✅ Navegador web moderno
- ✅ Ganas de aprender DevOps 🤓

---

## ✅ Paso 1: Cloná el repositorio

Ejecutá este comando en la terminal de Cloud Shell:

```bash
git clone https://github.com/roxsross/roxs-onbording-devops.git
cd roxs-onbording-devops
```

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

## � Paso 5: Personalizá tu sitio (Opcional)

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

## 📚 ¿Qué aprendiste?

✅ **Docker básico**: Construcción y ejecución de contenedores  
✅ **NGINX**: Configuración de servidor web  
✅ **Cloud Shell**: Herramientas de desarrollo en la nube  
✅ **Automatización**: Scripts para despliegue  
✅ **Troubleshooting**: Resolución de problemas comunes  

---

## 🎪 Easter Eggs y Trucos Secretos

### 🕵️ Comando Ninja Secreto
```bash
# El comando más épico que vas a ejecutar hoy
docker run --rm -it nginx-bootstrap bash -c "echo 'Eres un/a DevOps Ninja 🥷' | figlet"
```

### 🎭 Modo Hacker
Activa el "modo Matrix" en tu terminal:
```bash
# Instala cmatrix si no está disponible
docker exec -it $(docker ps -q --filter ancestor=nginx-bootstrap) sh -c "
echo 'Entrando al modo Matrix...'
for i in {1..20}; do 
  echo -e '\033[32m' \$(date) '\033[0m - Container process running...'; 
  sleep 0.1; 
done
"
```

### 🎨 Genera tu certificado de logro
```bash
# Crea tu certificado personalizado
cat << 'EOF' > mi-certificado-devops.txt
╔══════════════════════════════════════════╗
║          🏆 CERTIFICADO DEVOPS 🏆          ║
║                                          ║
║  $(whoami) ha completado exitosamente    ║
║  el Reto DevOps Día 1 - RoxsRoss        ║
║                                          ║
║  Habilidades desbloqueadas:              ║
║  ✅ Docker Ninja                         ║
║  ✅ NGINX Master                         ║
║  ✅ Cloud Shell Expert                   ║
║                                          ║
║  Fecha: $(date +%Y-%m-%d)                ║
╚══════════════════════════════════════════╝
EOF

cat mi-certificado-devops.txt
```

---

## 🎯 Misiones Especiales (¡Para valientes!)

### 🚀 Misión 1: "El Infiltrado"
Entra a tu contenedor como un espía:
```bash
# Misión: Descubre qué procesos están corriendo
docker exec -it $(docker ps -q --filter ancestor=nginx-bootstrap) top

# Bonus: Investiga la estructura de archivos
docker exec -it $(docker ps -q --filter ancestor=nginx-bootstrap) find / -name "*.conf" 2>/dev/null
```

### 🔍 Misión 2: "El Detective de Logs"
Conviértete en Sherlock Holmes de los logs:
```bash
# Investiga los logs en tiempo real
docker logs -f $(docker ps -q --filter ancestor=nginx-bootstrap) &

# Ahora haz algunas requests para generar logs
for i in {1..5}; do 
  curl -s http://localhost:8080/ > /dev/null
  echo "Request $i enviado 🕵️"
  sleep 1
done

# Detén el seguimiento de logs
kill %1
```

### 🎮 Misión 3: "El Speedrunner"
¿Puedes desplegar en menos de 60 segundos?
```bash
# ⏱️ Cronómetro DevOps Challenge
start_time=$(date +%s)
echo "🏁 ¡Iniciando cronómetro DevOps!"

# Tu misión: ejecutar estos comandos lo más rápido posible
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap) 2>/dev/null || true
docker build -t nginx-bootstrap-speed .
docker run -d -p 8080:80 nginx-bootstrap-speed
curl -s http://localhost:8080/health

end_time=$(date +%s)
duration=$((end_time - start_time))
echo "⏰ ¡Completado en $duration segundos!"

if [ $duration -lt 60 ]; then
  echo "🏆 ¡ERES UN SPEEDRUNNER DEVOPS!"
else
  echo "💪 ¡Buen trabajo! Intenta mejorar tu tiempo"
fi
```

---

## 🎲 Generador de Nombres Épicos para Contenedores

¿Cansado de nombres aburridos? ¡Genera nombres épicos para tus contenedores!

```bash
# Generador de nombres épicos
ADJECTIVES=("Mighty" "Cosmic" "Legendary" "Epic" "Quantum" "Turbo" "Cyber" "Blazing")
NOUNS=("Falcon" "Dragon" "Phoenix" "Kraken" "Titan" "Vortex" "Storm" "Ninja")

RANDOM_ADJ=${ADJECTIVES[$RANDOM % ${#ADJECTIVES[@]}]}
RANDOM_NOUN=${NOUNS[$RANDOM % ${#NOUNS[@]}]}

echo "🎯 Tu nombre épico de contenedor: $RANDOM_ADJ-$RANDOM_NOUN"

# Bonus: Úsalo en tu próximo despliegue
docker run -d -p 8080:80 --name ${RANDOM_ADJ,,}-${RANDOM_NOUN,,} nginx-bootstrap
```

---

## 🎯 Desafíos de Código Extremos

### 🔥 Desafío 1: "El Contenedor Camuflado"
Crea un contenedor que se esconda de los comandos básicos:

```bash
# Crear un contenedor ninja
docker run -d --name "..." nginx-bootstrap

# ¿Puedes encontrarlo?
docker ps | grep -E "\.\.\."
```

### 🌊 Desafío 2: "El Swarm de Contenedores"
¡Crea un ejército de contenedores!

```bash
# Despliega múltiples contenedores en puertos diferentes
for i in {8081..8085}; do
  docker run -d -p $i:80 --name "ninja-$i" nginx-bootstrap
  echo "🚀 Contenedor ninja-$i desplegado en puerto $i"
done

# Verifica tu ejército
docker ps --format "table {{.Names}}\t{{.Ports}}"
```

### 🎪 Desafío 3: "El Contenedor Boomerang"
Un contenedor que se reinicia automáticamente:

```bash
# Contenedor que vuelve a la vida
docker run -d --restart=always --name "boomerang" nginx-bootstrap

# Mata el contenedor y observa cómo vuelve
docker kill boomerang
sleep 5
docker ps | grep boomerang
```

---

## 🎮 Modo Competitivo: DevOps Battles

### ⚔️ Battle 1: "Speed Deploy"
Compite con tus compañeros:

```bash
# Cronómetro de competencia
echo "⏱️ BATALLA DEVOPS: ¿Quién despliega más rápido?"
read -p "Presiona ENTER para comenzar..."

start=$(date +%s)
docker build -t battle-app . && docker run -d -p 9000:80 battle-app
end=$(date +%s)

echo "🏁 Tiempo: $((end-start)) segundos"
echo "🏆 ¡Registra tu tiempo y compáralo con otros!"
```

### 🎯 Battle 2: "Container Juggling"
¿Cuántos contenedores puedes manejar?

```bash
# Desafío de malabarismo
echo "🤹 MALABARISMO DE CONTENEDORES"
count=0
for i in {1..10}; do
  if docker run -d --name "juggle-$i" nginx-bootstrap > /dev/null 2>&1; then
    count=$((count+1))
    echo "✅ Contenedor $i desplegado"
  else
    echo "❌ Falló en contenedor $i"
    break
  fi
done

echo "🏆 Récord: $count contenedores desplegados"
```

---

## 🎨 Galería de Modificaciones Creativas

### 🌈 Sitio Web Psicodélico
```bash
# Crea un sitio web que cambia de colores constantemente
cat > site/psychedelic.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>🌈 Sitio Psicodélico</title>
    <style>
        body { 
            animation: rainbow 2s linear infinite;
            text-align: center;
            font-family: Arial, sans-serif;
            font-size: 24px;
        }
        @keyframes rainbow {
            0% { background: #ff0000; }
            16% { background: #ff8000; }
            33% { background: #ffff00; }
            50% { background: #00ff00; }
            66% { background: #0080ff; }
            83% { background: #8000ff; }
            100% { background: #ff0000; }
        }
    </style>
</head>
<body>
    <h1>🎨 ¡Bienvenido al Sitio Psicodélico!</h1>
    <p>Desplegado con Docker + NGINX</p>
    <p>Usuario: $(whoami)</p>
</body>
</html>
EOF
```

### 🎪 Página de Efectos Visuales
```bash
# Sitio con efectos de Matrix
cat > site/matrix.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>🕶️ Matrix Mode</title>
    <style>
        body { 
            background: #000; 
            color: #00ff00; 
            font-family: monospace;
            overflow: hidden;
        }
        #matrix { font-size: 12px; }
    </style>
</head>
<body>
    <div id="matrix"></div>
    <script>
        const chars = "0123456789ABCDEF";
        const matrix = document.getElementById('matrix');
        
        setInterval(() => {
            let line = '';
            for(let i = 0; i < 100; i++) {
                line += chars[Math.floor(Math.random() * chars.length)];
            }
            matrix.innerHTML = line + '<br>' + matrix.innerHTML;
            
            // Mantener solo las últimas 50 líneas
            const lines = matrix.innerHTML.split('<br>');
            if(lines.length > 50) {
                matrix.innerHTML = lines.slice(0, 50).join('<br>');
            }
        }, 100);
    </script>
</body>
</html>
EOF
```

---

## 🎯 Misión Final: "El Desafío del Maestro DevOps"

¿Estás listo para el desafío final? ¡Completa todos estos pasos sin ayuda!

### 📋 Checklist del Maestro:

```bash
# 1. Crea un contenedor con nombre personalizado
docker run -d --name "mi-creacion-epica" nginx-bootstrap

# 2. Modifica el contenido del sitio web
echo "<h1>¡Soy un Maestro DevOps!</h1>" > site/index.html

# 3. Reconstruye la imagen
docker build -t mi-imagen-personal .

# 4. Despliega en un puerto diferente
docker run -d -p 7777:80 mi-imagen-personal

# 5. Verifica que funciona
curl http://localhost:7777

# 6. Exporta tu imagen
docker save mi-imagen-personal > mi-imagen-personal.tar

# 7. Comparte tu éxito
echo "🎉 ¡He conquistado el desafío DevOps!" > exito.txt
cat exito.txt
```

---

## 🏆 Certificación Final

Si has llegado hasta aquí, ¡mereces el certificado de honor!

```bash
# Genera tu certificado oficial
cat << 'EOF' > certificado-maestro-devops.txt
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║           🏆 CERTIFICADO DE MAESTRO DEVOPS 🏆             ║
║                                                          ║
║  Este certificado se otorga a:                          ║
║  $(whoami | tr '[:lower:]' '[:upper:]')                  ║
║                                                          ║
║  Por completar exitosamente el                          ║
║  "Reto DevOps Día 1 - Despliegue Épico"                ║
║                                                          ║
║  Habilidades demostradas:                               ║
║  ✅ Dominio de Docker                                   ║
║  ✅ Configuración de NGINX                              ║
║  ✅ Despliegue en la nube                               ║
║  ✅ Troubleshooting avanzado                            ║
║  ✅ Creatividad técnica                                 ║
║                                                          ║
║  Fecha: $(date +"%d de %B de %Y")                       ║
║  Autorizado por: RoxsRoss DevOps Academy                ║
║                                                          ║
║  🌟 Nivel alcanzado: MAESTRO DEVOPS 🌟                  ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
EOF

# Mostrar el certificado con estilo
echo ""
echo "🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊"
cat certificado-maestro-devops.txt
echo "🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊"
echo ""
echo "📸 ¡Haz una captura de pantalla y compártela!"
echo "🐦 Tuitea: 'Acabo de completar el Reto DevOps Día 1 con @roxsross'"
echo "📱 Hashtags: #DevOps #Docker #NGINX #RoxsRoss #CloudShell"
```

---

## 🎪 Bonus: Comandos Secretos de Desarrollador

### 🔍 Comando Ultra Secreto
```bash
# Solo para los más curiosos...
docker run --rm -it nginx-bootstrap sh -c "
echo '🎯 MODO DESARROLLADOR ACTIVADO'
echo '================================='
echo 'Versión de NGINX:' && nginx -v
echo 'Procesos activos:' && ps aux
echo 'Espacio en disco:' && df -h
echo 'Memoria:' && free -h
echo 'Configuración de red:' && ip addr show
echo '================================='
echo '🔥 ¡Eres oficialmente un hacker ético!'
"
```

### 🎨 Genera tu Logo ASCII
```bash
# Crea tu logo personalizado
echo "TU NOMBRE AQUÍ" | figlet -f big
echo "TU NOMBRE AQUÍ" | figlet -f slant
echo "TU NOMBRE AQUÍ" | figlet -f banner
```

---

## 🎯 Próximos Pasos

¡Felicidades! Has completado el Día 1. ¿Qué sigue?

### 🚀 Día 2: Kubernetes Básico
### 🚀 Día 3: CI/CD con GitHub Actions  
### 🚀 Día 4: Monitoreo con Prometheus
### 🚀 Día 5: Terraform para Infrastructure as Code

---

## 📱 Mantente Conectado

- 🐦 **Twitter**: [@roxsross](https://twitter.com/roxsross)
- 📺 **YouTube**: [RoxsRoss DevOps](https://youtube.com/@roxsross)
- 💼 **LinkedIn**: [Rossana Suarez](https://linkedin.com/in/roxsross)
- 🌐 **Web**: [roxsross.com](https://roxsross.com)

---

<div align="center">

### 🎉 ¡Gracias por completar el Reto DevOps Día 1! 🎉

**¡Nos vemos en el próximo desafío!**

</div>


