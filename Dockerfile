FROM node:16-alpine AS builder
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm ci
COPY ./ /app/
RUN npm run build \
    && npm prune --production
CMD ["npm", "run", "start:prod", "--host", "0.0.0.0"]

FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
CMD ["node", "dist/main.js", "--host", "0.0.0.0"]