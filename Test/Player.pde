class Player {
  
  boolean Fighting;
  boolean Lost;
  boolean Finished;
  
  int HP;
  int Atk;
  int Def;
  int MAtk;
  int MDef;
  int Mana;
  int Speed;
 
  int x;
  int y;
  
  Player() {
    x = 250;
    y = 250;
  }
  
  int attack() {
    return 0;
  }
  int magicOne() {
    return 0;
  }
  int magicTwo() {
    return 0;
  }
  
  void move(char c, Map m) {
    if (c == 'w' && m.tiles[(y-5)/100][(x)/100].getPass()) {
      y = y - 5;
    }
    else if (c == 'a' && m.tiles[y/100][(x-5)/100].getPass()) {
      x = x - 5;
    }
    else if (c == 's' && m.tiles[(y+5)/100][x/100].getPass()) {
      y = y + 5;
    }
    else if (c == 'd' && m.tiles[y/100][(x+5)/100].getPass()) {
      x = x + 5;
    }
    if (Math.random() <= 0.02) {
      battle();
    }
  }
  
  void battle() {
    println("HI");
  }
  
}
 
