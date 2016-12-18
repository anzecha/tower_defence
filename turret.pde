class turret {
  float x;
  float y;
  float price;
  float damage;
  float type;
}

turret makeTurret(float placeTurretX, float placeTurretY, float price, float damage) {
  turret n = new turret(); 
  n.x = placeTurretX;
  n.y = placeTurretY;
  n.price = price;
  n.damage = damage;
  return n;
}


Object[] deleteFromArray(Object[] arr, int index) {
  for (int i=index+1; i<arr.length; i++) {
    arr[i-1] = arr[i];
  }
  arr =(Object[]) shorten(arr);
  return arr;
}

void towerPurchase() {
  if (purchase == 1) {
    if (gridspace() && money-50 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 50, 1));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 1));
      money -= 50;
      make.amp(.34);
      make.play();
    }
  }

  if (purchase == 2) {
    if (gridspace() && money-200 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 200, 2));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 2));
      money -= 200;
      make.amp(.34);
    }
  }

  if (purchase == 3) {
    if (gridspace() && money-800 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 800, 4));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 4));
      money -= 800;
      make.amp(.34);
    }
  }

  if (purchase == 4) {
    if (gridspace() && money-1600 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 1600, 8));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 8));
      money -= 1600;
      make.amp(.34);
    }
  }

  if (purchase == 5) {
    if (gridspace() && money-2000 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 2000, 8));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 8));
      money -= 2000;      
      make.amp(.34);
    }
  }

  if (purchase == 6) {
    if (gridspace() && money-3200 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 3200, 16));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 16));
      money -= 3200;      
      make.amp(.34);
    }
  }

  if (purchase == 7) {
    if (gridspace() && money-6400 >= 0) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 6400, 32));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 32));
      money -= 6400;      
      make.amp(.34);
    }
  }

  if (purchase == 8) {
    if (gridspace() && money-0 >= 12800) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 12800, 64));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 64));
      money -= 12800;      
      make.amp(.34);
    }
  }

  if (purchase == 9) {
    if (gridspace() && money-0 >= 250) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 250, 1));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 1));
      money -= 250;      
      make.amp(.34);
    }
  }

  if (purchase == 10) {
    if (gridspace() && money-0 >= 1000) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 1000, 4));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 4));
      money -= 1000;      
      make.amp(.34);
    }
  }

  if (purchase == 11) {
    if (gridspace() && money-0 >= 4000) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 4000, 16));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 16));
      money -= 4000;      
      make.amp(.34);
    }
  }

  if (purchase == 12) {
    if (gridspace() && money-0 >= 16000) {           //  setting up empty spots and turret type
      turrets =(turret[]) append(turrets, makeTurret(grid(mouseX, 64), grid(mouseY, 64), 16000, 32));
      bullets =(bullets[]) append(bullets, makeBullets(grid(mouseX, 64), grid(mouseY, 64), grid(mouseX, 64), grid(mouseY, 64), 32));
      money -= 16000;      
      make.amp(.34);
    }
  }

  if (purchase < 0) {
    for (int i = 0; i < turrets.length; i++) {
      if (grid(mouseX, 64) == turrets[i].x &&  grid(mouseY, 64) == turrets[i].y) {
        money += turrets[i].price/2; 
        turrets = (turret[]) deleteFromArray(turrets, i);
        bullets = (bullets[]) deleteFromArray(bullets, i);
        coins.amp(0.3);
        coins.play();
      }
    }
  }
}