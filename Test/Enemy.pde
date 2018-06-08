class Enemy {
  PImage photo;
  int HP;
  float Atk;
  float Def;
  float MAtk;
  float MDef;
  float Mana;
  float Speed;

  Enemy() {
    photo = loadImage("player2.png");
    HP = 100;
    Atk = 20.;
    Def = 25.;
    MAtk = 20.;
    MDef = 20.;
    Mana = 10.;
    Speed = 40.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +30));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The enemy did" + atk  + " damage!";
  }
  
  PImage getPhoto() {
    return photo;
  }
}
