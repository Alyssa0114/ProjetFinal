// Fichier de gestion principale du localStorage

// Imports
import * as local from "./localStorage.js";

// Récupération de la data du localStorage de la key 'favorite'
const favoriteList = local.getData("favorite");

// Fonction de stockage dans le localStorage (event accès à tous les évènements de la fonction click)
function setStorage(events) {
    // Récupération des propriétés du produit de l'annonce
    const animalId = events.target.getAttribute("data-id");
    const animalName = events.target.getAttribute("data-animal_name");
    const animalSex = events.target.getAttribute("data-sex");
    const animalFile = events.target.getAttribute("data-file");

    let itemInStorage = local.checkId(animalId, "favorite");
    // Si la liste de favoris n'est pas vide
    if (favoriteList && itemInStorage) {
        // Si produit de l'annonce déjà présent et qu'il est unique, on bloque son incrémentation (1 produit / annonce)
        favoriteList[itemInStorage] = favoriteList[itemInStorage].qtt += 1;
    } else {
        // On insère la clé et les valeurs
        favoriteList.push(
            local.addAnimal(animalId, animalName, animalSex, animalFile)
        );
    }
    // Mise à jour ou création de la ressource ; doit enregistrer la nouvelle liste en remplacement de l'ancienne
    local.setData("favorite", favoriteList);
}

// Fonction de suppression du produit désiré dans les favoris (remove)
function removeItemFromStorage(event) {
    const animalId = event.target.getAttribute("data-id");
    let itemInStorage = local.checkId(animalId, "favorite");

    if (favoriteList && itemInStorage) {
        // Utiliser findIndex() pour rechercher la valeur dans 'favorite'
        const animal = favoriteList.findIndex((p) => p.id === animalId);
        favoriteList.splice(animal, 1);
        local.setData("favorite", favoriteList);
        location.reload();
    }
}

// Fonction de suppression de tous les favoris (clear)
function clearStorage() {
    localStorage.removeItem("favorite");
    location.reload();
}

// Exports
export { setStorage, clearStorage, removeItemFromStorage };

// NOTE:
// Pour l'incrémentation du même id dans le localStorage, on incrémente avec une fonction fléchée:
//    const product = cartList.find(p => p.id === productId);
//    product.qtt++;
