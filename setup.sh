#!/bin/bash

mkdir -p ma-boutique/backend
mkdir -p ma-boutique/frontend

# frontend/index.html
cat > ma-boutique/frontend/index.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Ma Boutique</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <header>
    <img src="https://img.freepik.com/vecteurs-libre/collection-logos-e-commerce-degrades_23-2148942893.jpg" alt="Logo" class="logo" />
    <h1>Bienvenue sur Ma Boutique</h1>
  </header>

  <main>
    <section id="products">
      <h2>Nos Produits</h2>
      <div class="product"><h3>Chaussures</h3><button>Commander</button></div>
      <div class="product"><h3>Téléphones</h3><button>Commander</button></div>
      <div class="product"><h3>Ordinateurs</h3><button>Commander</button></div>
      <div class="product"><h3>Habits</h3><button>Commander</button></div>
    </section>

    <section id="contact">
      <h2>Contactez-nous</h2>
      <p>📞 772205191</p>
      <p>📧 diatto67@gmail.com</p>
    </section>
  </main>

  <footer>
    <p>&copy; 2025 Ma Boutique</p>
  </footer>
</body>
</html>
EOF

# frontend/style.css
cat > ma-boutique/frontend/style.css << 'EOF'
body {
  font-family: Arial, sans-serif;
  background-color: #007BFF;
  color: white;
  margin: 0;
  padding: 0;
  text-align: center;
}

header {
  padding: 20px;
}

.logo {
  width: 120px;
  border-radius: 10px;
}

main {
  padding: 20px;
}

.product {
  background-color: rgba(255, 255, 255, 0.15);
  margin: 10px auto;
  padding: 15px;
  width: 280px;
  border-radius: 8px;
}

button {
  padding: 10px 15px;
  background: white;
  color: #007BFF;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
}

button:hover {
  background: #e6e6e6;
}

footer {
  margin-top: 20px;
  padding: 10px;
  background-color: #0056b3;
}
EOF

# backend/app.js
cat > ma-boutique/backend/app.js << 'EOF'
const express = require('express');
const path = require('path');
const app = express();

const port = process.env.PORT || 5003;

app.use(express.static(path.join(__dirname, '../frontend')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/index.html'));
});

app.listen(port, () => {
  console.log(`✅ Serveur lancé sur le port ${port}`);
});
EOF

# Dockerfile
cat > ma-boutique/Dockerfile << 'EOF'
FROM node:18

WORKDIR /app

COPY backend/ ./backend/
COPY frontend/ ./frontend/

RUN npm install express

CMD ["node", "backend/app.js"]
EOF

# docker-compose.yml
cat > ma-boutique/docker-compose.yml << 'EOF'
version: '3'

services:
  boutique:
    build: .
    ports:
      - "5003:5003"
EOF

echo "✅ Projet ma-boutique créé avec succès dans le dossier ma-boutique"
