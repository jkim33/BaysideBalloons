class Tile {
  int type;
  PImage photo;
  
  int nextX;
  int nextY;
  
  int nextMap;
  
  PImage getPhoto() {
    return photo;
  }
  
  int getType() {
    return type;
  }
  
  int getNext() {
    return nextMap;
  }
  
}
