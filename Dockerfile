FROM node:20-alpine

WORKDIR /app

# Instalar versión estable de pnpm compatible con Medusa v2
RUN npm install -g pnpm@9

# Copiar manifiestos y archivos de configuración antes de la instalación
COPY package.json pnpm-lock.yaml* .npmrc* ./

# Instalar dependencias
RUN pnpm install --no-frozen-lockfile

# Copiar el resto del código fuente
COPY . .

# Compilar la aplicación y el Admin Dashboard
RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]