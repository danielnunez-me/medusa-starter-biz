FROM node:20-alpine

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml* ./

# Usar --ignore-scripts evita que pnpm v10 se detenga por ERR_PNPM_IGNORED_BUILDS
RUN pnpm install --ignore-scripts

COPY . .

# Compilar el proyecto
RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]