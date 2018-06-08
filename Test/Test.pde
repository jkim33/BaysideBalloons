Enemy[] hallway;
Map map;
Player player;
Enemy[] concentration;
Enemy enemy;
int mapNum;
int aniState;
String battlePlayerString;
String battleEnemyString;

void setup() {
  size(550, 500);
  mapNum = 0;
  map = new Map(mapNum);
  player = new Player();
  hallway = new Enemy[] {new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman()};
  concentration = hallway;
  enemy = concentration[0];
  aniState = 0;
  battleEnemyString = "";
  battlePlayerString = "";
}

void draw() {
  if (player.Lost) {
    background(255, 0, 0);
  } else if (!player.Fighting) {
    background(0, 0, 0);
    check();
    map.display();
    playerPic();
    getTextOne();
  } else {
    println(player.YourTurn);
    background(0, 0, 0);
    PImage photo = loadImage("battle.png");
    image(photo, 0, 0);
    PImage p = loadImage("player4.png");
    image(p, 100, 150);
    image(enemy.getPhoto(), 300, 150);
    getTextTwo();
    if (player.YourTurn) {
      textSize(28);
      text(battlePlayerString, 150, 310, 100, 100);
      delay(2000);
      battlePlayerString = "";
      if (enemy.HP <= 0) {
        player.Fighting = false;
        enemy.HP = 100;
      }
    } else {
      String battleEnemyString = enemy.attack(player);
      textSize(28);
      text(battleEnemyString, 150, 310, 100, 100);
      delay(2000);
      if (player.HP <= 0) {
        player.Lost = true;
      }
    }
  }
}

void keyPressed() {
  if (!player.Fighting) {
    if (key == CODED) {
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
        char c = 'q';
        if (keyCode == UP) {
          c = 'w';
        }
        if (keyCode == DOWN) {
          c = 's';
        }
        if (keyCode == LEFT) {
          c = 'a';
        }
        if (keyCode == RIGHT) {
          c = 'd';
        }
        if (player.move(c, map, enemy) && aniState == 0) {
          if (keyCode == UP) {
            aniState = 1;
          }
          if (keyCode == DOWN) {
            aniState = 5;
          }
          if (keyCode == LEFT) {
            aniState = 3;
          }
          if (keyCode == RIGHT) {
            aniState = 7;
          }
        }
      }
    }
  } else {
    if (player.YourTurn) {
      if (key == '1') {
        battlePlayerString = player.attack(key, enemy);
      }
    }
  }
}

void check() {
  if (map.tiles[player.y/50 + 1][player.x/50 + 1].getType() == 2) {
    int oldX = player.x;
    int oldY = player.y;
    player.x = map.tiles[oldY/50 + 1][oldX/50 + 1].nextX;
    player.y = map.tiles[oldY/50 + 1][oldX/50 + 1].nextY;
    mapNum = map.tiles[oldY/50 + 1][oldX/50 + 1].getNext();
    map = new Map(mapNum);
  }
}

void playerPic() {
  if (aniState == 1) {
    int m1 = millis();
    player.y = player.y - 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 2;
  } else if (aniState == 2) {
    int m1 = millis();
    player.y = player.y - 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 0;
  } else if (aniState == 3) {
    int m1 = millis();
    player.x = player.x - 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 4;
  } else if (aniState == 4) {
    int m1 = millis();
    player.x = player.x - 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 0;
  } else if (aniState == 5) {
    int m1 = millis();
    player.y = player.y + 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 6;
  } else if (aniState == 6) {
    int m1 = millis();
    player.y = player.y + 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 0;
  } else if (aniState == 7) {
    int m1 = millis();
    player.x = player.x + 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 8;
  } else if (aniState == 8) {
    int m1 = millis();
    player.x = player.x + 25;
    while (millis() - m1 < 150) {
    }
    image(player.PlayerPhoto, player.x, player.y);
    aniState = 0;
  } else {
    image(player.PlayerPhoto, player.x, player.y);
  }
}

void getTextOne() {
  textSize(28);
  text("HP: " + player.HP, 5, 390);
}

void getTextTwo() {
  textSize(22);
  text("HP: " + player.HP, 5, 310);
  text("Energy: " + player.Mana, 5, 330);
  text("1) Attack: 0", 5, 350);
  text("2) Present: 10", 5, 370);
  text("3) All-Nighter: 30", 5, 390);
}

void pause() {
  int m1 = millis();
  while (millis() - m1 < 2000) {
  }
}
