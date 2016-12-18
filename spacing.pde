class space {
  float x;
  float colourR;
  float colourG;
  float colourB;
}

space makeSpace(float x, float colourR, float colourG, float colourB) {
  space n = new space(); 
  n.x = x;

  n.colourR = colourR;
  n.colourG = colourG;
  n.colourB = colourB;
  return n;
}

void mouseOver() {  // mouseOver highlights the selection of the area in which the cursor is in.
  for (int i = 0; i < 14; i++) {
    space[i] = makeSpace(32+64*i, 255, 0, 126);
  }

  for (int i = 0; i < 14; i++) {
    for (int j = 0; j < 13; j++ ) {
      if (mouseX > space[i].x && mouseX < space[i].x+64) {
        stroke(255, 255, 255);
        if (purchase < 1) {                 //mouseOver a turret you are going to sell
          if (gridspace()) {
            if (mouseY > j*64 +32 && mouseY < j*64 +96) {
              fill(255, 1, 0, 90); 
              rect(32+(64*i), 32+64*j, 64, 64);
            }
          } else if (gridspace() == false) {
            fill(255, 165, 0, 90);                                    // mouseOver the track
            if (mouseY > j*64 +32 && mouseY < j*64 +96) {
              rect(32+(64*i), 32+64*j, 64, 64);
            }
          }
        }
        if (purchase >= 1) {
          if (gridspace()) {
            fill(0, 255, 0, 90); 
            if (mouseY > j*64 +32 && mouseY < j*64 +96) {            //mouseOver area you can place a turret
              rect(32+(64*i), 32+64*j, 64, 64);
            }
          } else {
            fill(255, 165, 0, 90);                                    // mouseOver the track
            if (mouseY > j*64 +32 && mouseY < j*64 +96) {
              rect(32+(64*i), 32+64*j, 64, 64);
            }
          }
        }
      }
    }
  }

  if (mouseX>982 && mouseX<982+64 && mouseY > 288 & mouseY<288+64) {
    fill(255, 0, 126, 65);
    rect(982, 288, 64, 64);
  }

  if (mouseX>1050 && mouseX<1050+64 && mouseY > 288 & mouseY<288+64) {
    fill(255, 0, 126, 65); 
    rect(1050, 288, 64, 64);
  }

  if (mouseX>1118 && mouseX<1118+64 && mouseY > 288 & mouseY<288+64) {
    fill(255, 0, 126, 65); 
    rect(1118, 288, 64, 64);
  }

  if (mouseX>1186 && mouseX<1186+64 && mouseY > 288 & mouseY<288+64) {
    fill(255, 0, 126, 65); 
    rect(1186, 288, 64, 64);
  }

  if (mouseX>982 && mouseX<982+64 && mouseY > 416 & mouseY<416+64) {
    fill(255, 0, 126, 65); 
    rect(982, 416, 64, 64);
  }

  if (mouseX>1050 && mouseX<1050+64 && mouseY > 416 & mouseY<416+64) {
    fill(255, 0, 126, 65); 
    rect(1050, 416, 64, 64);
  }

  if (mouseX>1118 && mouseX<1118+64 && mouseY > 416 & mouseY<416+64) {

    fill(255, 0, 126, 65); 
    rect(1118, 416, 64, 64);
  }

  if (mouseX>1186 && mouseX<1186+64 && mouseY > 416 & mouseY<416+64) {
    fill(255, 0, 126, 65); 
    rect(1186, 416, 64, 64);
  }

  if (mouseX>982 && mouseX<982+64 && mouseY > 544 & mouseY<544+64) {
    fill(255, 0, 126, 65); 
    rect(982, 544, 64, 64);
  }

  if (mouseX>1050 && mouseX<1050+64 && mouseY > 544 & mouseY<544+64) {
    fill(255, 0, 126, 65); 
    rect(1050, 544, 64, 64);
  }

  if (mouseX>1118 && mouseX<1118+64 && mouseY > 544 & mouseY<544+64) {
    fill(255, 0, 126, 65); 
    rect(1118, 544, 64, 64);
  }

  if (mouseX>1186 && mouseX<1186+64 && mouseY > 544 & mouseY<544+64) {
    fill(255, 0, 126, 65); 
    rect(1186, 544, 64, 64);
  }
  if (mouseX>1024 && mouseX<1024+180 && mouseY > 160 & mouseY<160+70) {
    fill(255, 0, 126, 65); 
    rect(1024, 160, 180, 70);
  }
}

