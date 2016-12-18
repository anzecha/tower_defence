class enemies {
  float speed;
  float damage;
  float targetX;
  float targetY;
  int health;
  float dX = 1;
  float dY = 0;
  float tStage = 1;
  float useImage = 1;
  boolean giveMoney = true;
}

enemies makeEnemies(float targetX, float targetY, float damage, float speed, int health) {
  enemies n = new enemies(); 
  n.speed = speed;
  n.damage = damage;
  n.targetX = targetX;
  n.targetY = targetY;
  n.health = health;

  return n;
}      


void enemies() {

  for ( int i = 0; i < enemies.length; i++) {
    enemies[i] = makeEnemies(-448+ -32* i, 192, 1, 1, 5);
  }
}

void death() {

  if (enemies.length == 1) {
    for (int i = 0; i < 10 + level; i++) {
      enemies =(enemies[]) append(enemies, makeEnemies(-448 + -32* i, 192, 1, 1, 5 + 1 * level / 10 + 2^(level/80)));
      spawning = true;
    }
  }
  if (enemies[0].health <= 0 && enemies[0].giveMoney == true) {
    money +=5 + round(level/10);
    pop.play();
    pop.amp(0.2);
    enemies = (enemies[]) subset(enemies, 1);
    level += 1;
  } else if (enemies[0].health <= 0 && enemies[0].giveMoney == false) {
    enemies = (enemies[]) subset(enemies, 1);
    level += 1;
  }
}
void target() {

  for (int i = 0; i < enemies.length; i++) {
    if (enemies[i].health <10) {
      stroke(0, 153, 255);
      ellipse(enemies[i].targetX, enemies[i].targetY, 10, 10);
    }

    if (enemies[i].health >= 10 && enemies[i].health <30) {
      stroke(204, 255, 204);
      ellipse(enemies[i].targetX, enemies[i].targetY, 10, 10);
    }

    if (enemies[i].health >= 30 && enemies[i].health <60) {
      stroke(255, 0, 126);
      ellipse(enemies[i].targetX, enemies[i].targetY, 12, 12);
    }

    if (enemies[i].health >= 50 && enemies[i].health <90) {
      stroke(255, 0, 126);
      rect(enemies[i].targetX-7, enemies[i].targetY-7, 14, 14);
    }

    if (enemies[i].health >= 90 ) {
      stroke(random(0, 251), random(0, 204), random(51, 255));
      rect(enemies[i].targetX-10, enemies[i].targetY-10, 20, 20);
    }
  }
}

void moving() {
  for (int i = 0; i < enemies.length; i++) {

    textSize(12);
    text(enemies[i].health, enemies[i].targetX, enemies[i].targetY-6);
    enemies[i].targetX += 2*enemies[i].dX;
    enemies[i].targetY += 2*enemies[i].dY;

    if (enemies[i].targetX == 192 && enemies[i].tStage == 1) {
      enemies[i].dX = 1;
      enemies[i].dY = 0;
      enemies[i].tStage = 2;
    }

    if (enemies[i].targetY == 192 && enemies[i].tStage == 2) {
      enemies[i].dX = 0;
      enemies[i].dY = 1;
      enemies[i].tStage = 3;
    }

    if (enemies[i].targetX == 192 && enemies[i].tStage == 3 && enemies[i].targetY >= 704) {
      enemies[i].dX = 1;
      enemies[i].dY = 0;
      enemies[i].tStage = 4;
    }

    if (enemies[i].targetX == 384 && enemies[i].targetY == 704 && enemies[i].tStage == 4 ) {
      enemies[i].dX = 0;
      enemies[i].dY = -1;
      enemies[i].tStage = 5;
    }

    if (enemies[i].targetX == 384 && enemies[i].targetY == 192 && enemies[i].tStage == 5 ) {
      enemies[i].dX = 1;
      enemies[i].dY = 0;
      enemies[i].tStage = 6;
    }

    if (enemies[i].targetX == 768 && enemies[i].targetY == 192 && enemies[i].tStage == 6 ) {
      enemies[i].dX = 0;
      enemies[i].dY = 1;
      enemies[i].tStage = 7;
    }

    if (enemies[i].targetX == 768 && enemies[i].targetY == 384 && enemies[i].tStage == 7 ) {
      enemies[i].dX = -1;
      enemies[i].dY = 0;
      enemies[i].tStage = 8;
    }

    if (enemies[i].targetX == 576 && enemies[i].targetY == 384 && enemies[i].tStage == 8 ) {
      enemies[i].dX = 0;
      enemies[i].dY = 1;
      enemies[i].tStage = 9;
    }

    if (enemies[i].targetX == 576 && enemies[i].targetY == 576 && enemies[i].tStage == 9 ) {
      enemies[i].dX = 1;
      enemies[i].dY = 0;
      enemies[i].tStage = 10;
    }

    if (enemies[i].targetX == 768 && enemies[i].targetY == 576 && enemies[i].tStage == 10 ) {
      enemies[i].dX = 0;
      enemies[i].dY = 1;
      enemies[i].tStage = 1;
    }

    if (enemies[i].targetY >= 900) {
      enemies[i].giveMoney = false;
      enemies[i].health = 2* level;
      health -= 1;
      enemies[0].health = 0;
      level -=1;
      if (endMePlease == false) {
        damage.amp(0.2);
        damage.play();
      }
      // enemies = (enemies[]) subset(enemies, 1);
      //enemies =(enemies[]) append(enemies, makeEnemies(-448 + -32* i, 192, 1, 1, 5 + 1 * round(level/10)));
      //} else if(enemies[i].targetY == 900 && spawning == true) {
      //  enemies = (enemies[]) subset(enemies, 1);
      //  spawning = true;
      //}
    }
  }
}