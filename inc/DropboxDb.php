<?php

class DropboxDb implements DbInterface {
    private $beers;

    public function __construct() {
        $json = file_get_contents('http://dl.dropboxusercontent.com/u/8641739/public_html/fyllevakna/beers.json'); 
        $this->beers = json_decode($json);
    }

    public function getBeer($id) {
        return $id < count($this->beers) ? $this->beers[$id] : null;
    }

    public function getBeers() {
        return $this->beers;
    }
}