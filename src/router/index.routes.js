import { Router } from "express";
import teas_routes from "./routes/teas.routes.js";
import categories_routes from "./routes/categories.routes.js";
import packagings_routes from "./routes/packagings.routes.js";
import users_routes from "./routes/users.routes.js";
import cart_routes from "./routes/cart.routes.js";

const router = Router();

router.use("/tea", teas_routes);
router.use("/category", categories_routes);
router.use("/packaging", packagings_routes);
router.use("/user", users_routes);
router.use("/cart", cart_routes);

export default router;
