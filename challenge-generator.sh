#!/bin/bash

# 🎯 Challenge Generator - Generador de desafíos DevOps
# ======================================================

echo "🚀 GENERADOR DE DESAFÍOS DEVOPS"
echo "==============================="
echo ""

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Arrays de desafíos por dificultad
declare -a EASY_CHALLENGES=(
    "Construye una imagen Docker con tu nombre como etiqueta"
    "Ejecuta un contenedor que muestre la fecha actual y se cierre"
    "Lista todas las imágenes Docker disponibles en tu sistema"
    "Crea un contenedor que exponga el puerto 3000"
    "Inspecciona los detalles de la imagen nginx"
    "Ejecuta un contenedor Alpine y ejecuta el comando 'whoami'"
)

declare -a MEDIUM_CHALLENGES=(
    "Crea un Dockerfile multietapa con Alpine y Node.js"
    "Monta un volumen local en un contenedor nginx"
    "Configura variables de entorno personalizadas en un contenedor"
    "Ejecuta múltiples contenedores que se comuniquen entre sí"
    "Crea una red Docker personalizada y conecta contenedores"
    "Implementa health checks en tu Dockerfile"
)

declare -a HARD_CHALLENGES=(
    "Implementa un sistema de logging centralizado con múltiples contenedores"
    "Crea un docker-compose.yml con servicios web, db y cache"
    "Implementa rolling updates sin downtime"
    "Configura un proxy reverso con nginx y múltiples backends"
    "Crea un contenedor que se auto-escale basado en CPU"
    "Implementa secretos seguros usando Docker secrets"
)

declare -a EXTREME_CHALLENGES=(
    "Despliega una aplicación completa con monitoreo usando Prometheus"
    "Implementa CI/CD completo con GitHub Actions y Docker"
    "Crea un cluster Kubernetes local con múltiples nodos"
    "Implementa service mesh con Istio"
    "Configura disaster recovery automático"
    "Crea un pipeline de seguridad con escaneo de vulnerabilidades"
)

# Función para mostrar el menú principal
show_main_menu() {
    echo -e "${CYAN}🎯 ¿Qué nivel de desafío quieres?${NC}"
    echo "1. 🟢 Fácil (Principiante)"
    echo "2. 🟡 Medio (Intermedio)"
    echo "3. 🔴 Difícil (Avanzado)"
    echo "4. 💀 Extremo (Experto)"
    echo "5. 🎲 Sorpréndeme (Aleatorio)"
    echo "6. 🏆 Modo Competencia"
    echo "7. 📊 Mis estadísticas"
    echo "8. 🚪 Salir"
    echo ""
}