void selector() {
  beep.amp(.1);
  beep.play();


  if (mouseX>982 && mouseX<982+64 && mouseY > 288 & mouseY<288+64) {
    fill(255, 0, 126, 65);
    rect(982, 288, 64, 64);
    purchase = 1;
  }


  if (mouseX>1050 && mouseX<1050+64 && mouseY > 288 & mouseY<288+64) {
    fill(0, 255, 0, 90); 
    rect(1050, 288, 64, 64);
    purchase = 2;
  }

  if (mouseX>1118 && mouseX<1118+64 && mouseY > 288 & mouseY<288+64) {
    fill(0, 255, 0, 90); 
    rect(1118, 288, 64, 64);
    purchase = 3;
  }

  if (mouseX>1186 && mouseX<1186+64 && mouseY > 288 & mouseY<288+64) {
    fill(0, 255, 0, 90); 
    rect(1186, 288, 64, 64);
    purchase = 4;
  }

  if (mouseX>982 && mouseX<982+64 && mouseY > 416 & mouseY<416+64) {
    fill(0, 255, 0, 90); 
    rect(982, 416, 64, 64);
    purchase = 5;
  }

  if (mouseX>1050 && mouseX<1050+64 && mouseY > 416 & mouseY<416+64) {
    fill(0, 255, 0, 90); 
    rect(1050, 416, 64, 64);
    purchase = 6;
  }

  if (mouseX>1118 && mouseX<1118+64 && mouseY > 416 & mouseY<416+64) {

    fill(0, 255, 0, 90); 
    rect(1118, 416, 64, 64);
    purchase = 7;
  }

  if (mouseX>1186 && mouseX<1186+64 && mouseY > 416 & mouseY<416+64) {
    fill(0, 255, 0, 90); 
    rect(1186, 416, 64, 64);
    purchase = 8;
  }

  if (mouseX>982 && mouseX<982+64 && mouseY > 544 & mouseY<544+64) {
    fill(0, 255, 0, 90); 
    rect(982, 544, 64, 64);
    purchase = 9;
  }

  if (mouseX>1050 && mouseX<1050+64 && mouseY > 544 & mouseY<544+64) {
    fill(0, 255, 0, 90); 
    rect(1050, 544, 64, 64);
    purchase = 10;
  }

  if (mouseX>1118 && mouseX<1118+64 && mouseY > 544 & mouseY<544+64) {
    fill(0, 255, 0, 90); 
    rect(1118, 544, 64, 64);
    purchase = 11;
  }

  if (mouseX>1186 && mouseX<1186+64 && mouseY > 544 & mouseY<544+64) {
    fill(0, 255, 0, 90); 
    rect(1186, 544, 64, 64);
    purchase = 12;
  }

  if (mouseX>1024 && mouseX<1024+180 && mouseY > 160 & mouseY<160+70) {
    fill(0, 255, 0, 90); 
    rect(1024, 160, 180, 70);
    purchase *= -1;
  }
} 

void greenFill() {

  if (purchase <= -1) {

    fill(0, 255, 0, 90); 
    rect(1024, 160, 180, 70);
    purchase = -1;
  }


  for (int i = 0; i<4; i++) {
    if (purchase == i+1) {
      fill(0, 255, 0, 90); 
      rect(982 + 68*i, 288, 64, 64);
    }
  }

  for (int i = 0; i<4; i++) {
    if (purchase == i+5) {
      fill(0, 255, 0, 90); 
      rect(982 + 68*i, 417, 64, 64);
    }
  }

  for (int i = 0; i<4; i++) {
    if (purchase == i+9) {
      fill(0, 255, 0, 90); 
      rect(982 + 68*i, 544, 64, 64);
    }
  }
}