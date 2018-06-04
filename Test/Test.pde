Map map;
Player player;

void setup() {
  size(500,500);
  map = new Map();
  player = new Player();
}

void draw() {
  map.display();
  ellipse(player.x, player.y, 20,20);
}

void keyPressed() {
  if (key == 'w' || key == 'a' || key == 's' || key == 'd') {
    player.move(key, map);
  }
}