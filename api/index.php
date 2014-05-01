<?php

require '../vendor/autoload.php';
require '../inc/DbInterface.php';
require '../inc/DropboxDb.php';

$db = new DropboxDb();
echo '<pre>';
var_dump($db->getBeers());
echo '</pre>';