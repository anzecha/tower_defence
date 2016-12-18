import processing.sound.*;
PImage turret2;
PImage background;
PImage moneyI;
PImage healthI;
PImage f_turret_1;
PImage f_turret_2;
PImage f_turret_3;
PImage f_turret_4;
PImage l_turret_1;
PImage l_turret_2;
PImage l_turret_3;
PImage l_turret_4;
PImage b_turret_1;
PImage b_turret_2;
PImage b_turret_3;
PImage b_turret_4;


SoundFile bkgmusic;
SoundFile beep;
SoundFile make;
SoundFile shatter;
SoundFile damage;
SoundFile laser1;
SoundFile laser2;
SoundFile ting;
SoundFile coins;
SoundFile pop;
//PFont courier;

turret[] turrets;
enemies[] enemies;
bullets[] bullets;
space[] space;



int health = 100;
int speed = 1;
int level = 0;
int money = 100;
int cost = 50;
int purchase = 1;

float ice = 1;

boolean spawning = true;
boolean endMePlease = false;


void setup() {
  size(1280, 896);  


  bkgmusic = new SoundFile(this, "bkgmsc.mp3");

  beep = new SoundFile(this, "beep.mp3");
  make = new SoundFile(this, "make.mp3");
  shatter = new SoundFile(this, "shatter.mp3");
  damage = new SoundFile(this, "damage.mp3");
  laser1 = new SoundFile(this, "laser1.mp3");
  laser2 = new SoundFile(this, "laser2.mp3");
  ting = new SoundFile(this, "ting.mp3");
  coins = new SoundFile(this, "coins.wav");
  pop = new SoundFile(this, "pop.mp3");


  turret2 = loadImage("turret2.png");
  background = loadImage("background.jpg");
  moneyI = loadImage("money.png");
  healthI = loadImage("health.png");
  f_turret_1 = loadImage("f_turret_1.png");
  f_turret_2 = loadImage("f_turret_2.png");
  f_turret_3 = loadImage("f_turret_3.png");
  f_turret_4 = loadImage("f_turret_4.png");

  l_turret_1 = loadImage("l_turret_1.png");
  l_turret_2 = loadImage("l_turret_2.png");
  l_turret_3 = loadImage("l_turret_3.png");
  l_turret_4 = loadImage("l_turret_4.png");

  b_turret_1 = loadImage("b_turret_1.png");
  b_turret_2 = loadImage("b_turret_2.png");
  b_turret_3 = loadImage("b_turret_3.png");
  b_turret_4 = loadImage("b_turret_4.png");

  space = new space[14];
  turrets = new turret[0];
  enemies = new enemies[10];
  bullets = new bullets[0];
  for (int i = 0; i<turrets.length; i++) {
    turrets[i] = makeTurret(grid(mouseX, 7), grid(mouseY, 7), 20, 5);
  }
  enemies();
  fill(0);
  //courier = createFont("OCRAStd.otf", 32);
  bkgmusic.play();
  bkgmusic.stop();         // fixes the loop not working for mono tracks sound bug;
  bkgmusic.loop();
  bkgmusic.amp(.15);
}

void draw() {

  image(background, 0, 0);
  image(healthI, 1025, 40, 48, 48);
  image(moneyI, 1025, 98, 48, 48);
  drawBoard();
  for (int i = 0; i<turrets.length; i++) {
    pushMatrix();
    float a = atan2(enemies[0].targetY-turrets[i].y, enemies[0].targetX-turrets[i].x); //replace mouseX and mouseY with target location
    translate(turrets[i].x, turrets[i].y);
    rotate(a);

    if (turrets[i].price==50) {
      image(l_turret_1, -48, -48, 96, 96);
    } 
    if (turrets[i].price==200) {
      image(l_turret_2, -48, -48, 96, 96);
    } 
    if (turrets[i].price==200) {
      image(l_turret_2, -48, -48, 96, 96);
    } 
    if (turrets[i].price==800) {
      image(l_turret_3, -48, -48, 96, 96);
    } 
    if (turrets[i].price==1600) {
      image(l_turret_4, -48, -48, 96, 96);
    } 
    if (turrets[i].price==2000) {
      image(b_turret_1, -48, -48, 96, 96);
    } 
    if (turrets[i].price==3200) {
      image(b_turret_2, -48, -48, 96, 96);
    } 
    if (turrets[i].price==6400) {
      image(b_turret_3, -48, -48, 96, 96);
    } 
    if (turrets[i].price==12800) {
      image(b_turret_4, -48, -48, 96, 96);
    }
    if (turrets[i].price==250) {
      image(f_turret_1, -48, -48, 96, 96);
    }
    if (turrets[i].price==1000) {
      image(f_turret_2, -48, -48, 96, 96);
    }
    if (turrets[i].price==4000) {
      image(f_turret_3, -48, -48, 96, 96);
    }
    if (turrets[i].price==16000) {
      image(f_turret_4, -48, -48, 96, 96);
    }

    popMatrix();
  }

  //println(grid(mouseX, 64), grid(mouseY, 64));

  GUI();
  target();
  moving();
  shooting();
  death();
  mouseOver();
  greenFill();
  endMe();
}

