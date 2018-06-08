class Chef extends Enemy {
  Chef() {
    photo = loadImage("chef.png");
    HP = 60;
    Atk = 20.;
    Def = 30.;
    Speed = 20.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +20));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "BOSS: COACH did " + atk  + " damage!";
  }
}
