import Query from "../model/query.js";
import { success } from "../helpers/index.js";

export const one = async (req, res) => {
    try {
        const query = "SELECT * FROM tea JOIN tea_packaging WHERE id = ?";
        const product = await Query.findByValue(query, req.params.id);
        if(product.length){
            const msg = "Récupération de toutes les product";
            res.status(200).json(success(msg, product));
        } else {
            const msg = "Pas encore de product en BDD";
            res.status(200).json(success(msg));
        }
    } catch (err) {
        throw Error(err);
    }
}