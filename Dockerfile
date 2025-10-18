# Utiliser l'image officielle de Node.js
FROM node:18

# Définir le dossier de travail dans le conteneur
WORKDIR /app

# Copier les fichiers backend et frontend dans le conteneur
COPY backend/ ./backend/
COPY frontend/ ./frontend/

# Installer Express (en local dans le conteneur)
RUN npm install express

# Démarrer l'application
CMD ["node", "backend/app.js"]

