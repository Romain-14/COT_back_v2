import { success } from "../helpers/index.js";
import Query from "../model/query.js";

// // requête sql pour pour récupérer toutes les information d'un produit utile pour la gestion des stock
// SELECT * 
// FROM tea
// JOIN tea_packaging ON tea_packaging.tea_id = tea.id
// JOIN packaging ON tea_packaging.packaging_id = packaging.id
// WHERE tea.id = ? 

// // pour avoir les infos : prix, quantité en stock et le conditionnement d'un produit
// SELECT quantity_in_stock, price, weight 
// FROM tea_packaging
// JOIN packaging ON tea_packaging.packaging_id = packaging.id
// WHERE tea_packaging.tea_id = 1

export const all = async (req, res) => {
    try {
        // const query = "SELECT * FROM tea";
        const query = "SELECT tea.id, tea.category_id, mainTitle, description, subTitle, url_img, ref, MIN(price) as price FROM tea JOIN tea_packaging ON tea_packaging.tea_id = tea.id JOIN packaging ON tea_packaging.packaging_id = packaging.id GROUP BY mainTitle";
        const [teas] = await Query.find(query);
        if(teas.length){
            const msg = "Récupération de tous les thés";
            res.status(200).json(success(msg, teas));
        } else {
            const msg = "Pas encore de thés en BDD";
            res.status(200).json(success(msg));
        }
    } catch (err) {
        throw Error(err);
    }
}

// pour la page détail
export const one = async (req, res) => {
    try {
        const queryTea = "SELECT * FROM tea WHERE id = ?";
        const queryInfoTea = "SELECT packaging.id as idPackaging, ref,quantity_in_stock, price, weight FROM tea_packaging JOIN packaging ON tea_packaging.packaging_id = packaging.id WHERE tea_packaging.tea_id = ?";

        const tea      = await Query.findByValue(queryTea, req.params.val);
        const teaInfo  = await Query.findByValue(queryInfoTea, req.params.val);
        
        const finalTea = {...tea[0], teaInfo}; // regroupe les données dans un même objet

        if(!tea){
            const msg = "Ce thé n'existe pas en BDD";
            res.status(200).json(success(msg));
        } else {
            const msg = "Récupération de " + finalTea.main_title;
            res.status(200).json(success(msg, finalTea));
        }
    } catch (err) {
        throw Error(err);
    }
}

export const favorite = async( req, res) => {

    try {
        const query1 = "SELECT id, mainTitle, description, url_img FROM `tea` WHERE isFavorite = 1";
        const [[tea]] = await Query.find(query1);
        
        const query2 = "SELECT min(price) as price FROM tea_packaging WHERE tea_id = ? ";
        const [price] = await Query.findByValue(query2, tea.id);
        const teaInfo = {...tea, ...price}
        if(!tea){
            const msg = "Ce thé n'existe pas en BDD";
            res.status(200).json(success(msg));
        } else {
            const msg = "Récupération de " + teaInfo.main_title;
            res.status(200).json(success(msg, teaInfo));
        }
    } catch (err) {
        throw Error(err);
    }
}

export const lastInserted = async (req, res ) => {    
    try {
        const query1 = "SELECT id, mainTitle, description, url_img FROM `tea` ORDER BY id DESC LIMIT 1";
        const [[tea]] = await Query.find(query1);
        const query2 = "SELECT min(price) as price FROM tea_packaging WHERE tea_id = ? ";
        const [price] = await Query.findByValue(query2, tea.id);
        const teaInfo = {...tea, ...price}
        
        const msg = "Récupération du thé";
        res.status(200).json(success(msg, teaInfo));
    } catch (err) {
        throw Error(err);
    }
}

export const add_tea = async (req,res) => {
    try {
        const query = "INSERT INTO tea (main_title, secondary_title, main_description, secondary_description, image_name, image_alt, avg_vote, vote_count, ref, created_at, our_favorite, category_id) VALUES (?, ?, ?, ?, ?, ?, '0', '0', ?, NOW(), '0', ?)";
        const [result] = await Query.write(query, req.body);

        if(result.affectedRows){
            const msg = "Thé ajoutée.";
            res.json(success(msg));
        } else throw Error("Thé non ajoutée, probable erreur de syntaxe dans l'objet.");

    } catch (err) {
        throw Error(err);
    }
}

export const add_TeaPackaging = async (req,res) => {
    try {
        const query = "INSERT INTO tea_packaging (quantity_in_stock, price, tea_id, packaging_id) VALUES (?, ?, ?, ?)";
        const [result] = await Query.write(query, req.body);
        
        if(result.affectedRows){
            const msg = "Information du thé : packaging et prix ajoutées.";
            res.json(success(msg));

        } else throw Error("packaging et prix non ajoutées, probable erreur de syntaxe dans l'objet.");

    } catch (err) {
        throw Error(err);
    }
}


export const update = async (req,res) => {
    try {

        const query = "UPDATE tea SET title = ?, description = ?, image_name = ?, image_alt = ? WHERE id = ?";
        const [result] = await Query.write(query, req.body);

        if(result.affectedRows){
            const msg = "Catégorie modifiée.";
            res.json(success(msg));

        } else throw Error("Catégorie non modifiée, probable erreur de syntaxe dans l'objet.");
        
    } catch (err) {
        throw Error(err);
    }
}

export const remove = async (req,res) => {
    try {
        const query = "DELETE FROM category WHERE id = ?";
        const result = await Query.remove(query, req.body.id);
        
        if(result.affectedRows){
            const msg = "Catégorie supprimée.";
            res.json(success(msg));

        } else throw Error("Catégorie non supprimée, probable erreur de syntaxe dans l'objet.");

    } catch (err) {
        throw Error(err);
    }
}