void mousePressed() {
  selector();
  towerPurchase();
}

void keyPressed() {
  if (endMePlease == true) {
    exit();
  }
}


void GUI() {

  noFill();
  rect(1024, 160, 180, 70);

  textSize(60);
  fill(255, 255, 255);
  text(health, 1088, 85);
  text(money, 1088, 145);
  noFill();

  stroke(57, 211, 62);
  text("SELL", 1050, 218);

  text("TURRET I", 980, 282);
  rect(982, 288, 64, 64);
  image(l_turret_1, 982, 288, 64, 64);
  rect(1050, 288, 64, 64);
  image(l_turret_2, 1050, 288, 64, 64);
  rect(1118, 288, 64, 64);
  image(l_turret_3, 1118, 288, 64, 64);
  rect(1186, 288, 64, 64);
  image(l_turret_4, 1186, 288, 64, 64);

  text("TURRET II", 975, 410);
  rect(982, 416, 64, 64);
  image(b_turret_1, 982, 416, 64, 64);
  rect(1050, 416, 64, 64);
  image(b_turret_2, 1050, 416, 64, 64);
  rect(1118, 416, 64, 64);
  image(b_turret_3, 1118, 416, 64, 64);
  rect(1186, 416, 64, 64);
  image(b_turret_4, 1186, 416, 64, 64);

  text("TURRET III", 970, 538);
  rect(982, 544, 64, 64);
  image(f_turret_1, 982, 544, 64, 64);
  rect(1050, 544, 64, 64);
  image(f_turret_2, 1050, 544, 64, 64);
  rect(1118, 544, 64, 64);
  image(f_turret_3, 1118, 544, 64, 64);
  rect(1186, 544, 64, 64);
  image(f_turret_4, 1186, 544, 64, 64);

  rect(988, 616, 256, 256);
  for (int i = 0; i<12; i++) {
    textSize(30);
    if (purchase == 1 || purchase == 2 || purchase == 3 || purchase == 4) {
      text("Base Turret", 995, 646);
      if (purchase <=4) {
        text(purchase, 1166, 648);
      }
    }

    if (purchase == 5 || purchase == 6 || purchase == 7 || purchase == 8) {
      text("Laser Turret", 995, 646);
      if (purchase <=8 && purchase >= 5) {
        text(purchase-4, 1176, 648);
      }
    }

    if (purchase == 9 || purchase == 10 || purchase == 11 || purchase == 12) {
      text("Ice Turret", 995, 646);
      if (purchase <=12 && purchase >= 6) {
        text(purchase-8, 1146, 647);
      }
    }
    textSize(24);

    if (purchase == 1 ) {    
      image(l_turret_1, 1052, 760);
      text("Damage:", 995, 675);
      text(purchase, 1150, 675);
    }
    if (purchase == 2 ) {    
      image(l_turret_2, 1052, 760);
      text("Damage:", 995, 675);
      text(purchase, 1150, 675);
    }
    if (purchase == 3) {    
      image(l_turret_3, 1052, 760);
      text("Damage:", 995, 675);
      text(4, 1150, 675);
    }
    if (purchase == 4) { 
      image(l_turret_4, 1052, 760);
      text("Damage:", 995, 675);
      text(8, 1150, 675);
    }
    if (purchase == 5) {    
      image(b_turret_1, 1052, 760);
      text("Damage:", 995, 675);
      text(8, 1150, 675);
    }
    if (purchase == 6) { 
      image(b_turret_2, 1052, 760);
      text("Damage:", 995, 675);
      text(16, 1150, 675);
    }
    if (purchase == 7) {  
      image(b_turret_3, 1052, 760);
      text("Damage:", 995, 675);
      text(32, 1150, 675);
    }
    if (purchase == 8) {    
      image(b_turret_4, 1052, 760);
      text("Damage:", 995, 675);
      text(64, 1150, 675);
    }
    if (purchase == 9) {    
      image(f_turret_1, 1052, 760);
      text("Damage:", 995, 675);
      text(1, 1150, 675);
    }
    if (purchase == 10) { 
      image(f_turret_2, 1052, 760);
      text("Damage:", 995, 675);
      text(4, 1150, 675);
    }
    if (purchase == 11) {  
      image(f_turret_3, 1052, 760);
      text("Damage:", 995, 675);
      text(16, 1150, 675);
    }
    if (purchase == 12) {   
      image(f_turret_4, 1052, 760);
      text("Damage:", 995, 675);
      text(32, 1150, 675);
    }


    if (purchase ==1) {
      text("Price:", 995, 705);
      text(50, 1150, 705);
    }
    if (purchase ==2) {    
      text("Price:", 995, 705);
      text(200, 1150, 705);
    }
    if (purchase ==3) {    
      text("Price:", 995, 705);
      text(800, 1150, 705);
    }
    if (purchase ==4) {    
      text("Price:", 995, 705);
      text(1600, 1150, 705);
    }
    if (purchase ==5) {    
      text("Price:", 995, 705);
      text(2000, 1150, 705);
    }
    if (purchase ==6) {    
      text("Price:", 995, 705);
      text(3200, 1150, 705);
    }
    if (purchase ==7) {    
      text("Price:", 995, 705);
      text(6400, 1150, 705);
    }
    if (purchase ==8) {    
      text("Price:", 995, 705);
      text(12800, 1150, 705);
    }
    if (purchase ==9) {    
      text("Price:", 995, 705);
      text(250, 1150, 705);
    }
    if (purchase ==10) {    
      text("Price:", 995, 705);
      text(1000, 1150, 705);
    }
    if (purchase ==11) {    
      text("Price:", 995, 705);
      text(4000, 1150, 705);
    }
    if (purchase ==12) {    
      text("Price:", 995, 705);
      text(16000, 1150, 705);
    }


    if (purchase >=1 && purchase <= 12) {
      text("Effect:", 995, 740);
      text("Damage", 1100, 740);
    }
    if (purchase >=5 && purchase <= 8) {
      text("Effect:", 995, 740);
      text("Fast Projectiles", 1060, 770);
    }
    if (purchase >=9 && purchase <= 12) {    
      text("Effect:", 995, 740);
      text("Brittle Effect", 1080, 770);
    }
  }
}
void endMe() {
  if (health <= 0) {
    image(background, 0, 0);
    textSize(250);
    text("YOU LOSE", 40, 400);
    textSize(40);
    text("ENEMIES SLAUGHTERED:", 330, 600);
    text(level, 805, 600);
    text("PRESS ANY BUTTON TO QUIT", 330, 800);
    endMePlease = true;
  }
}

