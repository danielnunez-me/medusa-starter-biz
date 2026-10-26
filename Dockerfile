FROM node:20-alpine

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

# Desactivar el bloqueo de scripts de pnpm 10
ENV PNPM_CONFIG_IGNORE_BUILDS=true

COPY package.json pnpm-lock.yaml* .npmrc* ./

RUN pnpm install --no-frozen-lockfile

COPY . .

RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]