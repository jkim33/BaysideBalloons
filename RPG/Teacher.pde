class Teacher extends Enemy {
  Teacher() {
    photo = loadImage("teacher.png");
    HP = 80;
    Atk = 15.;
    Def = 30.;
    Speed = 55.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +22));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The Teacher did " + atk  + " damage!";
  }
}
