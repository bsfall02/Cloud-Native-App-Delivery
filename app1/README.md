# TechLogix Inventory

Application de gestion d'inventaire informatique pour formation DevOps.

##  Démarrage rapide

```bash
# Installation
npm install

# Lancement
npm start
```

## 🔧 Variables d'environnement

```bash
PORT=3000
NODE_ENV=production
```

## 📡 Endpoints

- `GET /` - Interface web principale
- `GET /healthz` - Liveness probe (Kubernetes)
- `GET /ready` - Readiness probe (Kubernetes)

##  Docker

```bash
# Build
docker build -t techlogix-inventory .

# Run
docker run -p 3000:3000 techlogix-inventory
```

## Kubernetes

L'application affiche l'hostname et l'IP du conteneur pour démontrer le load balancing.
