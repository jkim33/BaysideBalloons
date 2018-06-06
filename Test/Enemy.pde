class Enemy {
  int HP;
  int Atk;
  int Def;
  int MAtk;
  int MDef;
  int Mana;
  int Speed;

  Enemy() {
    HP = 100;
    Atk = 30;
    Def = 30;
    MAtk = 30;
    MDef = 30;
    Mana = 10;
    Speed = 40;
  }
  
  void attack(Player p) {
    int PD = p.Def;
    int atk =(int) ((Atk * 10.0) / (PD * Math.random() * 10));
    p.HP = p.HP - atk;
    p.YourTurn = true;
    if (p.HP <= 0) {
      p.Lost = true;
    }
  }
}
