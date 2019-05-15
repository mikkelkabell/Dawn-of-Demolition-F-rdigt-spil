class Enemy extends GameObject { //<>//

  float closest = 10000;
  float eX, eY;
  float angle;
  float fdX, fdY;
  float radius;


  Enemy(float incX, float incY) {
    hp = 2;
    x = incX;
    y = incY;
    dx = 0;
    dy = -1;
    radius = 20;
  }
  void show () {
    image(EnemyS, x, y, 40, 40);
  }
  void act () {
    x = x + dx;
    y = y + dy;



    for (GameObject e : engine) {
      if (e instanceof Bullet) {
        Bullet b = (Bullet)e;
        float L = dist(this.x, this.y, b.loc.x, b.loc.y);
        if (L < this.radius+b.radius) {
          this.hp--;
          if (this.hp == 0) 
          {
           eKill++; 
          }
          b.hp --;
        }
      }
    }
  }
  boolean hasDied () {
    return y > height || x > width || y < -20 || x < -20 || hp <= 0;
  }
}
