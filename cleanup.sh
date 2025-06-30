# ===================================
# Script de limpieza para el proyecto
# ===================================

#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}🧹 Limpiando recursos del proyecto...${NC}"

# Detener y eliminar contenedores
echo -e "${YELLOW}Deteniendo contenedores...${NC}"
docker stop $(docker ps -q --filter ancestor=nginx-bootstrap) 2>/dev/null || true

echo -e "${YELLOW}Eliminando contenedores...${NC}"
docker rm $(docker ps -aq --filter ancestor=nginx-bootstrap) 2>/dev/null || true

# Eliminar imagen
echo -e "${YELLOW}Eliminando imagen Docker...${NC}"
docker rmi nginx-bootstrap 2>/dev/null || true

# Limpiar archivos temporales
echo -e "${YELLOW}Limpiando archivos temporales...${NC}"
rm -rf site/ 2>/dev/null || true

# Mostrar estado final
echo ""
echo -e "${GREEN}✅ Limpieza completada${NC}"
echo ""
echo "📊 Estado actual:"
echo "Contenedores nginx-bootstrap: $(docker ps -aq --filter ancestor=nginx-bootstrap | wc -l)"
echo "Imágenes nginx-bootstrap: $(docker images nginx-bootstrap -q | wc -l)"
echo ""
echo -e "${GREEN}🎉 ¡Listo para ejecutar setup.sh nuevamente!${NC}"
