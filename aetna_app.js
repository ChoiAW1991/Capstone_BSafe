onst express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Aetna Application Up and Running!!!'))
app.listen(3000, () => console.log('Server ready'))
~                                                           
