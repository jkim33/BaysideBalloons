class Security extends Enemy {
  Security() {
    photo = loadImage("security.png");
    HP = 70;
    Atk = 30.;
    Def = 15.;
    Speed = 75.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 12) +27));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The Security did " + atk  + " damage!";
  }
}
