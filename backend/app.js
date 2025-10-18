const express = require('express');
const path = require('path');
const app = express();

const port = process.env.PORT || 5003;

// Sert les fichiers statiques du dossier frontend
app.use(express.static(path.join(__dirname, '../frontend')));

// Route principale
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/index.html'));
});

// Démarrage du serveur
app.listen(port, () => {
  console.log(`✅ Serveur lancé sur http://localhost:${port}`);
});

