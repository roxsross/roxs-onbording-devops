#!/bin/bash

# 🚀 Demo Script - Muestra todas las funcionalidades divertidas
# =============================================================

clear

echo "🎉 ¡BIENVENIDO AL DEMO COMPLETO DEL ONBOARDING DEVOPS!"
echo "======================================================"
echo ""
echo "🎯 Este script te mostrará todas las funcionalidades geniales"
echo "   que hemos agregado para hacer el aprendizaje súper divertido!"
echo ""

# Colores para hacer más atractivo
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Función para pausar con estilo
pause_with_style() {
    echo ""
    echo -e "${CYAN}👆 Presiona ENTER para continuar...${NC}"
    read
    echo ""
}

# Función para mostrar banners
show_banner() {
    echo -e "${PURPLE}╔════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${NC}  $1  ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚════════════════════════════════════════╝${NC}"
    echo ""
}

# Demo 1: Generador de nombres épicos
demo_epic_names() {
    show_banner "🎲 GENERADOR DE NOMBRES ÉPICOS"
    
    echo "¿Cansado de nombres aburridos para tus contenedores?"
    echo "¡Nuestro generador crea nombres épicos automáticamente!"
    echo ""
    echo "Ejemplo de nombres generados:"
    
    ADJECTIVES=("Mighty" "Cosmic" "Legendary" "Epic" "Quantum" "Turbo")
    NOUNS=("Falcon" "Dragon" "Phoenix" "Kraken" "Titan" "Vortex")
    
    for i in {1..3}; do
        RANDOM_ADJ=${ADJECTIVES[$RANDOM % ${#ADJECTIVES[@]}]}
        RANDOM_NOUN=${NOUNS[$RANDOM % ${#NOUNS[@]}]}
        echo "  🚀 $RANDOM_ADJ-$RANDOM_NOUN"
    done
    
    pause_with_style
}

# Demo 2: Sistema de logros
demo_achievements() {
    show_banner "🏆 SISTEMA DE LOGROS Y BADGES"
    
    echo "¡Convierte el aprendizaje en un juego!"
    echo "Los estudiantes pueden desbloquear logros como:"
    echo ""
    echo "🥇 Primer Despliegue - Despliega tu primer contenedor"
    echo "🏗️ Constructor Experto - Construye tu primera imagen"
    echo "🌐 Web Master - Sitio web funcionando perfectamente"
    echo "🐳 Docker Ninja - Maneja múltiples contenedores"
    echo "⚡ Speedrunner - Despliega en menos de 60 segundos"
    echo "🕵️ Detective DevOps - Resuelve problemas como un pro"
    
    echo ""
    echo "📊 Cada logro otorga puntos DevOps para ranking!"
    
    pause_with_style
}

# Demo 3: Minijuegos
demo_minigames() {
    show_banner "🎮 MINIJUEGOS EDUCATIVOS"
    
    echo "¡Aprende jugando con nuestros minijuegos!"
    echo ""
    echo "🎯 Adivina el Puerto - Relaciona servicios con puertos"
    echo "🐳 Docker Memory Game - Memoriza comandos Docker"
    echo "🕵️ Container Detective - Resuelve misterios técnicos"
    echo "⚡ Speed Command Challenge - Comandos contra reloj"
    echo "🎲 DevOps Trivia - Preguntas y respuestas técnicas"
    echo "🏗️ Build Race - Competencia de construcción"
    
    echo ""
    echo "Ejemplo de pregunta del Trivia:"
    echo "¿Qué significa CI/CD?"
    echo "a) Continuous Integration/Continuous Deployment"
    echo "b) Code Integration/Code Deployment"
    echo "c) Computer Integration/Computer Deployment"
    echo ""
    echo -e "${GREEN}¡La respuesta correcta es A! 🎉${NC}"
    
    pause_with_style
}

# Demo 4: Desafíos por niveles
demo_challenges() {
    show_banner "🎯 GENERADOR DE DESAFÍOS"
    
    echo "Sistema de desafíos escalables por dificultad:"
    echo ""
    echo -e "${GREEN}🟢 FÁCIL${NC} - Para principiantes:"
    echo "   • Construye una imagen Docker con tu nombre"
    echo "   • Lista todas las imágenes disponibles"
    echo ""
    echo -e "${YELLOW}🟡 MEDIO${NC} - Para usuarios intermedios:"
    echo "   • Crea un Dockerfile multietapa"
    echo "   • Configura variables de entorno personalizadas"
    echo ""
    echo -e "${RED}🔴 DIFÍCIL${NC} - Para usuarios avanzados:"
    echo "   • Implementa un docker-compose complejo"
    echo "   • Configura un proxy reverso con nginx"
    echo ""
    echo -e "${PURPLE}💀 EXTREMO${NC} - Para expertos:"
    echo "   • Despliega monitoreo con Prometheus"
    echo "   • Implementa CI/CD completo"
    
    pause_with_style
}

# Demo 5: Easter Eggs
demo_easter_eggs() {
    show_banner "🎪 EASTER EGGS Y SORPRESAS"
    
    echo "¡Hemos escondido muchas sorpresas divertidas!"
    echo ""
    echo "🕵️ Comando Ninja Secreto:"
    echo "   docker run --rm -it nginx-bootstrap bash -c \"echo 'Eres un/a DevOps Ninja 🥷' | figlet\""
    echo ""
    echo "🎭 Modo Matrix:"
    echo "   Activa efectos visuales épicos en tu terminal"
    echo ""
    echo "🎨 Generador de Certificados:"
    echo "   Crea certificados personalizados de logros"
    echo ""
    echo "🌈 Modo Psicodélico:"
    echo "   Transforma tu sitio web con efectos de colores"
    echo ""
    echo "⏱️ Cronómetro DevOps:"
    echo "   Compite contra el tiempo en despliegues"
    
    pause_with_style
}

# Demo 6: Modo Competitivo
demo_competition() {
    show_banner "🏆 MODO COMPETENCIA"
    
    echo "¡Perfecto para workshops y bootcamps!"
    echo ""
    echo "🎮 Características del modo competencia:"
    echo "  • Cronómetro automático"
    echo "  • Múltiples desafíos secuenciales"
    echo "  • Ranking de velocidad"
    echo "  • Badges especiales para ganadores"
    echo ""
    echo "📊 Estadísticas automáticas:"
    echo "  • Tiempo promedio por desafío"
    echo "  • Récords personales"
    echo "  • Progreso de aprendizaje"
    echo ""
    echo "👥 Ideal para equipos y entrenamientos grupales"
    
    pause_with_style
}

# Demo 7: Personalización extrema
demo_customization() {
    show_banner "🎨 PERSONALIZACIÓN EXTREMA"
    
    echo "¡Los estudiantes pueden personalizar todo!"
    echo ""
    echo "🌈 Temas visuales dinámicos:"
    echo "  • Modo oscuro/claro automático"
    echo "  • Efectos de colores psicodélicos"
    echo "  • Animaciones CSS personalizadas"
    echo ""
    echo "🎵 Elementos multimedia:"
    echo "  • Música de fondo (opcional)"
    echo "  • Efectos de sonido para logros"
    echo "  • Notificaciones visuales"
    echo ""
    echo "🏷️ Contenido personalizable:"
    echo "  • Nombres épicos para contenedores"
    echo "  • Mensajes de logros personalizados"
    echo "  • ASCII art con nombres propios"
    
    pause_with_style
}

# Demo 8: Funcionalidades educativas
demo_educational() {
    show_banner "📚 FUNCIONALIDADES EDUCATIVAS"
    
    echo "Diseñado para maximizar el aprendizaje:"
    echo ""
    echo "🎯 Pistas inteligentes:"
    echo "  • Ayudas contextuales para cada desafío"
    echo "  • Explicaciones paso a paso"
    echo "  • Comandos de ejemplo"
    echo ""
    echo "🔍 Modo detective:"
    echo "  • Enseña troubleshooting real"
    echo "  • Análisis de logs interactivo"
    echo "  • Resolución de problemas guiada"
    echo ""
    echo "📊 Progreso visible:"
    echo "  • Seguimiento de habilidades desarrolladas"
    echo "  • Métricas de progreso claras"
    echo "  • Recomendaciones de próximos pasos"
    
    pause_with_style
}

# Demo final
demo_summary() {
    show_banner "🎉 RESUMEN DE FUNCIONALIDADES"
    
    echo "¡Tu onboarding DevOps ahora incluye:"
    echo ""
    echo "✅ Tutorial interactivo paso a paso"
    echo "✅ Sistema de logros y badges"
    echo "✅ 6 minijuegos educativos diferentes"
    echo "✅ Generador de desafíos por niveles"
    echo "✅ Modo competencia para grupos"
    echo "✅ Easter eggs y sorpresas ocultas"
    echo "✅ Personalización extrema"
    echo "✅ Herramientas de seguimiento"
    echo "✅ Scripts automatizados inteligentes"
    echo "✅ Experiencia gamificada completa"
    echo ""
    echo -e "${GREEN}🚀 ¡Perfecto para Cloud Shell y aprendizaje divertido!${NC}"
    echo ""
    echo "📱 Próximos pasos recomendados:"
    echo "  1. Sube el proyecto a GitHub"
    echo "  2. Agrega el botón 'Open in Cloud Shell'"
    echo "  3. Comparte con tu comunidad"
    echo "  4. ¡Disfruta viendo cómo aprenden divirtiéndose!"
}

# Ejecutar todas las demos
demo_epic_names
demo_achievements
demo_minigames
demo_challenges
demo_easter_eggs
demo_competition
demo_customization
demo_educational
demo_summary

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}  🎉 ¡DEMO COMPLETO! Tu onboarding está listo para  ${CYAN}║${NC}"
echo -e "${CYAN}║${NC}     impresionar y enseñar de manera divertida! 🚀    ${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "¿Quieres probar alguna funcionalidad específica?"
echo "Ejecuta cualquiera de estos scripts:"
echo "  • bash fun-commands.sh"
echo "  • bash games.sh"
echo "  • bash challenge-generator.sh"
echo ""
