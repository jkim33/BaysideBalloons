class Enemy {
  PImage photo;
  int HP;
  float Atk;
  float Def;
  float Speed;
  boolean Boss;

  Enemy() {
    photo = loadImage("player2.png");
    HP = 100;
    Atk = 20.;
    Def = 25.;
    Speed = 40.;
    Boss = false;
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
