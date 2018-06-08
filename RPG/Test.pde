class Test extends Enemy {
  Test() {
    photo = loadImage("test.png");
    HP = 50;
    Atk = 30.;
    Def = 20.;
    Speed = 50.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +30));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The Test did " + atk  + " damage!";
  }
}
