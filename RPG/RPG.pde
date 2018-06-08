RQueue<Enemy> hallway;
RQueue<Enemy> classroom;
RQueue<Enemy> library;
RQueue<Enemy> cafeteria;
RQueue<Enemy> pool;

Map map;
Player player;
RQueue<Enemy> concentration;
Enemy enemy;
int mapNum;
int aniState;
String battleString;
int battleCounter;
int endCounter;

void setup() {
  size(550, 500);
  mapNum = 11;
  map = new Map(mapNum);
  player = new Player();

  hallway = new RQueue<Enemy>();
  classroom = new RQueue<Enemy>();
  library = new RQueue<Enemy>();
  cafeteria = new RQueue<Enemy>();
  pool = new RQueue<Enemy>();

  concentration = new RQueue<Enemy>();
  setCon();
  updateCon();
  enemy = concentration.dequeue();
  aniState = 0;
  battleString = "";
  battleCounter = 0;
  endCounter = 0;
}

void draw() {
  if (player.Finished == 4) {
    background(0,0,255);
    textSize(28);
    text("Congratulations!",170,150);
    text("You have conquered Stuy!", 100, 180);
    return;
  }
  if (player.Lost) {
    background(255, 0, 0);
    textSize(28);
    text("GAME OVER.", 185, 150);
    text("STUY HAS DEFEATED YOU.",100,180); 
    return;
  } else if (player.End) {
    if (player.HP > 0) {
      if (endCounter < 120) {
        background(0, 0, 0);
        PImage photo = loadImage("battle.png");
        image(photo, 0, 0);
        PImage p = loadImage("player4.png");
        image(p, 150, 200);
        image(enemy.getPhoto(), 350, 200);
        getTextTwo();
        text("You Defeated the Enemy!", 300, 400, 200, 175);
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
        image(enemy.getPhoto(), 350, 200);
        getTextTwo();
        text("You have been Defeated!", 300, 400, 200, 175);
        endCounter++;
      } else {
        player.End = false;
        player.Lost = true;
      }
    }
  } else if (!player.Fighting) {
    setCon();
    if (enemy.HP <= 0) {
      try {
        enemy = concentration.dequeue();
      }
      catch (Exception e) {
        concentration = hallway;
        enemy = concentration.dequeue();
      }
    }
    /*
    println(hallway);
    println(classroom);
    println(library);
    println(cafeteria);
    println(pool);
    println(concentration);
    */
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
    image(loadImage("player4.png"), 150, 200);
    image(enemy.getPhoto(), 350, 200);
    if (player.HP <= 0) {
      player.HP = 0;
    }
    getTextTwo();
    if (battleCounter < 120 && battleString != "") {
      battleCounter++;
      text(battleString, 300, 400, 200, 175);
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
  if (!player.Fighting && !player.End) {
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
      if (key == '1' || key == '2' || key == '3') {
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
    updateCon();
  }
}

void playerPic() {
  if (aniState == 1) {
    int m1 = millis();
    player.y = player.y - 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row4_1.png"), player.x, player.y);
    aniState = 2;
  } else if (aniState == 2) {
    int m1 = millis();
    player.y = player.y - 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row4_3.png"), player.x, player.y);
    aniState = 0;
  } else if (aniState == 3) {
    int m1 = millis();
    player.x = player.x - 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row2_1.png"), player.x, player.y);
    aniState = 4;
  } else if (aniState == 4) {
    int m1 = millis();
    player.x = player.x - 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row2_3.png"), player.x, player.y);
    aniState = 0;
  } else if (aniState == 5) {
    int m1 = millis();
    player.y = player.y + 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row1_1.png"), player.x, player.y);
    aniState = 6;
  } else if (aniState == 6) {
    int m1 = millis();
    player.y = player.y + 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row1_3.png"), player.x, player.y);
    aniState = 0;
  } else if (aniState == 7) {
    int m1 = millis();
    player.x = player.x + 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row3_1.png"), player.x, player.y);
    aniState = 8;
  } else if (aniState == 8) {
    int m1 = millis();
    player.x = player.x + 25;
    while (millis() - m1 < 150) {
    }
    image(loadImage("row3_3.png"), player.x, player.y);
    aniState = 0;
  } else {
    image(player.PlayerPhoto, player.x, player.y);
  }
}

void getTextOne() {
  textSize(28);
  text("HP: " + player.HP + "            Floor: " + mapNum/10 + "            Year: " + player.Year, 5, 490);
}

void getTextTwo() {
  textSize(22);
  text("HP: " + player.HP, 5, 400);
  text("Time: " + player.Mana, 5, 420);
  text("1) Attack: 0", 5, 440);
  text("2) Presentation: 5", 5, 460);
  text("3) Power-Nap: 30", 5, 480);
}

void pause() {
  int m1 = millis();
  while (millis() - m1 < 2000) {
  }
}

void setCon() {
  hallway = new RQueue<Enemy>();
  cafeteria = new RQueue<Enemy>();
  classroom = new RQueue<Enemy>();
  pool = new RQueue<Enemy>();
  library = new RQueue<Enemy>();
  for (int i = 0; i < 5; i++) {
    hallway.enqueue(new Freshman());
    cafeteria.enqueue(new Freshman());
    classroom.enqueue(new Freshman());
    pool.enqueue(new Freshman());
    library.enqueue(new Freshman());
  }
  for (int k = 0; k < 3; k++) {
    hallway.enqueue(new Teacher());
    cafeteria.enqueue(new Chef());
    classroom.enqueue(new Test());
    pool.enqueue(new Dean());
    library.enqueue(new Notebook());
  }
  for (int l = 0; l < 2; l++) {
    hallway.enqueue(new Security());
    cafeteria.enqueue(new Security());
    classroom.enqueue(new Teacher());
    pool.enqueue(new Security());
    library.enqueue(new Security());
  }

  if (player.Year == 1) {
    library = new RQueue<Enemy>();
    library.enqueue(new Librarian());
  }
  if (player.Year == 2) {
    pool = new RQueue<Enemy>();
    pool.enqueue(new Coach());
  }
  if (player.Year == 3) {
    cafeteria = new RQueue<Enemy>();
    cafeteria.enqueue(new SAT());
  }
  if (player.Year == 4) {
    classroom = new RQueue<Enemy>();
    classroom.enqueue(new FinalBoss());
  }
}

void updateCon() {
  if (mapNum == 11 || mapNum == 21 || mapNum == 31) {
    concentration = new RQueue<Enemy>();
    concentration = hallway;
  }
  if (mapNum == 12 || mapNum == 13) {
    concentration = new RQueue<Enemy>();
    concentration = pool;
  }
  if (mapNum == 22) {
    concentration = new RQueue<Enemy>();
    concentration = cafeteria;
  }
  if (mapNum == 33) {
    concentration = new RQueue<Enemy>();
    concentration = library;
  }
  if (mapNum == 23 || mapNum == 32) {
    concentration = new RQueue<Enemy>();
    concentration = classroom;
  }
  enemy = concentration.dequeue();
}
