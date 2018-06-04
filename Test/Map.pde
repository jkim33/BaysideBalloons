class Map {
  Tile[][] tiles;

  Map() {
    tiles = new Tile[5][5];
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
      }
    }
  }

  void display() {
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 5; x++) {
        image(tiles[x][y].getPhoto(), y*100, x*100);
      }
    }
  }
}
