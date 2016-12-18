class bullets {
  float speed;
  float damage;
  float x;
  float y;
  float startX;
  float startY;
}

bullets makeBullets(float startX, float startY, float x, float y, float damage) {
  bullets n = new bullets(); 
  n.startX = startX;
  n.startY = startY;
  n.x = x;
  n.y = y;
  n.damage = damage;
  return n;
}

void shooting() {
  println(ice);
  if (turrets.length > 0) {

    for (int i = 0; i < bullets.length; i++) {
      fill(255, 255, 255);
      towerColour();
      ellipse(bullets[i].x, bullets[i].y, 10, 10);

      if (turrets[i].price == 2000 || turrets[i].price == 3200 || turrets[i].price == 6400 || turrets[i].price == 12800) {
        int steps = 7;

        if (enemies[0].targetX > 0 && enemies[0].targetY < 896) { //bullets[i].startX- enemies[0].targetX < 400 && bullets[i].startY-enemies[0].targetY < 400 && put this for targeting areas
          bullets[i].x += (enemies[0].targetX - bullets[i].x) / steps + (enemies[0].targetX - bullets[i].x) / 15;

          bullets[i].y += (enemies[0].targetY -bullets[i].y) / steps + (enemies[0].targetY - bullets[i].y) / 15;


          if ((enemies[0].targetX-bullets[i].x)>-20 && (enemies[0].targetX-bullets[i].x) <= 20 && (enemies[0].targetY-bullets[i].y) <20 && (enemies[0].targetY-bullets[i].y) >= -20) {
            bullets[i].x = bullets[i].startX;
            bullets[i].y = bullets[i].startY;
            enemies[0].health -= bullets[i].damage;
            laser1.amp(0.05);
            laser1.play();
          }
        } else {
          bullets[i].x = bullets[i].startX;
          bullets[i].y = bullets[i].startY;
        }
      } else if (turrets[i].price == 250 || turrets[i].price == 1000 || turrets[i].price == 4000 || turrets[i].price == 16000) {
        int steps = 15;

        if (enemies[0].targetX > 0 && enemies[0].targetY < 896) { //bullets[i].startX- enemies[0].targetX < 400 && bullets[i].startY-enemies[0].targetY < 400 && put this for targeting areas
          bullets[i].x += (enemies[0].targetX - bullets[i].x) / steps + (enemies[0].targetX - bullets[i].x) / 25;

          bullets[i].y += (enemies[0].targetY -bullets[i].y) / steps + (enemies[0].targetY - bullets[i].y) /25;


          if ((enemies[0].targetX-bullets[i].x)>-20 && (enemies[0].targetX-bullets[i].x) <= 20 && (enemies[0].targetY-bullets[i].y) <20 && (enemies[0].targetY-bullets[i].y) >= -20) {
            bullets[i].x = bullets[i].startX;
            bullets[i].y = bullets[i].startY;
            enemies[0].health -= bullets[i].damage;
            ting.amp(0.03);
            ting.play();
            ice += 1;
            if (ice >= 50) {
              ice = 1;
              turrets[i].damage += 1;
              shatter.amp(0.3);
              shatter.play();
            }
          }
        } else {
          bullets[i].x = bullets[i].startX;
          bullets[i].y = bullets[i].startY;
        }
      } else {
        int steps = 15;

        if (enemies[0].targetX > 0 && enemies[0].targetY < 896) { //bullets[i].startX- enemies[0].targetX < 400 && bullets[i].startY-enemies[0].targetY < 400 && put this for targeting areas
          bullets[i].x += (enemies[0].targetX - bullets[i].x) / steps + (enemies[0].targetX - bullets[i].x) / 20;

          bullets[i].y += (enemies[0].targetY -bullets[i].y) / steps + (enemies[0].targetY - bullets[i].y) / 20;


          if ((enemies[0].targetX-bullets[i].x)>-20 && (enemies[0].targetX-bullets[i].x) <= 20 && (enemies[0].targetY-bullets[i].y) <20 && (enemies[0].targetY-bullets[i].y) >= -20) {
            bullets[i].x = bullets[i].startX;
            bullets[i].y = bullets[i].startY;
            enemies[0].health -= bullets[i].damage;
            laser2.amp(0.05);
            laser2.play();
          }
        } else {
          bullets[i].x = bullets[i].startX;
          bullets[i].y = bullets[i].startY;
        }
      }
    }
  }
}

void towerColour() {
  for (int i = 1; i < bullets.length; i++) {
    if (turrets[i].damage == 1) {
      stroke(27, 98, 211);
    }
    if (turrets[i].damage == 2) {
      stroke(27, 211, 27);
    }
    if (purchase == 3) {
      stroke(187, 27, 211);
    }
    if (purchase == 4) {
      stroke(196, 9, 19);
    }
    if (purchase == 5) {
      stroke(190, 221, 35);
    }
  }
}