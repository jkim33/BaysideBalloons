class SAT extends Enemy {
  SAT() {
    photo = loadImage("SAT.png");
    HP = 500;
    Atk = 50.;
    Def = 70.;
    Speed = 90.;
    Boss = true;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 12) +28));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "BOSS: SAT did " + atk  + " damage!";
  }
}
