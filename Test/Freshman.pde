class Freshman extends Enemy {
  Freshman() {
    photo = loadImage("freshman.png");
    HP = 100;
    Atk = 20.;
    Def = 25.;
    MAtk = 20.;
    MDef = 20.;
    Mana = 10.;
    Speed = 50.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +30));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The nerd did " + atk  + " damage!";
  }
}
