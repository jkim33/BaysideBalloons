class PortalTile extends Tile {
  
  PortalTile(int next, int x, int y) {
    type = 2;
    photo = loadImage("floor.png");
    nextMap = next;
    nextX = x;
    nextY = y;
  }
  
}
