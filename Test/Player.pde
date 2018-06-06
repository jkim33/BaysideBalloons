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

  void move(char c, Map m, Enemy e) {
    if (c == 'w' && m.tiles[(y-5)/100][(x)/100].getType() != 1) {
      y = y - 5;
    } else if (c == 'a' && m.tiles[y/100][(x-5)/100].getType() != 1) {
      x = x - 5;
    } else if (c == 's' && m.tiles[(y+5)/100][x/100].getType() != 1) {
      y = y + 5;
    } else if (c == 'd' && m.tiles[y/100][(x+5)/100].getType() != 1) {
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
