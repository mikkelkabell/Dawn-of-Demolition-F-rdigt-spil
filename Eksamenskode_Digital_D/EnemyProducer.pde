class EnemyProducer extends GameObject {

  EnemyProducer () {
    x = random(140, 590);
    y = 1000;
    dx = random(-2, 2);
    dy = 0.5;
  }

  void show () {
    fill(200);
    ellipse (x, y, 20, 20);
  }

  void act() {
    loop();
    if (frameCount%2000 < 100) {
      //gør ingenting
    } else if (frameCount%2000 < 600) {
      straightLine (100);
    } else if (frameCount%2000 < 1050) {
      straightLine (500);
    } else if (frameCount%2000 < 1600) {
      randomWave();
    }
  }


  void straightLine(float incX) {
    x = incX;
    if (frameCount % 100 == 0) { 
      myEnemy = new Enemy(random(140, 590), 850);
      engine.add(myEnemy);
    }
  }
  void randomWave() {
    x = random(140, 590);
    if (frameCount %100 == 0) {
      myEnemy = new Enemy(random(140, 590), 850);
      engine.add(myEnemy);
    }
  }
}
