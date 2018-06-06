class Player {

  boolean YourTurn;
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
    HP = 100;
    Atk = 30;
    Def = 30;
    MAtk = 30;
    MDef = 30;
    Mana = 10;
    Speed = 45;
    x = 125;
    y = 125;
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

  void move(char c, Map m, Enemy e) {
    if (c == 'w' && m.tiles[(y-5)/50][(x)/50].getType() != 1) {
      y = y - 5;
    } else if (c == 'a' && m.tiles[y/50][(x-5)/50].getType() != 1) {
      x = x - 5;
    } else if (c == 's' && m.tiles[(y+5)/50][x/50].getType() != 1) {
      y = y + 5;
    } else if (c == 'd' && m.tiles[y/50][(x+5)/50].getType() != 1) {
      x = x + 5;
    }
    if (Math.random() <= 0.02) {
      println("HI");
      Fighting = true;
      if (Speed > e.Speed) {
        YourTurn = true;
      } else {
      YourTurn = false;
      }
    }
  }

  void attack(char k, Enemy e) {
    if (k == 'l') {
      int ED = e.Def;
      int atk = 0;
      atk = (int) ((Atk * 10.0) / (ED * Math.random() * 10));
      e.HP = e.HP - atk;
      YourTurn = false;
    }
    if (e.HP <= 0) {
      YourTurn = false;
      Fighting = false;
      e.HP = 100;
    }
  }
}
