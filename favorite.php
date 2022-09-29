<?php

/**
 * FAVORITE CONTROLLER
 * 
 **/

// Models
require_once 'services/utils.php';
require_once 'services/Session.php';
require_once "models/Animal.php";

//Démarrage de la session 
Session::start();

// Titre et chemin de la page 
$pageTitle = 'Favoris';
$pagePath = 'favorite';

$animalM = new Animal;

$animals = $animalM->getAllAnimal();

// Vue  
render(__DIR__ . "/views/$pagePath", compact('animals', 'pageTitle'));
