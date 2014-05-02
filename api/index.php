<?php

require 'vendor/autoload.php';
require 'lib/DbInterface.php';
require 'lib/DropboxDb.php';

$app = new \Slim\Slim();
$db = new DropboxDb();

function respond($response, $status = 200) {
    $app = \Slim\Slim::getInstance();
    $app->response->setStatus($status);
    $app->response->headers->set('Content-Type', 'application/json');
    echo json_encode($response);
}

$app->get("/beers", function () use ($app, $db) {
    $beers = $db->getBeers();
    respond(200, $beers);
});

$app->run();