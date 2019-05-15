class Soldier extends Men {

  PVector arrowVelocity = new PVector();
  float angle;
  float dX, dY;
  float x;
  float y;
  float vX;
  float vY;  
  float incX, incY;
  float fdX, fdY;

  Soldier(float incX, float incY, float vX, float vY) {
    super(incX, incY, vX, vY);
    hp = 3;
  }

  void show() {
    image(SwordSW, x, y, 15, 30);
  }
  void act() {
x = x + fdX;
    y = y + fdY;
    if (mousePressed) {
      incX = mouseX;
      incY = mouseY;
      angle = atan2(incY-y, incX-x);
      fdX = cos(angle) * 2;
      fdY = sin(angle) * 2;
    }
    if (incX - 5 < x && incX +5 > x && incY - 5 < y && incY + 5 > y) 
    {
      fdY = 0;
      fdX = 0;
    }
        closest = 100000;

    for (int i = 0; i < engine.size(); i++) {
      GameObject num = engine.get(i);
      if (num instanceof Enemy) {
        float ToEnemy = dist(num.x, num.y, x, y);
        if (ToEnemy < closest) {
          closest = ToEnemy;
          eX = num.x;
          eY = num.y;
        }
      }
    }
    eX = eX +20; 
    eY = eY + 20;  
    if (closest < 20) {
      if (frameCount % 1 == 0) {
        arrowVelocity.set(eX-x, eY-y);
        arrowVelocity.normalize();
        arrowVelocity.mult(50); 
        engine.add(new Bullet(x, y, arrowVelocity.x, arrowVelocity.y));
      }
    }
  }
  boolean hasDied () {
    return y > height || x > width || y < -20 || x < -20 || hp <= 0;
  }
}
