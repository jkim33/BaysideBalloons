class Map {
  Tile[][] tiles;

  Map(int map) {
    tiles = new Tile[11][13];
    if (map == 0) {
      mapZero();
    }
    if (map == 1) {
      mapOne();
    }
  }

  void display() {
    for (int row = 1; row < 10; row++) {
      for (int col = 1; col < 12; col++) {
        image(tiles[row][col].getPhoto(), (col-1)*50, (row-1)*50);
      }
    }
  }

  void mapZero() {
    for (int c = 0; c < 11; c++) {
      tiles[0][c] = new WallTile();
      tiles[8][c] = new WallTile();
    }
    for (int r = 0; r < 9; r++) {
      tiles[r][0] = new WallTile();
      tiles[r][10] = new WallTile();
    }
    for (int row1 = 1; row1 < 8; row1++) {
      if (row1 < 7) {
        tiles[row1][1] = new WallTile();
      }
      else {
        tiles[row1][1] = new TopWall();
      }
    }
    for (int row2 = 1; row2 < 8; row2++) {
      for (int col2 = 2; col2 < 9; col2++) {
        if (row2 == 1) {
          tiles[row2][col2] = new TopWall();
        }
        else if (row2 == 7) {
          tiles[row2][col2] = new TopWall();
        }
        else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    tiles[1][9] = new WallTile();
    tiles[2][9] = new WallTile();
    tiles[3][9] = new TopWall();
    tiles[4][9] = new PortalTile(1, 55, 150);
    tiles[5][9] = new WallTile();
    tiles[6][9] = new WallTile();
    tiles[7][9] = new TopWall();
  }
  
  void mapOne() {
    for (int row1 = 1; row1 < 8; row1++) {
      if (row1 < 7) {
        tiles[row1][9] = new WallTile();
      }
      else {
        tiles[row1][9] = new TopWall();
      }
    }
    for (int row2 = 1; row2 < 8; row2++) {
      for (int col2 = 2; col2 < 9; col2++) {
        if (row2 == 1) {
          tiles[row2][col2] = new TopWall();
        }
        else if (row2 == 7) {
          tiles[row2][col2] = new TopWall();
        }
        else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new TopWall();
    tiles[4][1] = new PortalTile(0, 380, 150);
    tiles[5][1] = new WallTile();
    tiles[6][1] = new WallTile();
    tiles[7][1] = new TopWall();
  }
  
 

}
