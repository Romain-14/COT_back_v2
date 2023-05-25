import { Router } from 'express';

import {all, one, lastInserted, favorite, add_tea, add_TeaPackaging, update, remove} from '../../controllers/tea.js'

const router = Router();

router.get("/", all);
router.get("/lastInserted", lastInserted);
router.get("/favorite", favorite);
router.get("/:val", one);

router.post("/add", add_tea);
router.post("/addPackaging", add_TeaPackaging);

router.put("/", update);
router.delete("/", remove);


export default router;