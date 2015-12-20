<?php
echo "working";
class A {
  static private $a;

  static public function init() {
    self::$a = 123;
  }
}

A::init();
