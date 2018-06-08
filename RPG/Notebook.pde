class Notebook extends Enemy {
  Notebook() {
    photo = loadImage("book.png");
    HP = 40;
    Atk = 10.;
    Def = 50.;
    Speed = 80.;
  }
  
  String attack(Player p) {
    float PD = p.Def;
    int atk = 0;
    atk = (int) ((Atk/PD + 1) * ((Math.random() * 10) +18));;
    p.HP = p.HP - atk;
    p.YourTurn = true;
    return "The Book did " + atk  + " damage!";
  }
}
