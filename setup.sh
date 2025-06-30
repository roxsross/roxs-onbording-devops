#!/bin/bash

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Función para imprimir mensajes con colores
print_status() {
    echo -e "${BLUE}🔄 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${PURPLE}ℹ️  $1${NC}"
}

# Banner inicial
echo -e "${BLUE}"
echo "� =============================================="
echo "    RETO DEVOPS DÍA 1 - ROXSROSS CHALLENGE    "
echo "===============================================${NC}"
echo ""

# Verificar si Docker está instalado y corriendo
print_status "Verificando Docker..."
if ! command -v docker &> /dev/null; then
    print_error "Docker no está instalado. Este script requiere Docker."
    exit 1
fi

if ! docker info &> /dev/null; then
    print_error "Docker no está corriendo. Iniciá el servicio Docker."
    exit 1
fi

print_success "Docker está corriendo correctamente"

# Limpiar contenedores anteriores si existen
print_status "Limpiando contenedores anteriores..."
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap) 2>/dev/null || true
docker rm $(docker ps -aq --filter ancestor=nginx-bootstrap) 2>/dev/null || true

# Preparar directorio del sitio
print_status "Preparando entorno del sitio web..."
if [ -d "site" ]; then
    rm -rf site
fi

mkdir -p site && cd site

# Descargar template del sitio
print_status "Descargando template del sitio web..."
if command -v wget &> /dev/null; then
    wget -q https://github.com/roxsross/devops-static-web/raw/portafolio-web/portafolio-web.zip
elif command -v curl &> /dev/null; then
    curl -sL https://github.com/roxsross/devops-static-web/raw/portafolio-web/portafolio-web.zip -o portafolio-web.zip
else
    print_error "No se encontró wget ni curl. Instalá alguno de estos comandos."
    exit 1
fi

if [ ! -f "portafolio-web.zip" ]; then
    print_error "No se pudo descargar el archivo del sitio web."
    exit 1
fi

print_status "Extrayendo archivos del sitio..."
unzip -q portafolio-web.zip
if [ -d "portafolio-web" ]; then
    mv portafolio-web/* .
    rm -rf portafolio-web
fi
rm portafolio-web.zip
cd ..

print_success "Sitio web preparado correctamente"

# Construir imagen Docker
print_status "Construyendo imagen Docker..."
docker build -t nginx-bootstrap . --quiet

if [ $? -eq 0 ]; then
    print_success "Imagen Docker construida exitosamente"
else
    print_error "Error al construir la imagen Docker"
    exit 1
fi

# Ejecutar contenedor
print_status "Iniciando contenedor NGINX..."
container_id=$(docker run -d -p 8080:80 nginx-bootstrap)

if [ $? -eq 0 ]; then
    print_success "Contenedor iniciado correctamente"
    print_info "ID del contenedor: ${container_id:0:12}"
else
    print_error "Error al iniciar el contenedor"
    exit 1
fi

# Esperar a que el contenedor esté listo
print_status "Esperando que el servidor esté listo..."
sleep 3

# Verificar que el contenedor esté corriendo
if docker ps --filter ancestor=nginx-bootstrap --format "table {{.ID}}\t{{.Status}}" | grep -q "Up"; then
    print_success "¡El servidor está corriendo correctamente!"
else
    print_error "El contenedor no está corriendo correctamente"
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 ================================================"
echo "          ¡DESPLIEGUE COMPLETADO! "
echo "================================================${NC}"
echo ""
echo -e "${YELLOW}🌐 Abrí la vista previa del puerto 8080 en Google Cloud Shell"
echo -e "   (Hace clic en el ícono 🔳↗️  en la parte superior derecha)${NC}"
echo ""
echo -e "${BLUE}📋 Comandos útiles:${NC}"
echo ""
echo "🔍 Ver contenedor activo:"
echo "   docker ps --filter ancestor=nginx-bootstrap"
echo ""
echo "📋 Ver logs del contenedor:"
echo "   docker logs \$(docker ps -q --filter ancestor=nginx-bootstrap)"
echo ""
echo "🛑 Detener el contenedor:"
echo "   docker stop \$(docker ps -q --filter ancestor=nginx-bootstrap)"
echo ""
echo -e "${PURPLE}🎓 ¡Felicitaciones! Completaste tu primer desafío DevOps${NC}"
echo -e "${PURPLE}   Seguí con el próximo reto en: https://github.com/roxsross${NC}"



