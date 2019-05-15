class Bullet extends GameObject {

  Archer myArcher;
  PVector acc, vel, loc, dire;
  float radius;

  Bullet(float incX, float incY, float incDX, float incDY) {
    loc = new PVector(incX, incY);
    vel = new PVector(incDX, incDY);
    hp = 1;
    radius = 6;
  }
  void show () {
    fill (255);
    ellipse (loc.x, loc.y, 2*radius, 2*radius);
  }

  void act () {
    vel.setMag(3);
    loc.x += vel.x;
    loc.y += vel.y;
  }

  boolean hasDied () {
    return y > height || x > width || y < -20 || x < -20 || hp <= 0;
  }
}
