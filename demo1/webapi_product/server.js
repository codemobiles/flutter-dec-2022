const express = require('express')
const cors = require('cors')
const app = express()

app.use('/images', express.static('images'))
app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(require('./controller'))

const port = process.env.PORT || 1150
const env = process.env.ENV || 'development'
app.listen(port, () => {
    console.log(`App listening on port ${port}`)
    console.log(`App listening on env ${env}`)
    console.log(`Press Ctrl+C to quit.`)
})