class Freshman extends Enemy {
  Freshman() {
    photo = loadImage("freshman.png");
    HP = 70;
    Atk = 20.;
    Def = 25.;
    Speed = 70.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +20));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The Freshman did " + atk  + " damage!";
  }
}
