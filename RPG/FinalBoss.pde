class FinalBoss extends Enemy {
  FinalBoss() {
    photo = loadImage("finalboss.png");
    HP = 900;
    Atk = 80.;
    Def = 80.;
    Speed = 80.;
    Boss = true;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 11) +35));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "BOSS: APCS Teacher did " + atk  + " damage!";
  }
}
