class Librarian extends Enemy {
  Librarian() {
    photo = loadImage("librarian.png");
    HP = 200;
    Atk = 30.;
    Def = 60.;
    Speed = 40.;
    Boss = true;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +30));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "BOSS: LIBRARIAN did " + atk  + " damage!";
  }
}
