# ─────────────────────────────────────────────────────
# Stage 1 : Installation des dépendances (avec cache)
# ─────────────────────────────────────────────────────
FROM node:20-alpine AS deps

WORKDIR /app

# Copier package.json EN PREMIER → Docker met en cache les dépendances
# Si le code change mais pas package.json, npm install ne tourne pas à nouveau
COPY app/package*.json ./

RUN npm install --omit=dev

# ─────────────────────────────────────────────────────
# Stage 2 : Image finale légère
# ─────────────────────────────────────────────────────
FROM node:20-alpine

WORKDIR /app

# Utilisateur non-root (bonne pratique de sécurité)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copier les dépendances installées depuis le stage 1
COPY --from=deps /app/node_modules ./node_modules

# Copier le code source de l'application
COPY app/ .

# Changer le propriétaire des fichiers
RUN chown -R appuser:appgroup /app

USER appuser

# Port exposé par le serveur Node.js
EXPOSE 3000

# Lancer l'application
CMD ["node", "server.js"]