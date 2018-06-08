Enemy[] hallway;
Map map;
Player player;
Enemy[] concentration;
Enemy enemy;
int mapNum;
int aniState;
String battleString;
int battleCounter;
int endCounter;

void setup() {
  size(450, 400);
  mapNum = 0;
  map = new Map(mapNum);
  player = new Player();
  hallway = new Enemy[] {new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman(), new Freshman()};
  concentration = hallway;
  enemy = concentration[0];
  aniState = 0;
  battleString = "";
  battleCounter = 0;
  endCounter = 0;
}

void draw() {
  if (player.Lost) {
    background(255, 0, 0);
  } else if (player.End) {
    if (player.HP > 0) {
      if (endCounter < 120) {
        background(0, 0, 0);
        PImage photo = loadImage("battle.png");
        image(photo, 0, 0);
        PImage p = loadImage("player4.png");
        image(p, 100, 150);
        image(enemy.getPhoto(), 300, 150);
        getTextTwo();
        text("You Defeated the Enemy!", 250, 310, 200, 175);
        endCounter++;
      } else {
        player.End = false;
      }
    } else {
      if (endCounter < 120) {
        background(0, 0, 0);
        PImage photo = loadImage("battle.png");
        image(photo, 0, 0);
        PImage p = loadImage("player4.png");
        image(p, 100, 150);
        image(enemy.getPhoto(), 300, 150);
        getTextTwo();
        text("You have been Defeated!", 250, 310, 200, 175);
        endCounter++;
      } else {
        player.End = false;
        player.Lost = true;
      }
    }
  } else if (!player.Fighting) {
    battleString = "";
    battleCounter = 0;
    endCounter = 0;
    background(0, 0, 0);
    check();
    map.display();
    playerPic();
    getTextOne();
  } else {
    background(0, 0, 0);
    PImage photo = loadImage("battle.png");
    image(photo, 0, 0);
    PImage p = loadImage("player4.png");
    image(p, 100, 150);
    image(enemy.getPhoto(), 300, 150);
    if (player.HP <= 0) {
      player.HP = 0;
    }
    getTextTwo();
    if (battleCounter < 120 && battleString != "") {
      battleCounter++;
      text(battleString, 250, 310, 200, 175);
    } else if (player.YourTurn) {
      if (player.HP <= 0) {
        player.HP = 0;
        player.End = true;
      }
      battleString = "";
    } else {
      if (player.HP <= 0) {
        player.HP = 0;
        player.End = true;
      }
      battleString = enemy.attack(player);
      battleCounter = 0;
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
        battleString = player.attack(key, enemy);
        battleCounter = 0;
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
  text("2) Presentation: 5", 5, 370);
  text("3) All-Nighter: 30", 5, 390);
}

void pause() {
  int m1 = millis();
  while (millis() - m1 < 2000) {
  }
}
