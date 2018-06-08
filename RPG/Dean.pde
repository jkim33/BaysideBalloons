class Dean extends Enemy {
  Dean() {
    photo = loadImage("dean.png");
    HP = 80;
    Atk = 25.;
    Def = 20.;
    Speed = 20.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +25));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The Dean did " + atk  + " damage!";
  }
}
