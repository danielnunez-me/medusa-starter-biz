FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml* .npmrc* ./

# Pasar la variable de entorno directamente en la instrucción RUN:
RUN PNPM_CONFIG_IGNORE_BUILDS=true pnpm install --no-frozen-lockfile

COPY . .

RUN pnpm build

EXPOSE 9000

CMD ["pnpm", "start"]