class Map {
  Tile[][] tiles;

  Map(int map) {
    tiles = new Tile[5][5];
    if (map == 0) {
      mapZero();
    }
    if (map == 1) {
      mapOne();
    }
  }

  void display() {
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        image(tiles[x][y].getPhoto(), y*50, x*50);
      }
    }
  }
  
  void mapZero() {
    for (int i = 0; i < 5; i++) {
      for (int k = 0; k < 5; k++) {
        if (i == 0 || i == 4) {
          tiles[i][k] = new TopWall();
        }
        else if (k==0 || k== 4) {
          tiles[i][k] = new WallTile();
        }
        else {
          tiles[i][k] = new PassTile();
        }
        if (i == 2 && k == 4) {
          tiles[i][k] = new PortalTile(1, 55, 125);
        }
      }
    }
  }
 
  void mapOne() {
    for (int i = 0; i < 5; i++) {
      for (int k = 0; k < 5; k++) {
        if (i == 0 || i == 4) {
          tiles[i][k] = new WallTile();
        }
        else if (k==0 || k== 4) {
          tiles[i][k] = new WallTile();
        }
        else {
          tiles[i][k] = new PassTile();
        }
        if (i == 2 && k == 0) {
          tiles[i][k] = new PortalTile(0, 195, 125);
        }
      }
    }
  }
  
}
