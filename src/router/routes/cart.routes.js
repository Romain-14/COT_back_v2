import { Router } from 'express';

import {one} from '../../controllers/cart.js'

const router = Router();

router.get("/:id", one);


export default router;