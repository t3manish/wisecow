const express = require('express');
const { exec } = require('child_process');
const app = express();
const port = 4499;

app.get('/', (req, res) => {
  exec('./wisecow.sh', (error, stdout, stderr) => {
    if (error) {
      res.send(`Error: ${error.message}`);
      return;
    }
    if (stderr) {
      res.send(`Stderr: ${stderr}`);
      return;
    }
    res.send(`<pre>${stdout}</pre>`);
  });
});

app.listen(port, () => {
  console.log(`Wisecow app listening at http://localhost:${port}`);
});