# Función para generar desafío fácil
generate_easy_challenge() {
    echo -e "${GREEN}🟢 DESAFÍO FÁCIL${NC}"
    echo "================="
    
    challenge=${EASY_CHALLENGES[$RANDOM % ${#EASY_CHALLENGES[@]}]}
    echo "🎯 Tu desafío: $challenge"
    
    show_hints_easy "$challenge"
    validate_completion "easy"
}

# Función para generar desafío medio
generate_medium_challenge() {
    echo -e "${YELLOW}🟡 DESAFÍO MEDIO${NC}"
    echo "================="
    
    challenge=${MEDIUM_CHALLENGES[$RANDOM % ${#MEDIUM_CHALLENGES[@]}]}
    echo "🎯 Tu desafío: $challenge"
    
    show_hints_medium "$challenge"
    validate_completion "medium"
}

# Función para generar desafío difícil
generate_hard_challenge() {
    echo -e "${RED}🔴 DESAFÍO DIFÍCIL${NC}"
    echo "==================="
    
    challenge=${HARD_CHALLENGES[$RANDOM % ${#HARD_CHALLENGES[@]}]}
    echo "🎯 Tu desafío: $challenge"
    
    show_hints_hard "$challenge"
    validate_completion "hard"
}

# Función para generar desafío extremo
generate_extreme_challenge() {
    echo -e "${PURPLE}💀 DESAFÍO EXTREMO${NC}"
    echo "==================="
    
    challenge=${EXTREME_CHALLENGES[$RANDOM % ${#EXTREME_CHALLENGES[@]}]}
    echo "🎯 Tu desafío: $challenge"
    echo ""
    echo -e "${RED}⚠️  ADVERTENCIA: Este desafío requiere conocimientos avanzados${NC}"
    echo -e "${RED}⚠️  Tiempo estimado: 30-60 minutos${NC}"
    
    show_hints_extreme "$challenge"
    validate_completion "extreme"
}

# Función para mostrar pistas nivel fácil
show_hints_easy() {
    echo ""
    echo -e "${BLUE}💡 Pistas:${NC}"
    
    case "$1" in
        *"imagen Docker con tu nombre"*)
            echo "   • Usa: docker build -t tu-nombre ."
            echo "   • No olvides el punto al final"
            ;;
        *"contenedor que muestre la fecha"*)
            echo "   • Usa: docker run --rm alpine date"
            echo "   • --rm elimina el contenedor automáticamente"
            ;;
        *"Lista todas las imágenes"*)
            echo "   • Usa: docker images"
            echo "   • También puedes usar: docker image ls"
            ;;
        *"puerto 3000"*)
            echo "   • Usa: docker run -p 3000:80"
            echo "   • El formato es puerto-host:puerto-contenedor"
            ;;
    esac
}

# Función para mostrar pistas nivel medio
show_hints_medium() {
    echo ""
    echo -e "${BLUE}💡 Pistas:${NC}"
    
    case "$1" in
        *"multietapa"*)
            echo "   • Usa FROM múltiples veces en tu Dockerfile"
            echo "   • Copia archivos entre etapas con COPY --from"
            ;;
        *"volumen local"*)
            echo "   • Usa: docker run -v /ruta/local:/ruta/contenedor"
            echo "   • Asegúrate de que la ruta local existe"
            ;;
        *"variables de entorno"*)
            echo "   • Usa: docker run -e MI_VARIABLE=valor"
            echo "   • También puedes usar --env-file"
            ;;
    esac
}

# Función para mostrar pistas nivel difícil
show_hints_hard() {
    echo ""
    echo -e "${BLUE}💡 Pistas:${NC}"
    
    case "$1" in
        *"logging centralizado"*)
            echo "   • Considera usar ELK stack (Elasticsearch, Logstash, Kibana)"
            echo "   • Configura drivers de logging en Docker"
            ;;
        *"docker-compose"*)
            echo "   • Define services, networks y volumes"
            echo "   • Usa depends_on para dependencias"
            ;;
    esac
}

# Función para mostrar pistas nivel extremo
show_hints_extreme() {
    echo ""
    echo -e "${BLUE}💡 Recursos:${NC}"
    echo "   • Documentación oficial de Docker"
    echo "   • Kubernetes documentation"
    echo "   • GitHub Actions documentation"
    echo "   • Prometheus monitoring guide"
    echo ""
    echo -e "${YELLOW}🤝 Consejo: ¡No dudes en buscar ayuda en comunidades!${NC}"
}

# Función para validar completación
validate_completion() {
    local difficulty=$1
    echo ""
    echo "⏱️ Tiempo estimado según dificultad:"
    
    case $difficulty in
        "easy") echo "   🟢 5-10 minutos" ;;
        "medium") echo "   🟡 15-30 minutos" ;;
        "hard") echo "   🔴 30-60 minutos" ;;
        "extreme") echo "   💀 1-3 horas" ;;
    esac
    
    echo ""
    read -p "¿Has completado el desafío? (s/n): " completed
    
    if [[ "$completed" =~ ^[Ss]$ ]]; then
        show_congratulations "$difficulty"
        update_stats "$difficulty"
    else
        echo -e "${YELLOW}💪 ¡No te rindas! Tómate tu tiempo y regresa cuando lo hayas completado.${NC}"
    fi
}

# Función para mostrar felicitaciones
show_congratulations() {
    local difficulty=$1
    echo ""
    echo -e "${GREEN}🎉 ¡FELICITACIONES!${NC}"
    echo "===================="
    
    case $difficulty in
        "easy")
            echo "🏅 Has completado un desafío fácil"
            echo "💰 +10 puntos DevOps"
            ;;
        "medium")
            echo "🥈 Has completado un desafío medio"
            echo "💰 +25 puntos DevOps"
            ;;
        "hard")
            echo "🥇 Has completado un desafío difícil"
            echo "💰 +50 puntos DevOps"
            ;;
        "extreme")
            echo "👑 ¡ERES UNA LEYENDA! Desafío extremo completado"
            echo "💰 +100 puntos DevOps"
            ;;
    esac
    
    echo ""
    generate_achievement_badge "$difficulty"
}

# Función para generar badge de logro
generate_achievement_badge() {
    local difficulty=$1
    local badge_file="achievement_$(date +%Y%m%d_%H%M%S).txt"
    
    cat > "$badge_file" << EOF
╔══════════════════════════════════════╗
║           🏆 LOGRO DESBLOQUEADO 🏆    ║
║                                      ║
║  Usuario: $(whoami)                   ║
║  Desafío: $difficulty                 ║
║  Fecha: $(date +"%Y-%m-%d %H:%M")     ║
║                                      ║
║  🌟 ¡Sigue así, campeón DevOps! 🌟   ║
╚══════════════════════════════════════╝
EOF
    
    echo "🎫 Badge guardado en: $badge_file"
    cat "$badge_file"
}

# Función para actualizar estadísticas
update_stats() {
    local difficulty=$1
    local stats_file="devops_stats.log"
    
    echo "$(date +%Y-%m-%d_%H:%M:%S) - Completed $difficulty challenge" >> "$stats_file"
}

