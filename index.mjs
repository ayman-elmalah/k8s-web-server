import express from 'express';
import os from 'os';

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    const message = `Hello World, I'm running on ${os.hostname()} : Version 1.2.1`;
    res.send(message);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
