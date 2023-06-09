import { Router } from 'express';

import {checkToken, signup, signin} from '../../controllers/user.js';
import { auth } from '../../middlewares/auth.js';


const router = Router();

// router.get("/", all);
router.get("/checkToken", auth, checkToken);
// router.get("/:id", one);

router.post("/signup", signup);
router.post("/signin", signin);

// router.put("/", update);

// router.delete("/", remove);


export default router;