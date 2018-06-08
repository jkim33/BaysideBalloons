class Player {

  PImage PlayerPhoto;
  boolean YourTurn;
  boolean Fighting;
  boolean End;
  boolean Lost;
  int Finished;
  int Year;

  int HP;
  int MaxHP;
  float Atk;
  float Def;
  int Mana;
  int MaxMana;
  float Speed;

  int x;
  int y;

  Player() {
    PlayerPhoto = loadImage("player3.png");
    HP = 400;
    MaxHP = 400;
    Atk = 30.;
    Def = 30.;
    Mana = 10;
    MaxMana = 10;
    Speed = 45.;
    Finished = 0;
    Year = 1;
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
    if (Math.random() <= 0.20) {
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
    int atk = 0;
    if (k == '1') {
      float ED = e.Def;
      atk = 0;
      atk = (int) ((Atk/ED + 1) * ((Math.random() * 10) +30));
      e.HP = e.HP - atk;
    }
    if (k == '2' && Mana >= 5) {
      float ED = e.Def;
      atk = 0;
      atk = (int) ((Atk/ED + 1) * ((Math.random() * 10) + 50));
      e.HP = e.HP - atk;
      Mana = Mana-5;
    }
    if (k == '3' && Mana >= 30) {
      HP = MaxHP;
      YourTurn = false;
      Mana = Mana-30;
      return "You Healed!";
    }
    YourTurn = false;
    if (e.HP <= 0) {
      Fighting = false;
      End = true;
      if (e.Boss) {
        MaxHP+=250;
        HP = MaxHP;
        MaxMana+=10;
        Mana = MaxMana;
        Atk += (int) (Math.random() * 10);
        Def += (int) (Math.random() * 10);
        Speed += (int) (Math.random() * 10);
        Year++;
        Finished++;
      }
    }
    return "You did " + atk + " damage!";
  }
}
