import 'dart:math';

var listImages = [
  'images/001-dog.png',
  'images/002-bird.png',
  'images/003-cat.png',
  'images/004-bee.png',
  'images/005-fish.png',
  'images/006-chicken.png',
  'images/007-animal.png',
  'images/008-animal-1.png',
  'images/009-camel.png',
  'images/010-animal-2.png',
  'images/011-cow.png',
  'images/012-halloween.png',
  'images/013-duck.png',
  'images/014-snake.png',
  'images/015-turkey.png',
  'images/016-frog.png',
];
var back = "images/018-back.png";
var check = "images/017-checked.png";
bool flip = false;
int previousIndex = 0;
int index = 0;
int score = 0;

var easy = List.filled(8, false);
var easyLocation = [0, 1, 2, 3, 0, 1, 2, 3];
var easyAnimals = [0, 0, 0, 0];
void getEasyImage() {
  var randomAnimals = [];
  Random random = new Random();
  while (randomAnimals.length < 4) {
    int randomNum = random.nextInt(16);
    if (!randomAnimals.contains(randomNum)) {
      randomAnimals.add(randomNum);
    }
  }
  for (int i = 0; i < 4; i++) {
    easyAnimals[i] = randomAnimals[i];
  }
  easyLocation.shuffle();
  listImages.shuffle();
}

var medium = List.filled(12, false);
var mediumLocation = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5];
var mediumAnimals = [0, 0, 0, 0, 0, 0];
void getMediumImage() {
  var randomAnimals = [];
  Random random = new Random();
  while (randomAnimals.length < 6) {
    int randomNum = random.nextInt(16);
    if (!randomAnimals.contains(randomNum)) {
      randomAnimals.add(randomNum);
    }
  }
  for (int i = 0; i < 6; i++) {
    mediumAnimals[i] = randomAnimals[i];
  }
  mediumLocation.shuffle();
  listImages.shuffle();
}

var hard = List.filled(24, false);
var hardLocation = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11
];
var hardAnimals = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
void getHardImage() {
  var randomAnimals = [];
  Random random = new Random();
  while (randomAnimals.length < 12) {
    int randomNum = random.nextInt(16);
    if (!randomAnimals.contains(randomNum)) {
      randomAnimals.add(randomNum);
    }
  }
  for (int i = 0; i < 12; i++) {
    hardAnimals[i] = randomAnimals[i];
  }
  hardLocation.shuffle();
  listImages.shuffle();
}

var ezImage = List.filled(8, back);
var mdImage = List.filled(12, back);
var hdImage = List.filled(24, back);
