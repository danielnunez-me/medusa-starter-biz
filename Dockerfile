FROM node:20-alpine

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

# COPIAR .npmrc JUNTO A LOS PACKAGE.JSON
COPY package.json pnpm-lock.yaml* .npmrc* ./

# Instalar dependencias usando la configuración del .npmrc
RUN pnpm install --no-frozen-lockfile --config.only-built-dependencies[]=@medusajs/telemetry --config.only-built-dependencies[]=@medusajs/dashboard --config.only-built-dependencies[]=@swc/core --config.only-built-dependencies[]=esbuild --config.only-built-dependencies[]=msgpackr-extract --config.only-built-dependencies[]=protobufjs

COPY . .

# Compilar el proyecto
RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]