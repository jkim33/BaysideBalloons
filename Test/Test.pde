Map map;
Player player;
Enemy enemy;

void setup() {
  size(250, 250);
  map = new Map(0);
  player = new Player();
  enemy = new Enemy();
}

void draw() {
  if (player.Lost) {
    background(255, 0, 0);
  }
  if (!player.Fighting) {
    if (map.tiles[player.y/50][player.x/50].getType() == 2) {
      int oldX = player.x;
      int oldY = player.y;
      player.x = map.tiles[oldY/50][oldX/50].nextX;
      player.y = map.tiles[oldY/50][oldX/50].nextY;
      map = new Map(map.tiles[oldY/50][oldX/50].getNext());
    }
    map.display();
    ellipse(player.x, player.y, 20, 20);
  } else {
    background(0, 0, 255);
    if (!player.YourTurn) {
      enemy.attack(player);
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
        player.move(c , map, enemy);
      }
    }
  } else {
    if (player.YourTurn) {
      if (key == 'l') {
        player.attack(key, enemy);
      }
    }
  }
}
