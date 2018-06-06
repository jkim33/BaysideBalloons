class PortalTile extends Tile {
  
  PortalTile(int next, int x, int y) {
    type = 2;
    photo = loadImage("Square.png");
    nextMap = next;
    nextX = x;
    nextY = y;
  }
  
}
