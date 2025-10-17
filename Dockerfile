FROM node:18

WORKDIR /app

COPY backend/ ./backend/
COPY frontend/ ./frontend/

RUN npm install express

CMD ["node", "backend/app.js"]
