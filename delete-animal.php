<?php

//Controller delete animal

//Models 
require_once 'services/Session.php';
require_once 'models/Model.php';
require_once 'models/Animal.php';


//Démarrage de la session
Session::start();

//On instancie notre classe
$id = $_GET['id'];
$animalModel = new Animal;

//Execution de la requete
$animalModel->delete($id);

header("Location: dashboard.php");
exit;
