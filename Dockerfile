FROM node:20-alpine

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

# COPIAR .npmrc JUNTO A LOS PACKAGE.JSON
COPY package.json pnpm-lock.yaml* .npmrc* ./

# Instalar dependencias usando la configuración del .npmrc
RUN pnpm install --no-frozen-lockfile

COPY . .

# Compilar el proyecto
RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]