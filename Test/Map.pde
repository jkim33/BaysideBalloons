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
    if (map == 2) {
      mapTwo();
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
    for (int c = 0; c < 13; c++) {
      tiles[0][c] = new WallTile();
      tiles[10][c] = new WallTile();
    }
    for (int r = 0; r < 11; r++) {
      tiles[r][0] = new WallTile();
      tiles[r][12] = new WallTile();
    }
    for (int row1 = 1; row1 < 11; row1++) {
      if (row1 < 9) {
        tiles[row1][1] = new WallTile();
      } else {
        tiles[row1][1] = new TopWall();
      }
    }
    for (int row2 = 1; row2 < 10; row2++) {
      for (int col2 = 2; col2 < 12; col2++) {
        if (row2 == 1) {
          tiles[row2][col2] = new TopWall();
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(1, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][11] = new TopWall();
  }

  void mapOne() {
    for (int c = 0; c < 13; c++) {
      tiles[0][c] = new WallTile();
      tiles[10][c] = new WallTile();
    }
    for (int r = 0; r < 11; r++) {
      tiles[r][0] = new WallTile();
      tiles[r][12] = new WallTile();
    }
    for (int row1 = 1; row1 < 11; row1++) {
      if (row1 < 9) {
        tiles[row1][1] = new WallTile();
      } else {
        tiles[row1][1] = new TopWall();
      }
    }
    for (int row2 = 1; row2 < 11; row2++) {
      for (int col2 = 2; col2 < 12; col2++) {
        if (row2 == 1) {
          tiles[row2][col2] = new WallTile();
        } else if (row2 == 2) {
          tiles[row2][col2] = new Bookshelf();
          if (col2 == 10) {
            tiles[row2][col2] = new BookshelfTop();
          }
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else if (row2 == 8) {
          tiles[row2][col2] = new BookshelfTop();
        }else if (col2 == 10) {
          tiles[row2][col2] = new BookshelfTop();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(0, 480, 200);
    tiles[5][2] = new FloorTile();
    tiles[1][5] = new PortalTile(2, 255, 55);
    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new WallTile();
    tiles[5][11] = new WallTile();
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][11] = new TopWall();
  }
  
  void mapTwo() {
    for (int c = 0; c < 13; c++) {
      tiles[0][c] = new WallTile();
      tiles[10][c] = new WallTile();
    }
    for (int r = 0; r < 11; r++) {
      tiles[r][0] = new WallTile();
      tiles[r][12] = new WallTile();
    }
    for (int row1 = 1; row1 < 11; row1++) {
      if (row1 < 9) {
        tiles[row1][1] = new WallTile();
      } else {
        tiles[row1][1] = new TopWall();
      }
    }
    for (int row2 = 1; row2 < 11; row2++) {
      for (int col2 = 2; col2 < 12; col2++) {
        if (row2 == 1) {
          tiles[row2][col2] = new WallTile();
        } else if (row2 == 2) {
          tiles[row2][col2] = new Bookshelf();
          if (col2 == 10) {
            tiles[row2][col2] = new BookshelfTop();
          }
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else if (row2 == 8) {
          tiles[row2][col2] = new BookshelfTop();
        }else if (col2 == 10) {
          tiles[row2][col2] = new BookshelfTop();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(0, 480, 200);
    tiles[5][2] = new FloorTile();
    tiles[1][5] = new PortalTile(2, 255, 445);
    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new WallTile();
    tiles[5][11] = new WallTile();
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][11] = new TopWall();
  }
}
