int illusions = 7;
int current = 1;
//toggle illusion activation
boolean active = true;

void setup() {
  size(800, 800);
  surface.setResizable(true);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    surface.setSize(800, 800);
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    surface.setSize(500, 500);
    whitesilu();
    break;
  case 3:
    surface.setSize(400, 500);
    kanizsa();
    break;
  case 4:
    surface.setSize(400,400);
    mbind();
    break;
  case 5:
    surface.setSize(600,500);
    anstis();
    break;
  case 6:
    surface.setSize(700, 300);
    ghaus();
    break;
  case 7:
    surface.setSize(750, 425);
    thorfo();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion

/*
 Scintillating Grid
 Author: E. Lingelbach, 1994
 Code adapted from Rupert Russell implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6);
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}

void whitesilu(){
  noStroke();
  for( int i = 1; i < height/25; i+=2 ){
    fill( 0, 0, 0 );
    rect( 0, 25*i, 300, 25 );
    rect( 400, 25*i, 300, 25 );
    fill( 100, 100, 100 );
    rect( 300, 25*i, 100, 25 );
    rect( 100, 25*(i-1), 100, 25 );
  }
  if(!active){
    noStroke();
    fill( 0, 0, 0 );
    for( int i = 1; i < height/25; i+=2 ){
      rect( 0, 25*(i-1), 100, 25);
      rect( 200, 25*(i-1), 300, 25);
    }

  }

}

void kanizsa(){
  background(140,140,140);
  strokeWeight(3);
  line(200, 100, 75, 325);
  line(75, 325, 325, 325);
  line(325, 325, 200, 100);

  noStroke();
  if( active ){
    ellipseMode(RADIUS);
    fill(0, 0, 0);
    ellipse(75, 175, 35, 35);
    ellipse(325, 175, 35, 35);
    ellipse(200, 400, 35, 35);
  }

  fill(140,140,140);
  triangle(75, 175, 325, 175, 200, 400);
}

int ox1 = -20, oy1 = -20, ox2 = 0, oy2 = 0;
boolean s1 = true, s2 = true;
int speed = 1;

void mbind(){
  background( 180, 180, 180 );
  int o = 20;
  strokeWeight(2);
  line( 100+o+ox1, 200-o+oy1, 200-o+ox1, 100+o+oy1 );
  line( 200+o+ox2, 100+o+oy2, 300-o+ox2, 200-o+oy2 );
  line( 300-o+ox1, 200+o+oy1, 200+o+ox1, 300-o+oy1 );
  line( 200-o+ox2, 300-o+oy2, 100+o+ox2, 200+o+oy2 );

  if( s1 ){
    ox1 += speed;
    oy1 += speed;
    if( ox1 == 20 && oy1 == 20 ){
      s1 = false;
    }
  }
  else {
    ox1 -= speed;
    oy1 -= speed;
    if( ox1 == -20 && oy1 == -20 ){
      s1 = true;
    }
  }

  if( s2 ){
    ox2 += speed;
    oy2 -= speed;
    if( ox2 == 20 && oy2 == -20 ){
      s2 = false;
    }
  }
  else {
    ox2 -= speed;
    oy2 += speed;
    if( ox2 == -20 && oy2 == 20 ){
      s2 = true;
    }
  }

  if( !active ){
    noStroke();
    ellipseMode(RADIUS);
    fill( 140, 10, 20 );
    ellipse(100,200,40,40);
    ellipse(200,100,40,40);
    ellipse(300,200,40,40);
    ellipse(200,300,40,40);
  }
}

int oc = 0, cnt = 0;
boolean anstate = true;

void anstis(){
  if( active ){
    strokeWeight(13);
    for( int i = 0; i <= width/25; i += 1 ){
      line( 25*i, 0, 25*i, height );
    }
  }
  noStroke();
  fill(255, 255, 80);
  rect(0+oc, 200, 50, 20);
  fill(0, 0, 80);
  rect(0+oc, 280, 50, 20);
  if( true ){
    if( anstate ){
      oc += 1;
      if( oc == width - 50 ){ anstate = false; }
    }
    else{
      oc -=1 ;
      if( oc == 0 ){ anstate = true; }
    }
  }
  cnt += 1;
}

void ghaus(){
  background( 180, 180, 180 );
  noStroke();
  fill(60,117,209);
  ellipseMode(CENTER);
  ellipse( 200, 150, 50, 50 );
  ellipse( 500, 150, 50, 50 );

  fill(86, 150, 43);
  if( active ){
    ellipse( 460, 150, 25, 25 );
    ellipse( 540, 150, 25, 25 );
    ellipse( 500, 110, 25, 25 );
    ellipse( 500, 190, 25, 25 );
    ellipse( 530, 120, 25, 25 );
    ellipse( 530, 180, 25, 25 );
    ellipse( 470, 120, 25, 25 );
    ellipse( 470, 180, 25, 25 );

    ellipse(100, 150, 95, 95);
    ellipse(300, 150, 95, 95);
    ellipse(250, 60, 95, 95);
    ellipse(150, 60, 95, 95);
    ellipse(250, 240, 95, 95);
    ellipse(150, 240, 95, 95);
  }
}

void thorfo(){
  background(180,180,180);
  strokeWeight(5);
  line(350, 25, 50, 175);
  line(50, 175, 50, 225);
  line(50, 225, 100, 250);
  line(100, 250, 100, 200);
  line(100, 200, 50, 175);
  line(350, 25, 400, 50);
  line(400, 50, 100, 200);
  line(400, 50, 400, 100);
  line(400, 100, 100, 250);

  line(150, 225, 150, 275);
  line(150, 275, 200, 300);
  line(200, 300, 200, 250);
  line(200, 250, 150, 225);
  line(200, 250, 500, 100);
  line(500, 100, 550, 125);
  line(550, 125, 200, 300);
  line(250, 275, 250, 325);
  line(250, 325, 300, 350);
  line(300, 350, 300, 300);
  line(300, 300, 250, 275);

  line(550, 125, 550, 175);
  line(550, 175, 300, 300);
  line(300, 350, 650, 175);
  line(650, 175, 700, 200);
  line(700, 200, 400, 350);
  line(400, 350, 350, 325);
  line(350, 325, 350, 375);
  line(350, 375, 400, 400);
  line(400, 400, 400, 350);
  line(700, 200, 700, 250);
  line(700, 250, 400, 400);

}