boolean gridspace() {
  if (grid(mouseX, 64) >= 64 && grid(mouseX, 64) <= 192 && grid(mouseY, 64) == 192) {
    return false;
  }
  if (grid(mouseX, 64) >= 384 && grid(mouseX, 64) <= 768 && grid(mouseY, 64) == 192) {
    return false;
  }
  if (grid(mouseX, 64) >= 192 && grid(mouseX, 64) <= 384 && grid(mouseY, 64) == 704) {
    return false;
  }
  if (grid(mouseX, 64) >= 576 && grid(mouseX, 64) <= 768 && grid(mouseY, 64) == 384) {
    return false;
  }
  if (grid(mouseX, 64) >= 576 && grid(mouseX, 64) <= 768 && grid(mouseY, 64) == 576) {
    return false;
  }

  if (grid(mouseY, 64) >= 192 && grid(mouseY, 64) <= 704 && grid(mouseX, 64) == 192) {
    return false;
  }
  if (grid(mouseY, 64) >= 192 && grid(mouseY, 64) <= 704 && grid(mouseX, 64) == 384) {
    return false;
  }
  if (grid(mouseY, 64) >= 192 && grid(mouseY, 64) <= 384 && grid(mouseX, 64) == 768) {
    return false;
  }
  if (grid(mouseY, 64) >= 384 && grid(mouseY, 64) <= 576 && grid(mouseX, 64) == 576) {
    return false;
  }
  if (grid(mouseY, 64) >= 576 && grid(mouseY, 64) <= 832 && grid(mouseX, 64) == 768) {
    return false;
  }

  if (grid(mouseY, 64) >= 0 && grid(mouseY, 64) <= 896 && grid(mouseX, 64) == 0) {
    return false;
  }
  if (grid(mouseY, 64) >= 0 && grid(mouseY, 64) <= 896 && grid(mouseX, 64) >= 960) {
    return false;
  }

  if (grid(mouseX, 64) >= 0 && grid(mouseX, 64) <= 960 && grid(mouseY, 64) == 0) {
    return false;
  }

  if (grid(mouseX, 64) >= 0 && grid(mouseX, 64) <= 960 && grid(mouseY, 64) == 896) {
    return false;
  }

  for (int i = 0; i < turrets.length; i++) {
    if (grid(mouseX, 64) == turrets[i].x && grid(mouseY, 64) == turrets[i].y) {
      return false;
    }
  }
  return true;
}


float grid(float enter, float divideBy) {
  return round(enter/divideBy)*divideBy;
}


void drawBoard() {
  stroke(255, 0, 126, 65);
  for (int i=0; i<14; i++) {
    line(32, 32+64*i, 960, 32+64*i);
  }

  for (int i=0; i<15; i++) {
    line(32+64*i, 32, 32+64*i, 864);
  }

  stroke(147, 206, 243);
  strokeWeight(2);
  line(32, 160, 224, 160);
  line(32, 224, 160, 224);
  line(224, 160, 224, 672);
  line(160, 224, 160, 736);
  line(224, 672, 352, 672);
  line(160, 736, 416, 736);
  line(352, 672, 352, 160);
  line(416, 736, 416, 224);
  line(352, 160, 800, 160);
  line(416, 224, 736, 224);
  line(800, 160, 800, 416);
  line(736, 224, 736, 352);
  line(800, 416, 608, 416);
  line(736, 352, 544, 352);
  line(544, 352, 544, 608);
  line(608, 416, 608, 544);
  line(608, 544, 800, 544);
  line(544, 608, 736, 608);
  line(736, 608, 736, 864);
  line(800, 544, 800, 864);
}