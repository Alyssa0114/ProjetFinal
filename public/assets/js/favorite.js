// Affichage des données sur la page favoris

// Imports
import * as local from "./localStorage.js";

// const $div = document.querySelectorAll('.favorite');
const favoriteList = local.getData("favorite");

// Recherche des produits des annonces dans les favoris et affichage sur la page des favoris
favoriteList.forEach((animal) => {
  document.querySelector(".favorite").insertAdjacentHTML(
    "beforeend",
    `
        <article class="animals-article">
            <div class="content-animals">
                <img class="animals-img-container" src='${animal.file}' alt="${animal.animal_name}"/>
            </div>
            <div class="content-animals">
                <h3>${animal.animal_name}</h3>
            </div>
            <div class="content-animals">
                <strong>Sexe: ${animal.sex}</strong>
            </div>
        </article>
    `
  );
});

/* <button data-id ="${animal.id}" class="removefavorite submit"><i class="trash fas fa-trash-alt fa-2x"></i></button> */
