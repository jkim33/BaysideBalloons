class Map {
  Tile[][] tiles;

  Map(int map) {
    tiles = new Tile[11][13];
    if (map == 11) {
      map11();
    }
    if (map == 12) {
      map12();
    }
    if (map == 13) {
      map13();
    }
    if (map == 21) {
      map21();
    }
    if (map == 22) {
      map22();
    }
    if (map == 23) {
      map23();
    }
    if (map == 31) {
      map31();
    }
    if (map == 32) {
      map32();
    }
    if (map == 33) {
      map33();
    }
  }

  void display() {
    for (int row = 1; row < 10; row++) {
      for (int col = 1; col < 12; col++) {
        image(tiles[row][col].getPhoto(), (col-1)*50, (row-1)*50);
      }
    }
  }

  void map11() {
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
          tiles[row2][col2] = new WallTile();
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    for (int col1 = 4; col1 < 9; col1++) {
      tiles[2][col1] = new WallTile(); 
      tiles[3][col1] = new WallTile();
      tiles[4][col1] = new TopWall();
    }
    tiles[2][3] = new WallTile();
    tiles[2][9] = new Escalator(2, 21, 80, 50);
    tiles[3][3] = new WallTile();
    tiles[3][9] = new Escalator(1, 0, 0, 0);
    tiles[4][3] = new TopWall();
    tiles[4][9] = new TopWall();

    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(13, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][11] = new TopWall();
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new WallTile();
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(12, 480, 200);
    tiles[6][1] = new WallTile();
    tiles[7][1] = new WallTile();
    tiles[8][1] = new WallTile();
    tiles[9][1] = new TopWall();
  }

  void map12() {
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
    for (int row3 = 1; row3 < 11; row3++) {
      tiles[row3][1] = new WallTile();
    }
    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(11, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][1] = new TopWall();
    tiles[9][11] = new TopWall();

    for (int colW = 4; colW < 9; colW++) {
      for (int rowW = 4; rowW < 7; rowW++) {
        tiles[rowW][colW] = new Water();
      }
    }
  }

  void map13() {
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
    for (int row3 = 1; row3 < 11; row3++) {
      tiles[row3][11] = new WallTile();
    }
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new WallTile();
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(11, 480, 200);
    tiles[6][1] = new WallTile();
    tiles[7][1] = new WallTile();
    tiles[8][1] = new WallTile();
    tiles[9][1] = new TopWall();
    tiles[9][11] = new TopWall();
    for (int colW = 4; colW < 9; colW++) {
      for (int rowW = 4; rowW < 7; rowW++) {
        tiles[rowW][colW] = new Water();
      }
    }
  }

  void map21() {
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
          tiles[row2][col2] = new WallTile();
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    for (int col1 = 4; col1 < 9; col1++) {
      tiles[2][col1] = new WallTile(); 
      tiles[3][col1] = new WallTile();
      tiles[4][col1] = new TopWall();
    }
    tiles[2][3] = new Escalator(1, 0, 0, 0);
    tiles[2][9] = new Escalator(2, 31, 80, 50);
    tiles[3][3] = new Escalator(2, 11, 455, 100);
    tiles[3][9] = new Escalator(1, 0, 0, 0);
    tiles[4][3] = new TopWall();
    tiles[4][9] = new TopWall();

    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(23, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][11] = new TopWall();
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new WallTile();
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(22, 480, 200);
    tiles[6][1] = new WallTile();
    tiles[7][1] = new WallTile();
    tiles[8][1] = new WallTile();
    tiles[9][1] = new TopWall();
  }

  void map22() {
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
          tiles[row2][col2] = new Cafe();
        }
      }
    }
    for (int row3 = 1; row3 < 11; row3++) {
      tiles[row3][1] = new WallTile();
    }
    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(21, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][1] = new TopWall();
    tiles[9][11] = new TopWall();

    for (int i = 3; i < 12; i=i+3) {
      for (int k = 3; k< 8; k=k+4) {
        tiles[k][i] = new Table();
      }
    }
  }

  void map23() {
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
          tiles[row2][col2] = new Bookshelf();
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    for (int row3 = 1; row3 < 11; row3++) {
      tiles[row3][11] = new WallTile();
    }
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new WallTile();
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(21, 480, 200);
    tiles[6][1] = new WallTile();
    tiles[7][1] = new WallTile();
    tiles[8][1] = new WallTile();
    tiles[9][1] = new TopWall();
    tiles[9][11] = new TopWall();

    for (int i = 3; i < 12; i=i+3) {
      for (int k = 3; k< 8; k=k+2) {
        tiles[k][i] = new Desk();
      }
    }
  }

  void map31() {
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
          tiles[row2][col2] = new WallTile();
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    for (int col1 = 4; col1 < 9; col1++) {
      tiles[2][col1] = new WallTile(); 
      tiles[3][col1] = new WallTile();
      tiles[4][col1] = new TopWall();
    }
    tiles[2][3] = new Escalator(1, 0, 0, 0);
    tiles[2][9] = new WallTile();
    tiles[3][3] = new Escalator(2, 21, 455, 100);
    tiles[3][9] = new WallTile();
    tiles[4][3] = new TopWall();
    tiles[4][9] = new TopWall();

    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(33, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][11] = new TopWall();
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new WallTile();
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(32, 480, 200);
    tiles[6][1] = new WallTile();
    tiles[7][1] = new WallTile();
    tiles[8][1] = new WallTile();
    tiles[9][1] = new TopWall();
  }

  void map32() {
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
          tiles[row2][col2] = new Bookshelf();
        } else if (row2 == 9) {
          tiles[row2][col2] = new TopWall();
        } else {
          tiles[row2][col2] = new FloorTile();
        }
      }
    }
    for (int row3 = 1; row3 < 11; row3++) {
      tiles[row3][1] = new WallTile();
    }
    tiles[1][11] = new WallTile();
    tiles[2][11] = new WallTile();
    tiles[3][11] = new WallTile();
    tiles[4][11] = new TopWall();
    tiles[5][11] = new PortalTile(31, 55, 200);
    tiles[6][11] = new WallTile();
    tiles[7][11] = new WallTile();
    tiles[8][11] = new WallTile();
    tiles[9][1] = new TopWall();
    tiles[9][11] = new TopWall();

    for (int i = 3; i < 12; i=i+3) {
      for (int k = 3; k< 8; k=k+2) {
        tiles[k][i] = new Desk();
      }
    }
  }

  void map33() {
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
          tiles[row2][col2] = new Bookshelf();
        } else if (row2 == 9) {
          tiles[row2][col2] = new Bookshelf();
        } else {
          tiles[row2][col2] = new Carpet();
        }
      }
    }
    for (int row3 = 1; row3 < 11; row3++) {
      tiles[row3][11] = new WallTile();
    }
    tiles[1][1] = new WallTile();
    tiles[2][1] = new WallTile();
    tiles[3][1] = new WallTile();
    tiles[4][1] = new TopWall();
    tiles[5][1] = new PortalTile(31, 480, 200);
    tiles[6][1] = new WallTile();
    tiles[7][1] = new WallTile();
    tiles[8][1] = new WallTile();
    tiles[9][1] = new TopWall();
    tiles[9][11] = new TopWall();
    for (int i = 4; i < 9; i++) {
      for (int k = 3; k< 8; k=k+2) {
        tiles[k][i] = new Desk();
      }
    }
  }
}
