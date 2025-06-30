# 🎮 Comandos Divertidos - DevOps Onboarding

## 🚀 Comandos Básicos

### Despliegue Principal
```bash
# Despliegue automático completo
bash setup.sh

# Demostración de todas las funcionalidades
bash demo.sh
```

## 🎪 Comandos Divertidos

### 🎯 Herramientas Interactivas
```bash
# Menú de comandos divertidos
bash fun-commands.sh

# Incluye:
# - Generador de nombres épicos
# - Sistema de logros
# - ASCII art personalizado
# - Modo detective
# - Tema psicodélico
# - Cronómetro de despliegue
```

### 🎮 Minijuegos Educativos
```bash
# Centro de juegos DevOps
bash games.sh

# Juegos disponibles:
# - Adivina el Puerto
# - Docker Memory Game
# - Container Detective
# - Speed Command Challenge
# - DevOps Trivia
# - Build Race
```

### 🎯 Generador de Desafíos
```bash
# Desafíos personalizados por nivel
bash challenge-generator.sh

# Niveles disponibles:
# - 🟢 Fácil (Principiante)
# - 🟡 Medio (Intermedio)  
# - 🔴 Difícil (Avanzado)
# - 💀 Extremo (Experto)
```

## 🏆 Easter Eggs y Secretos

### 🕵️ Comandos Ninja Secretos
```bash
# Mensaje épico de ninja
docker run --rm -it nginx-bootstrap bash -c "echo 'Eres un/a DevOps Ninja 🥷' | figlet"

# Modo desarrollador ultra secreto
docker run --rm -it nginx-bootstrap sh -c "
echo '🎯 MODO DESARROLLADOR ACTIVADO'
echo 'Versión de NGINX:' && nginx -v
echo 'Procesos activos:' && ps aux
echo 'Espacio en disco:' && df -h
echo '🔥 ¡Eres oficialmente un hacker ético!'
"
```

### 🎨 Generador de Certificados
```bash
# Crear certificado personalizado de logros
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

### ⚡ Cronómetro de Velocidad
```bash
# Desafío de velocidad de despliegue
start_time=$(date +%s)
echo "🏁 ¡Iniciando cronómetro DevOps!"

# Ejecutar comandos rápidamente
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap) 2>/dev/null || true
docker build -t nginx-bootstrap-speed .
docker run -d -p 8080:80 nginx-bootstrap-speed

end_time=$(date +%s)
duration=$((end_time - start_time))
echo "⏰ ¡Completado en $duration segundos!"

if [ $duration -lt 60 ]; then
  echo "🏆 ¡ERES UN SPEEDRUNNER DEVOPS!"
else
  echo "💪 ¡Sigue practicando!"
fi
```

## 🔧 Comandos de Utilidad

### 📊 Estadísticas y Métricas
```bash
# Ver estadísticas del sistema Docker
docker system df

# Estadísticas de contenedores en tiempo real
docker stats --no-stream
```
docker exec -it $(docker ps -q --filter ancestor=nginx-bootstrap) /bin/sh

# Detener contenedor
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap)

# Limpiar todo
bash cleanup.sh
```

### Comandos de debugging
```bash
# Verificar puerto 8080
netstat -tlnp | grep 8080

# Test de conectividad
curl http://localhost:8080/health

# Verificar logs de NGINX
docker exec $(docker ps -q --filter ancestor=nginx-bootstrap) tail -f /var/log/nginx/access.log
```

### Personalización
```bash
# Editar configuración NGINX
nano nginx.conf

# Reconstruir imagen
docker build -t nginx-bootstrap .

# Desplegar cambios
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap)
docker run -d -p 8080:80 nginx-bootstrap
```

## 🌐 URLs útiles

- Vista previa: Clic en el ícono 🔳↗️ en Cloud Shell
- Health check: `http://localhost:8080/health`
- Logs en tiempo real: `docker logs -f <container_id>`

## 🆘 Troubleshooting

### Error: "Puerto en uso"
```bash
sudo lsof -i :8080
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap)
```

### Error: "Imagen no encontrada"
```bash
docker images
docker build -t nginx-bootstrap .
```

### Error: "Sin permisos Docker"
```bash
sudo docker ps
# o
sudo usermod -aG docker $USER
```
