import express from "express";
import "dotenv/config";
import cors from "cors";

import { PORT, HOST } from "./config/const.js";
import router from "./router/index.routes.js";

const app = express();

app.use(cors())
    .use(express.static("public"))
    .use(express.json())
    .use(express.urlencoded({ extended: true }))
    .use(router);

// algo' permettant de mesurer  les temps de réponse
// const getDurationInMilliseconds = (start) => {
//     const NS_PER_SEC = 1e9
//     const NS_TO_MS = 1e6
//     const diff = process.hrtime(start)

//     return (diff[0] * NS_PER_SEC + diff[1]) / NS_TO_MS
// }

// app.use((req, res, next) => {
//     console.log(`${req.method} ${req.originalUrl} [STARTED]`)
//     const start = process.hrtime()

//     res.on('finish', () => {
//         const durationInMilliseconds = getDurationInMilliseconds (start)
//         console.log(`${req.method} ${req.originalUrl} [FINISHED] ${durationInMilliseconds.toLocaleString()} ms`)
//     })

//     res.on('close', () => {
//         const durationInMilliseconds = getDurationInMilliseconds (start)
//         console.log(`${req.method} ${req.originalUrl} [CLOSED] ${durationInMilliseconds.toLocaleString()} ms`)
//     })

//     next()
// })


app.listen(PORT, () => console.log(`Listening at http://localhost:${PORT}`));
