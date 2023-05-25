const success = (msg, result = null) => {
    // return {
    //     msg: msg , //-> bien récupérer 
    //     datas: datas ,//-> [{id: 1, name: "télé"}]
    // }
    return { msg, result } // syntaxe objet ES6 (destructuring)
}
const error = (msg) => {
    return { msg };
}

export {success, error}