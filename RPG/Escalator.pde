class Escalator extends Tile {
  Escalator(int i, int next, int x, int y) {
    type = i;
    photo = loadImage("escalator.png");
    nextMap = next;
    nextX = x;
    nextY = y;
  }
}
