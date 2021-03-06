const express = require('express');
const path = require('path');
const app = express();
const PORT = 3000;

const publicDir = path.join(__dirname, '/public');
console.log(__dirname);
app.use(express.static(publicDir));

app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
