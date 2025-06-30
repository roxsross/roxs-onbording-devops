#!/bin/bash

# 🎮 Fun Commands para el Tutorial DevOps
# =======================================

echo "🎉 ¡Bienvenido a los comandos divertidos!"
echo ""

# Función para mostrar un menú interactivo
show_menu() {
    echo "🎯 ¿Qué diversión quieres activar?"
    echo "1. 🎲 Generar nombre épico para contenedor"
    echo "2. 🏆 Mostrar tus logros DevOps"
    echo "3. 🎨 Crear ASCII art personalizado"
    echo "4. 🕵️ Modo detective de contenedores"
    echo "5. 🌈 Activar tema psicodélico"
    echo "6. ⏱️ Cronómetro de despliegue"
    echo "7. 🎪 Sorpresa aleatoria"
    echo "8. 🏃 Salir"
    echo ""
}

# Función para generar nombres épicos
generate_epic_name() {
    ADJECTIVES=("Mighty" "Cosmic" "Legendary" "Epic" "Quantum" "Turbo" "Cyber" "Blazing" "Thunder" "Shadow")
    NOUNS=("Falcon" "Dragon" "Phoenix" "Kraken" "Titan" "Vortex" "Storm" "Ninja" "Warrior" "Guardian")
    
    RANDOM_ADJ=${ADJECTIVES[$RANDOM % ${#ADJECTIVES[@]}]}
    RANDOM_NOUN=${NOUNS[$RANDOM % ${#NOUNS[@]}]}
    
    echo "🎯 Tu nombre épico de contenedor: $RANDOM_ADJ-$RANDOM_NOUN"
    echo "🚀 Úsalo con: docker run -d --name ${RANDOM_ADJ,,}-${RANDOM_NOUN,,} nginx-bootstrap"
}

# Función para mostrar logros
show_achievements() {
    echo "🏆 TUS LOGROS DEVOPS:"
    echo "===================="
    
    # Verificar diferentes logros
    if docker images | grep -q nginx-bootstrap; then
        echo "🏗️ Constructor Experto - ¡Has construido tu primera imagen!"
    fi
    
    if [ $(docker ps -q | wc -l) -gt 0 ]; then
        echo "🐳 Docker Ninja - ¡Tienes contenedores corriendo!"
    fi
    
    if curl -s http://localhost:8080/ >/dev/null 2>&1; then
        echo "🌐 Web Master - ¡Tu sitio está online!"
    fi
    
    echo "💫 Puntos DevOps: $(($RANDOM % 1000 + 100))"
}

# Función para crear ASCII art
create_ascii_art() {
    echo "🎨 Generador de ASCII Art"
    echo "========================"
    read -p "Escribe tu nombre o texto: " user_text
    
    if command -v figlet &> /dev/null; then
        echo "$user_text" | figlet -f slant
    else
        echo "📦 Instalando figlet..."
        sudo apt-get update && sudo apt-get install -y figlet
        echo "$user_text" | figlet -f slant
    fi
}

# Función detective
detective_mode() {
    echo "🕵️ MODO DETECTIVE ACTIVADO"
    echo "=========================="
    echo "📊 Contenedores activos: $(docker ps -q | wc -l)"
    echo "📦 Imágenes disponibles: $(docker images -q | wc -l)"
    echo "💾 Espacio usado por Docker: $(docker system df | tail -n +2 | awk '{sum += $3} END {print sum "MB"}')"
    echo "🎯 Contenedor más reciente: $(docker ps --latest --format '{{.Names}}')"
}

# Función tema psicodélico
psychedelic_theme() {
    echo "🌈 ACTIVANDO TEMA PSICODÉLICO..."
    
    cat > site/psychedelic-temp.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>🌈 DevOps Psicodélico</title>
    <style>
        body { 
            animation: rainbow 3s linear infinite;
            text-align: center;
            font-family: 'Courier New', monospace;
            font-size: 20px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        @keyframes rainbow {
            0% { background: linear-gradient(45deg, #ff0000, #ff8000); }
            25% { background: linear-gradient(45deg, #ffff00, #00ff00); }
            50% { background: linear-gradient(45deg, #0080ff, #8000ff); }
            75% { background: linear-gradient(45deg, #ff0080, #ff0000); }
            100% { background: linear-gradient(45deg, #ff0000, #ff8000); }
        }
        h1 { font-size: 3em; animation: pulse 2s infinite; }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.1); } }
    </style>
</head>
<body>
    <h1>🎨 DEVOPS PSICODÉLICO</h1>
    <p>🐳 Docker en modo arcoíris</p>
    <p>🚀 Desplegado por: $(whoami)</p>
    <p>⏰ $(date)</p>
    <p>🌟 ¡Eres un artista DevOps!</p>
</body>
</html>
EOF
    
    echo "🎉 ¡Tema psicodélico creado! Reconstruye tu contenedor para verlo."
}

# Función cronómetro
deployment_timer() {
    echo "⏱️ CRONÓMETRO DE DESPLIEGUE"
    echo "=========================="
    read -p "Presiona ENTER para iniciar el cronómetro..."
    
    start_time=$(date +%s)
    echo "🏁 ¡Cronómetro iniciado! Despliega tu contenedor ahora..."
    
    read -p "Presiona ENTER cuando termines..."
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    
    echo "⏰ Tiempo transcurrido: $duration segundos"
    
    if [ $duration -lt 30 ]; then
        echo "🏆 ¡INCREÍBLE! Eres un speedrunner DevOps!"
    elif [ $duration -lt 60 ]; then
        echo "🥇 ¡Excelente tiempo! Tienes potencial ninja."
    elif [ $duration -lt 120 ]; then
        echo "🥈 ¡Buen trabajo! Sigue practicando."
    else
        echo "🥉 ¡No te rindas! La práctica hace al maestro."
    fi
}

# Función sorpresa
random_surprise() {
    surprises=(
        "docker run --rm alpine echo '🎉 ¡Sorpresa! Acabas de ejecutar Alpine Linux!'"
        "echo '🔮 Predicción DevOps: Serás un experto en $((RANDOM % 30 + 1)) días'"
        "fortune | cowsay 2>/dev/null || echo '🐄 Muu-cho éxito en tu carrera DevOps'"
        "echo '🎲 Número de la suerte DevOps: $((RANDOM % 100 + 1))'"
        "date | figlet 2>/dev/null || echo '⏰ El tiempo vuela cuando te diviertes con DevOps'"
    )
    
    surprise=${surprises[$RANDOM % ${#surprises[@]}]}
    echo "🎪 ¡SORPRESA ALEATORIA!"
    echo "====================="
    eval $surprise
}

# Bucle principal del menú
while true; do
    show_menu
    read -p "Elige una opción (1-8): " choice
    
    case $choice in
        1) generate_epic_name ;;
        2) show_achievements ;;
        3) create_ascii_art ;;
        4) detective_mode ;;
        5) psychedelic_theme ;;
        6) deployment_timer ;;
        7) random_surprise ;;
        8) echo "🎉 ¡Gracias por usar los comandos divertidos! ¡Nos vemos!"; exit 0 ;;
        *) echo "❌ Opción no válida. Intenta de nuevo." ;;
    esac
    
    echo ""
    echo "Presiona ENTER para continuar..."
    read
    clear
done
