# Etapa de construcción
FROM node:20.12.0-alpine AS builder
WORKDIR /build
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa de producción
FROM node:20.12.0-alpine
WORKDIR /app

# Copia solo las dependencias de producción
COPY --from=builder /build/package*.json ./
RUN npm install --only=production

# Copia los archivos necesarios del build anterior
COPY --from=builder /build/.next ./.next
COPY --from=builder /build/public ./public
COPY --from=builder /build/next.config.mjs ./next.config.mjs 

# Exponer el puerto 3000
EXPOSE 3000

# Comando para correr la aplicación
CMD ["npm", "start"]
