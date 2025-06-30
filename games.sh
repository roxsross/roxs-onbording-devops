#!/bin/bash

# 🎮 DevOps Gaming Zone - Minijuegos interactivos
# ===============================================

echo "🕹️ ¡BIENVENIDO A LA ZONA DE JUEGOS DEVOPS!"
echo "=========================================="
echo ""

# Colores para hacer más divertido
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para mostrar el menú de juegos
show_games_menu() {
    echo -e "${CYAN}🎮 ¿A qué quieres jugar?${NC}"
    echo "1. 🎯 Adivina el Puerto"
    echo "2. 🐳 Docker Memory Game"
    echo "3. 🕵️ Container Detective"
    echo "4. ⚡ Speed Command Challenge"
    echo "5. 🎲 DevOps Trivia"
    echo "6. 🏗️ Build Race"
    echo "7. 🎪 Salir"
    echo ""
}

# Juego 1: Adivina el Puerto
guess_the_port() {
    echo -e "${YELLOW}🎯 ADIVINA EL PUERTO${NC}"
    echo "================================"
    
    ports=(80 443 22 21 25 53 8080 3000 5432 27017)
    services=("HTTP" "HTTPS" "SSH" "FTP" "SMTP" "DNS" "HTTP-Alt" "Node.js" "PostgreSQL" "MongoDB")
    
    random_index=$((RANDOM % ${#ports[@]}))
    correct_port=${ports[$random_index]}
    service_name=${services[$random_index]}
    
    echo "🤔 ¿Cuál es el puerto estándar para ${service_name}?"
    echo ""
    read -p "Tu respuesta: " user_guess
    
    if [ "$user_guess" -eq "$correct_port" ]; then
        echo -e "${GREEN}🎉 ¡CORRECTO! ${service_name} usa el puerto ${correct_port}${NC}"
        echo "🏆 +10 puntos DevOps"
    else
        echo -e "${RED}❌ Incorrecto. ${service_name} usa el puerto ${correct_port}${NC}"
        echo "💡 ¡Sigue estudiando!"
    fi
}

# Juego 2: Docker Memory Game
docker_memory_game() {
    echo -e "${PURPLE}🐳 DOCKER MEMORY GAME${NC}"
    echo "============================"
    
    commands=("docker run" "docker build" "docker ps" "docker stop" "docker rm" "docker pull")
    descriptions=("Ejecutar contenedor" "Construir imagen" "Listar contenedores" "Parar contenedor" "Eliminar contenedor" "Descargar imagen")
    
    random_index=$((RANDOM % ${#commands[@]}))
    correct_command=${commands[$random_index]}
    description=${descriptions[$random_index]}
    
    echo "🧠 ¿Qué comando de Docker se usa para: ${description}?"
    echo ""
    read -p "Tu respuesta: " user_answer
    
    if [[ "$user_answer" == "$correct_command" ]]; then
        echo -e "${GREEN}🎉 ¡PERFECTO! Tienes buena memoria Docker${NC}"
        echo "🐳 +15 puntos Docker"
    else
        echo -e "${RED}❌ Era: ${correct_command}${NC}"
        echo "🤓 ¡Repasa los comandos básicos!"
    fi
}

# Juego 3: Container Detective
container_detective() {
    echo -e "${BLUE}🕵️ CONTAINER DETECTIVE${NC}"
    echo "========================="
    
    echo "🔍 ¡Eres un detective digital! Analiza las pistas:"
    echo ""
    
    # Generar pistas aleatorias
    clues=("Puerto 8080 expuesto" "Imagen basada en Alpine" "Servidor web corriendo" "Logs muestran GET requests")
    mystery_containers=("nginx" "apache" "node" "python-web")
    
    echo "🕵️ Pistas encontradas:"
    for i in {0..2}; do
        echo "  - ${clues[$((RANDOM % ${#clues[@]}))]}"
    done
    
    echo ""
    echo "🤔 ¿Qué tipo de contenedor crees que es?"
    echo "a) Web server"
    echo "b) Database"
    echo "c) Cache"
    echo "d) Queue"
    
    read -p "Tu deducción (a/b/c/d): " answer
    
    if [[ "$answer" == "a" ]]; then
        echo -e "${GREEN}🎉 ¡CASO RESUELTO! Eres un gran detective${NC}"
        echo "🔍 +20 puntos Detective"
    else
        echo -e "${RED}❌ El caso sigue abierto... Era un web server${NC}"
        echo "🧐 ¡Necesitas más entrenamiento detective!"
    fi
}

# Juego 4: Speed Command Challenge
speed_command_challenge() {
    echo -e "${RED}⚡ SPEED COMMAND CHALLENGE${NC}"
    echo "=============================="
    
    echo "⏱️ ¡Tienes 10 segundos para escribir el comando!"
    echo ""
    
    challenges=(
        "Listar todos los contenedores (activos e inactivos)"
        "Construir una imagen llamada 'myapp'"
        "Ejecutar contenedor en segundo plano en puerto 3000"
        "Ver logs de un contenedor llamado 'web'"
    )
    
    answers=(
        "docker ps -a"
        "docker build -t myapp ."
        "docker run -d -p 3000:80"
        "docker logs web"
    )
    
    random_index=$((RANDOM % ${#challenges[@]}))
    challenge=${challenges[$random_index]}
    correct_answer=${answers[$random_index]}
    
    echo "🎯 Desafío: ${challenge}"
    echo ""
    
    # Cronómetro de 10 segundos
    echo "⏰ ¡Comenzando en 3... 2... 1... GO!"
    
    start_time=$(date +%s)
    read -p "Comando: " user_command
    end_time=$(date +%s)
    
    duration=$((end_time - start_time))
    
    if [[ "$user_command" == *"$(echo $correct_answer | cut -d' ' -f1-2)"* ]]; then
        if [ $duration -le 10 ]; then
            echo -e "${GREEN}🏆 ¡INCREÍBLE! Respuesta correcta en ${duration} segundos${NC}"
            echo "⚡ +25 puntos Speed"
        else
            echo -e "${YELLOW}✅ Correcto, pero tardaste ${duration} segundos${NC}"
            echo "🐌 +10 puntos (práctica más velocidad)"
        fi
    else
        echo -e "${RED}❌ Incorrecto. La respuesta era: ${correct_answer}${NC}"
        echo "🤓 ¡Sigue practicando!"
    fi
}

# Juego 5: DevOps Trivia
devops_trivia() {
    echo -e "${GREEN}🎲 DEVOPS TRIVIA${NC}"
    echo "=================="
    
    questions=(
        "¿Qué significa CI/CD?"
        "¿Cuál es el puerto por defecto de HTTP?"
        "¿Qué comando usa Docker para construir imágenes?"
        "¿Qué significa la 'D' en DevOps?"
        "¿Cuál es el formato de archivo de Docker?"
    )
    
    options=(
        "a)Continuous Integration/Continuous Deployment b)Code Integration/Code Deployment c)Computer Integration/Computer Deployment"
        "a)8080 b)80 c)443"
        "a)docker create b)docker build c)docker make"
        "a)Design b)Development c)Deploy"
        "a)Dockerfile b)Dockerconfig c)Dockersetup"
    )
    
    answers=("a" "b" "b" "b" "a")
    
    score=0
    total=3
    
    for i in {0..2}; do
        echo ""
        echo "Pregunta $((i+1))/$total:"
        echo "${questions[$i]}"
        echo "${options[$i]}"
        read -p "Tu respuesta: " user_answer
        
        if [[ "$user_answer" == "${answers[$i]}" ]]; then
            echo -e "${GREEN}✅ ¡Correcto!${NC}"
            score=$((score + 1))
        else
            echo -e "${RED}❌ Incorrecto. Era: ${answers[$i]}${NC}"
        fi
    done
    
    echo ""
    echo "🏆 Puntuación final: $score/$total"
    
    if [ $score -eq 3 ]; then
        echo -e "${GREEN}🎉 ¡EXPERTO DEVOPS!${NC}"
    elif [ $score -eq 2 ]; then
        echo -e "${YELLOW}👍 ¡Muy bien! Casi experto${NC}"
    else
        echo -e "${RED}📚 ¡Sigue estudiando!${NC}"
    fi
}

# Juego 6: Build Race
build_race() {
    echo -e "${CYAN}🏗️ BUILD RACE${NC}"
    echo "==============="
    
    echo "🏁 ¡Carrera de construcción de imágenes!"
    echo "Tu misión: construir una imagen lo más rápido posible"
    echo ""
    
    read -p "Presiona ENTER para empezar la carrera..."
    
    start_time=$(date +%s)
    
    echo "🚦 ¡GO! Construyendo imagen de prueba..."
    
    # Simular construcción
    for i in {1..5}; do
        echo "Step $i/5: Procesando..."
        sleep 0.5
    done
    
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    
    echo -e "${GREEN}🏁 ¡Imagen construida en ${duration} segundos!${NC}"
    
    if [ $duration -lt 3 ]; then
        echo "🏆 ¡RÉCORD MUNDIAL!"
    elif [ $duration -lt 5 ]; then
        echo "🥇 ¡Tiempo profesional!"
    else
        echo "🥉 ¡Buen esfuerzo!"
    fi
}

# Función para mostrar estadísticas
show_stats() {
    echo -e "${PURPLE}📊 TUS ESTADÍSTICAS DE JUEGOS${NC}"
    echo "================================"
    echo "🎮 Juegos jugados: $((RANDOM % 50 + 1))"
    echo "🏆 Puntos totales: $((RANDOM % 500 + 100))"
    echo "⚡ Mejor tiempo: $((RANDOM % 10 + 1)) segundos"
    echo "🎯 Precisión: $((RANDOM % 40 + 60))%"
}

# Bucle principal del menú de juegos
while true; do
    show_games_menu
    read -p "Elige un juego (1-7): " choice
    
    case $choice in
        1) guess_the_port ;;
        2) docker_memory_game ;;
        3) container_detective ;;
        4) speed_command_challenge ;;
        5) devops_trivia ;;
        6) build_race ;;
        7) 
            show_stats
            echo -e "${CYAN}🎉 ¡Gracias por jugar! ¡Sigue practicando DevOps!${NC}"
            exit 0 
            ;;
        *) echo -e "${RED}❌ Opción no válida. Intenta de nuevo.${NC}" ;;
    esac
    
    echo ""
    echo "Presiona ENTER para continuar..."
    read
    clear
done