# Función modo competencia
competition_mode() {
    echo -e "${PURPLE}🏆 MODO COMPETENCIA${NC}"
    echo "==================="
    echo ""
    echo "🎮 ¡Completa 3 desafíos en el menor tiempo posible!"
    echo ""
    
    read -p "¿Listo para la competencia? (s/n): " ready
    
    if [[ "$ready" =~ ^[Ss]$ ]]; then
        start_time=$(date +%s)
        
        echo "🏁 ¡COMPETENCIA INICIADA!"
        echo ""
        
        # Desafío 1
        echo "🎯 Desafío 1/3:"
        challenge=${EASY_CHALLENGES[$RANDOM % ${#EASY_CHALLENGES[@]}]}
        echo "$challenge"
        read -p "Completado? (s/n): " comp1
        
        # Desafío 2
        echo ""
        echo "🎯 Desafío 2/3:"
        challenge=${MEDIUM_CHALLENGES[$RANDOM % ${#MEDIUM_CHALLENGES[@]}]}
        echo "$challenge"
        read -p "Completado? (s/n): " comp2
        
        # Desafío 3
        echo ""
        echo "🎯 Desafío 3/3:"
        challenge=${HARD_CHALLENGES[$RANDOM % ${#HARD_CHALLENGES[@]}]}
        echo "$challenge"
        read -p "Completado? (s/n): " comp3
        
        end_time=$(date +%s)
        total_time=$((end_time - start_time))
        
        echo ""
        echo "🏁 ¡COMPETENCIA TERMINADA!"
        echo "⏱️ Tiempo total: $total_time segundos"
        
        if [ $total_time -lt 300 ]; then
            echo "🏆 ¡RÉCORD MUNDIAL! Eres increíblemente rápido"
        elif [ $total_time -lt 600 ]; then
            echo "🥇 ¡Excelente tiempo! Tienes potencial profesional"
        elif [ $total_time -lt 1200 ]; then
            echo "🥈 ¡Buen tiempo! Sigue practicando"
        else
            echo "🥉 ¡Completado! La velocidad vendrá con la práctica"
        fi
    fi
}

# Función para mostrar estadísticas
show_statistics() {
    echo -e "${CYAN}📊 TUS ESTADÍSTICAS${NC}"
    echo "==================="
    
    if [ -f "devops_stats.log" ]; then
        echo "📈 Desafíos completados:"
        echo "  🟢 Fáciles: $(grep -c "easy" devops_stats.log 2>/dev/null || echo 0)"
        echo "  🟡 Medios: $(grep -c "medium" devops_stats.log 2>/dev/null || echo 0)"
        echo "  🔴 Difíciles: $(grep -c "hard" devops_stats.log 2>/dev/null || echo 0)"
        echo "  💀 Extremos: $(grep -c "extreme" devops_stats.log 2>/dev/null || echo 0)"
        echo ""
        echo "🎯 Total de desafíos: $(wc -l < devops_stats.log 2>/dev/null || echo 0)"
    else
        echo "📭 Aún no has completado ningún desafío"
        echo "🚀 ¡Es hora de empezar tu aventura DevOps!"
    fi
    
    echo ""
    echo "🏅 Badges disponibles en el directorio actual:"
    ls achievement_*.txt 2>/dev/null | wc -l | xargs echo "  Badges ganados:"
}

# Función para desafío aleatorio
random_challenge() {
    echo -e "${CYAN}🎲 DESAFÍO ALEATORIO${NC}"
    echo "===================="
    
    all_challenges=("${EASY_CHALLENGES[@]}" "${MEDIUM_CHALLENGES[@]}" "${HARD_CHALLENGES[@]}")
    random_challenge=${all_challenges[$RANDOM % ${#all_challenges[@]}]}
    
    echo "🎯 Tu desafío aleatorio:"
    echo "$random_challenge"
    echo ""
    echo "💡 Pista: ¡La dificultad es una sorpresa!"
    
    validate_completion "random"
}

# Bucle principal
while true; do
    show_main_menu
    read -p "Elige una opción (1-8): " choice
    
    case $choice in
        1) generate_easy_challenge ;;
        2) generate_medium_challenge ;;
        3) generate_hard_challenge ;;
        4) generate_extreme_challenge ;;
        5) random_challenge ;;
        6) competition_mode ;;
        7) show_statistics ;;
        8) 
            echo -e "${GREEN}🎉 ¡Gracias por usar el Generador de Desafíos!${NC}"
            echo "🚀 ¡Sigue practicando y conviértete en un maestro DevOps!"
            exit 0 
            ;;
        *) echo -e "${RED}❌ Opción no válida. Intenta de nuevo.${NC}" ;;
    esac
    
    echo ""
    echo "Presiona ENTER para continuar..."
    read
    clear
done
