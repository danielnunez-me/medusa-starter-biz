FROM node:20-alpine

WORKDIR /app

# Instalar pnpm y copiar dependencias
RUN npm install -g pnpm

# Ignorar
RUN pnpm install --config.ignore-scripts=false

COPY package.json pnpm-lock.yaml* ./
RUN pnpm install

COPY . .

# Compilar proyecto de Medusa v2
RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]