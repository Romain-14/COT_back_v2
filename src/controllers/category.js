import { success } from "../helpers/index.js";
import Query from "../model/query.js";


export const all = async (req, res) => {
    try {
        const query = "SELECT *  FROM category";
        const [categories] = await Query.find(query);

        if(categories.length){
            const msg = "Récupération de toutes les catégories";
            res.status(200).json(success(msg, categories));
        } else {
            const msg = "Pas encore de catégories en BDD";
            res.status(200).json(success(msg));
        }
    } catch (err) {
        throw Error(err);
    }
}

export const one = async (req, res) => {
    try {
        const query = "SELECT * FROM category WHERE id = ?";
        const category   = await Query.findByValue(query, req.params.id);
        
        if(!category){
            const msg = "Cette catégorie n'existe pas en BDD";
            res.status(200).json(success(msg));
        } else {
            const msg = "Récupération de la catégorie" + category.title;
            res.status(200).json(success(msg, category));
        }
    } catch (err) {
        throw Error(err);
    }
}

export const add = async (req,res) => {
    try {
        const query = "INSERT INTO category (title, description, image_name, image_alt) VALUES (?,?,?,?)";
        const result = await Query.write(query, req.body);
        
        const msg = "Catégorie ajoutée.";
        res.json(success(msg, result));
    } catch (err) {
        throw Error(err);
    }
}

export const update = async (req,res) => {
    try {

        const query = "UPDATE category SET title = ?, description = ?, image_name = ?, image_alt = ? WHERE id = ?";
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