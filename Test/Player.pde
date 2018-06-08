class Player {

  PImage PlayerPhoto;
  boolean YourTurn;
  boolean Fighting;
  boolean End;
  boolean Lost;
  boolean Finished;

  int HP;
  float Atk;
  float Def;
  float MAtk;
  float MDef;
  float Mana;
  float Speed;

  int x;
  int y;

  Player() {
    PlayerPhoto = loadImage("player3.png");
    HP = 1000;
    Atk = 30.;
    Def = 30.;
    MAtk = 30.;
    MDef = 30.;
    Mana = 10.;
    Speed = 45.;
    x = 255;
    y = 200;
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

  boolean move(char c, Map m, Enemy e) {
    if (c == 'w' && m.tiles[(y+25-50)/50 + 1][(x+20)/50 + 1].getType() != 1) {
      PlayerPhoto = loadImage("player1.png");
      return true;
      //y = y-50;
    } else if (c == 'a' && m.tiles[(y+25)/50 + 1][(x+20-50)/50 + 1].getType() != 1) {
      PlayerPhoto = loadImage("player2.png");
      return true;
      //x = x-50;
    } else if (c == 's' && m.tiles[(y+25+50)/50 + 1][(x+20)/50 + 1].getType() != 1) {
      PlayerPhoto = loadImage("player3.png");
      return true;
      //y = y+50;
    } else if (c == 'd' && m.tiles[(y+25)/50 + 1][(x+20+50)/50 + 1].getType() != 1) {
      PlayerPhoto = loadImage("player4.png");
      return true;
      //x = x+50;
    }
    if (Math.random() <= 0.1) {
      Fighting = true;
      if (Speed > e.Speed) {
        YourTurn = true;
      } else {
      YourTurn = false;
      }
    }
    return false;
  }
    
  String attack(char k, Enemy e) {
    if (k == '1') {
      float ED = e.Def;
      int atk = 0;
      atk = (int) ((Atk/ED + 1) * ((Math.random() * 10) +30));
      e.HP = e.HP - atk;
      YourTurn = false;
      if (e.HP <= 0) {
        e.HP = 100;
        Fighting = false;
        End = true;
      }
      return "You did " + atk + " damage!";
    }
    return "nope";
  }
}
