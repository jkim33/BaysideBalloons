class Coach extends Enemy {
  Coach() {
    photo = loadImage("coach.png");
    HP = 300;
    Atk = 60.;
    Def = 70.;
    Speed = 20.;
    Boss = true;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +45));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "BOSS: COACH did " + atk  + " damage!";
  }
}
