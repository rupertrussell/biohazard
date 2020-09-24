// Bio-hazard Warning Symbol v453
// January 17 2018
// April 5 2018
// Code by Rupert Russell
// rupert.russell1@gmail.com
// Released under Creative Commons Licence
// Licensed under Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)  
// https://creativecommons.org/licenses/by-nc/4.0/
// Based on the design https://cws.auburn.edu/shared/content/files/1621/biohazard-history.pdf
// http://www.thelogofactory.com/the-biohazard-symbol/
// https://books.google.com.au/books?id=spdxCwAAQBAJ&pg=PA287
// https://books.google.com.au/books?id=spdxCwAAQBAJ&pg=PA286
// https://books.google.com.au/books?id=spdxCwAAQBAJ&pg=PA292
// https://acu-edu-primo.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=TN_medline6053882&context=PC&vid=61ACU&search_scope=61ACU_All&tab=61acu_all&lang=en_US
// https://ia600302.us.archive.org/19/items/federalregister39kunit/federalregister39kunit.pdf
// https://archive.org/stream/federalregister39kunit#page/n849/mode/1up
// https://commons.wikimedia.org/wiki/File:Biohazard_Symbol_Specification.png

//https://99percentinvisible.org/article/biohazard-symbol-designed-to-be-memorable-but-meaningless/
int counter = 0;
boolean draw = true;
float aX = 0;
float aY = 0;
float a = 16; // Basic Unit size of Warning symbol (was 50)
float b = 3.5* a;
float c = 4 * a;
float d = 6 * a;
float e = 11 * a;
float f = 15 * a;
float g = 21 * a;
float h = 30 * a;

float xOffset = 0;
float yOffset = 0;

float arcRadius = 0;
float arcGap = 0;

float x1=  0;
float y1=  0;

float x2=  0;
float y2=  0;

float x3=  0;
float y3=  0;  

float xStart = 0;
float yStart = 0;

float xStop = 0;
float yStop = 0;

float lineWidth = 0;
float lineHeight = 0;

PGraphics foreground;
PGraphics clearLines;
PGraphics arc;
PGraphics mask;
PGraphics combined;
void setup() {
  size(1350, 1350); // 3800 with a at 50
  int xWidth = 1350; // 800 with a at 10
  int yHeight = 1350;
  foreground = createGraphics(xWidth, yHeight);
  clearLines = createGraphics(xWidth, yHeight);
  arc = createGraphics(xWidth, yHeight);
  mask = createGraphics(xWidth, yHeight);
  combined = createGraphics(xWidth, yHeight);
  background(255, 255, 255);
  // noLoop();
}
void draw() {

  // Basic Unit A Markeres

  /*
  strokeWeight(1);
   stroke(255, 255, 0);
   line(width/2 + a*5.00, height/2 - a*1.08, width/2 + a*aX, height/2 + a*aY); 
   */

  if (draw == true) {
    drawBio();
    draw = false;
    // draw = true;
  }
  println("mouseX = " +mouseX);
  println("mouseY = " +mouseY);


  aX = (mouseX - width/2) /a;
  aY = (mouseY - height / 2) /a  +18.0;

  println("mouse a X = " + aX);
  println("mouse a Y = " + aY);
}

void drawBio() {

  // initialise the combined layer There is noting in this layer except a white backgroud we will build this layer from the component layers below
  combined.beginDraw();
  combined.background(255);
  combined.endDraw();
  foreground.beginDraw();
  foreground.noStroke();
  // 3 Main Circles
  foreground.pushMatrix(); // remember the current default screen settings
  foreground.translate(width / 2, height / 2); // move the origin to the center of the screen
  foreground.rotate(radians(90 - 90));
  foreground.fill(255, 69, 0);
  foreground.ellipse(0, -11 * a, a * 30, a * 30);
  foreground.popMatrix(); // return to the default screen settings for rotation
  foreground.pushMatrix(); // remember the current default screen settings
  foreground.translate(width / 2, height / 2);
  foreground.rotate(radians(210 - 90));
  foreground.ellipse(0, 0 - 11 * a, a * 30, a * 30);
  foreground.popMatrix(); // return to the default screen settings for rotation
  foreground.pushMatrix(); // remember the current default screen settings
  foreground.translate(width / 2, height / 2);
  foreground.rotate(radians(330 - 90 ));
  foreground.ellipse(0, 0 - 11 * a, a * 30, a * 30);
  foreground.popMatrix(); // return to the default screen settings for rotation
  foreground.endDraw();
  // 3 inner white Circles
  foreground.beginDraw();
  foreground.pushMatrix(); // remember the current default screen settings
  foreground.translate(width / 2, height / 2); // move the origin to the center of the screen
  foreground.rotate(radians(90 - 90));
  foreground.fill(255, 255, 255);
  foreground.ellipse(0, -15 * a, a * 21, a * 21);
  foreground.popMatrix(); // return to the default screen settings for rotation
  foreground.pushMatrix(); // remember the current default screen settings
  foreground.translate(width / 2, height / 2);
  foreground.rotate(radians(210 - 90));
  foreground.ellipse(0, 0 - 15 * a, a * 21, a * 21);
  foreground.popMatrix(); // return to the default screen settings for rotation
  foreground.translate(width / 2, height / 2);
  foreground.rotate(radians(330 - 90 ));
  foreground.ellipse(0, 0 - 15 * a, a * 21, a * 21);
  // foreground.clear();// center white circle
  foreground.noStroke();
  foreground.fill(255);
  foreground.ellipse(0, 0, a * 6, a * 6);
  foreground.endDraw();
  // clear lines -———————————————————-
  clearLines.smooth();
  clearLines.beginDraw();
  clearLines.fill(255, 255, 255);
  clearLines.noStroke();
  clearLines.pushMatrix();
  clearLines.translate(width / 2, height / 2); // move the origin to the center of the screen
  clearLines.rotate(radians(210 - 90 ));
  clearLines.rect( 0.5 * a, - a * 5, a, a * 5);
  clearLines.popMatrix();
  clearLines.endDraw();
  // End clear lines -———————————————————-
  // Arc -———————————————————-
  arc.beginDraw();
  arc.fill(255, 69, 0);
  arc.noStroke();
  // first large orange circle
  arc.ellipse(width / 2, height / 2, (e - a + b) * 2, (e - a + b) * 2);
  // White inner circle
  arc.fill(255);
  arc.ellipse(width / 2, height / 2, (e - a) * 2, (e - a) * 2);
  arc.endDraw();
  // End Arc -———————————————————-

  // Magenta masks -—————————
  mask.beginDraw();
  mask.noStroke();
  mask.fill(255, 0, 255);
  mask.pushMatrix(); // remember the current default screen settings
  mask.translate(width / 2, height / 2); // move the origin to the center of the screen
  mask.rotate(radians(90 - 90));
  mask.ellipse(0, 0 - f, (g - a*2), (g - a*2));
  mask.popMatrix(); // return to the default screen settings for rotation
  mask.pushMatrix(); // remember the current default screen settings
  mask.translate(width / 2, height / 2);
  mask.rotate(radians(210 - 90));
  mask.ellipse(0, 0 - f, (g - a*2), (g - a*2));
  mask.popMatrix(); // return to the default screen settings for rotation
  mask.pushMatrix(); // remember the current default screen settings
  mask.translate(width / 2, height / 2);
  mask.rotate(radians(330 - 90 ));
  mask.ellipse(0, 0 - f, (g - a*2), (g - a*2));
  mask.popMatrix(); // return to the default screen settings for rotation
  mask.endDraw();
  // End Magenta masks -—————————//pixel array method for combining layers ********************************// build up the combined image from layers using masks
  mask.loadPixels();
  combined.loadPixels();
  arc.loadPixels();
  foreground.loadPixels();
  // add the 3 arcs to the combined image
  for (int p = 0; p <mask.width * mask.height; p++) {
    if (mask.pixels[p]==#FF00FF) {
      // Make White on PG1 transparent and "show" pg2 pixels through it.
      combined.pixels[p]= arc.pixels[p]; //replace it with the new color
    }
  }
  // add all non white pixels in the foreground to the combined image
  for (int p = 0; p <foreground.width * foreground.height; p++) {
    if (foreground.pixels[p] != #FFFFFF) {
      combined.pixels[p]= foreground.pixels[p]; //replace it with the new color
    }
  }
  mask.updatePixels();//then update the pixels
  arc.updatePixels();//then update the pixels
  combined.updatePixels();//then update the pixels


  // *** Draw 3 white gaps in the 3 main circles ======// Gap in the top circle ***
  combined.fill(255, 0, 255);

  // Gap in top circle

  combined.beginDraw();
  // combined.noSmooth();
  combined.image(combined, 0, 0);
  combined.noStroke();
  combined.fill(255);
  combined.rect(width /2 - c/2, height /2 - h + c /2, c, c);

  // White gap in right hand lower circle
  combined.pushMatrix(); // remember the current default screen settings
  combined.translate(width / 2, height / 2);
  combined.rotate(radians(210 - 90));
  combined.stroke(255);
  combined.fill(255);
  combined.rect(- c/3, - h + c /3, c, c);
  combined.popMatrix();

  // White gap in left lower hand circle
  combined.pushMatrix(); // remember the current default screen settings
  combined.translate(width / 2, height / 2 );
  combined.rotate(radians(330 - 90 ));
  combined.stroke(255);
  combined.fill(255);
  combined.rect(- c/2, - h + c /3, c, c);
  combined.popMatrix();
  combined.endDraw();
  combined.updatePixels();//then update the pixels
  // End Draw 3 white gaps in the 3 main circles ======


  // Draw 3 small white gaps attached to the inner most circle =====// Gap in the top circle
  combined.beginDraw();
  combined.image(combined, 0, 0);
  combined.noStroke();
  combined.stroke(255);
  combined.fill(255);
  combined.rect(width /2 - a/2, height /2 - a * 6, a, a * 4);
  // White gap in right hand lower circle
  combined.pushMatrix(); // remember the current default screen settings
  combined.translate(width / 2, height / 2 );
  combined.stroke(0);
  combined.popMatrix(); // restore the default screen settings
  // right hand side line
  combined.pushMatrix(); // remember the current default screen settings
  // combined.translate(width / 2, height / 2 + a /2 );
  combined.translate(width / 2, height / 2 );
  combined.stroke(255);
  combined.noStroke();
  combined.rotate(radians(210 + 90));
  combined.fill(255);
  combined.rect(0 - a /2, 0 + a /2, a, a * 6);
  combined.line(0, 0 + a /2, 100, 600);
  combined.popMatrix();
  // White gap in left lower hand circle
  combined.pushMatrix(); // remember the current default screen settings
  combined.translate(width / 2 - a, height / 2 );
  combined.stroke(255);
  combined.noStroke();
  combined.rotate(radians(330 + 90));
  combined.fill(255);
  combined.rect(0, 0, a, a * 6);
  combined.popMatrix();
  combined.endDraw();
  combined.updatePixels();//then update the pixels
  // End Drawing 3 small white gaps attached to the inner most circle =====// display the final results

  background(255);
  image(arc, 0, 0);
  // save("arc.png");
  background(255);
  image(foreground, 0, 0);
  // save("foreground.png");
  background(255);
  image(mask, 0, 0);
  //  save("mask.png");
  background(255);
  image(foreground, 0, 0);
  image(mask, 0, 0);
  //  save("mask+arcs.png");
  background(255);
  image(combined, 0, 0);


  // Adding Guidelines -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  // CL Text TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
  textSize(a*1.5);
  fill(0);
  textAlign(CENTER, CENTER);
  text("C", width/2 -a*27.5, height/2 - a*.7);
  text("L", width/2 -a*27.1, height/2 - a*.1);

  text("C", width/2 +a*35.5, height/2 - a*.7);
  text("L", width/2 +a*35.8, height/2 - a*.1);

  //  CL for lower Vertical Center line
  text("C", width/2, height/2 + a*27.1);
  text("L", width/2 +a*.3, height/2 + a*27.7);

  // Text for Basic Unit A in Lower Right Cluster
  text("Basic unit  ", width/2 + a*11, height/2 - a*6);
  text("A", width/2 + a*6.5, height/2 - a*4.6); // Left Bottom A
  text("A", width/2 + a*12.4, height/2 - a*7.5);  // Right Top A

  text("A", width/2 + a*7.4, height/2 + a*9.2); // for A on ARC

  text("B", width/2 + a*18.5, height/2 - a*12.3);  // BBB

  text("C", width/2, height/2 - a*22.9);             // CCC 22.9
  text("D", width/2, height/2 - a*6.9);              // DDD
  text("E", width/2 + a*26, height/2 - a*11 /2);     // EEE
  text("F", width/2 + a*29.5, height/2 - a*15 /2);   // FFF
  text("G", width/2, height/2 - a*28.6);             // GGG
  text("H", width/2, height/2 - a*33.1);             // HHH

  textSize(a*1.6);
  text("210°", width/2 + a*18.5, height/2 + a*7);       // 210 degrees

  text("330°", width/2 + a*-15, height/2 + a*12);       // 330 degrees

  text("90°", width/2 + a*-3.2, height/2 + a*-19.6);    // 90 degrees
  // ALT while typing 0176 on the numeric keypad.

  text("Dimension", width/2 - a*19, height/2 + a*32);   // Dimenstion
  text("Units", width/2 - a*21, height/2 + a*36);       // Units

  text("A", width/2 - a*11, height/2 + a*32);       // AAA
  text("1", width/2 - a*11, height/2 + a*36);       // AAA

  text("B", width/2 - a*6, height/2 + a*32);       // BBB
  text("3.5", width/2 - a*6, height/2 + a*36);     // BBB

  text("C", width/2 - a*1, height/2 + a*32);       // CCC
  text("4", width/2 - a*1, height/2 + a*36);       // CCC

  text("D", width/2 - a*-4, height/2 + a*32);       // DDD
  text("6", width/2 - a*-4, height/2 + a*36);       // DDD

  text("E", width/2 - a*-9, height/2 + a*32);       // EEE
  text("11", width/2 - a*-9, height/2 + a*36);      // EEE

  text("F", width/2 - a*-14, height/2 + a*32);       // EEE
  text("15", width/2 - a*-14, height/2 + a*36);      // EEE

  text("G", width/2 - a*-19, height/2 + a*32);       // GGG
  text("21", width/2 - a*-19, height/2 + a*36);      // GGG

  text("H", width/2 - a*-24, height/2 + a*32);       // HHH
  text("30", width/2 - a*-24, height/2 + a*36);      // HHH

  // end Test TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

  stroke(0);
  strokeWeight(1); // was 2

  // start table

  line(width/2 - a*24.5, height/2 + a*30, width/2 + a*26.5, height/2 + a*30); // top
  line(width/2 - a*24.5, height/2 + a*34, width/2 + a*26.5, height/2 + a*34); // middle
  line(width/2 - a*24.5, height/2 + a*38, width/2 + a*26.5, height/2 + a*38); // bottom

  line(width/2 - a*24.5, height/2 + a*30, width/2 - a*24.5, height/2 + a*38); // left
  line(width/2 + a*26.5, height/2 + a*30, width/2 + a*26.5, height/2 + a*38); // right

  line(width/2 - a*13.5, height/2 + a*30, width/2 - a*13.5, height/2 + a*38); // 0
  line(width/2 - a*8.5, height/2 + a*30, width/2 - a*8.5, height/2 + a*38);   // A
  line(width/2 - a*3.5, height/2 + a*30, width/2 - a*3.5, height/2 + a*38);   // B
  line(width/2 - a*-1.5, height/2 + a*30, width/2 - a*-1.5, height/2 + a*38);   // C
  line(width/2 - a*-6.5, height/2 + a*30, width/2 - a*-6.5, height/2 + a*38);   // D
  line(width/2 - a*-11.5, height/2 + a*30, width/2 - a*-11.5, height/2 + a*38);   // E
  line(width/2 - a*-16.5, height/2 + a*30, width/2 - a*-16.5, height/2 + a*38);   // F
  line(width/2 - a*-21.5, height/2 + a*30, width/2 - a*-21.5, height/2 + a*38);   // F
// line(width/2 - a*-26.5, height/2 + a*30, width/2 - a*-26.5, height/2 + a*38);   // F






  // end table


  // Center Dash
  line(width/2 - a, height/2, width/2 + a, height/2);
  line(width/2, height/2 - a, width/2, height/2 + a);

  //Horozontal Center Line CL

  stroke(0, 0, 0);
  line(width/2 - a*2, height/2, width/2 - a*15.6, height/2);    //1
  line(width/2 + a*2, height/2, width/2 + a*15.6, height/2);

  line(width/2 - a*16.6, height/2, width/2 - a*17.6, height/2);     //3.1
  line(width/2 + a*16.6, height/2, width/2 + a*17.6, height/2);     // 0.5

  line(width/2 - a*18.6, height/2, width/2 - a*26.5, height/2);     //
  line(width/2 + a*18.6, height/2, width/2 + a*34.5, height/2);     //28

  // Guides for C CCC
  line(width/2 + 2*a, height/2 - a*22.6 - 1.5*a, width / 2 + 2*a, height/2 - a*22.9 + 1.5*a);  // Right of C
  line(width/2 - 2*a, height/2 - a*22.6 - 1.5*a, width / 2 - 2*a, height/2 - a*22.9 + 1.5*a);  // Left of C

  // Guides for E EEE 

  // Left most horizontal line EEE
  stroke(0, 0, 0);
  xStart = 2;
  yStart = 11;
  xStop  = 6.7;
  yStop  = 11;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // smalest most horizontal line EEE
  stroke(0, 0, 0);
  xStart = 8.4;
  yStart = 11;
  xStop  = 9.4;
  yStop  = 11;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // Middle horizontal line EEE
  stroke(0, 0, 0);
  xStart = 10.4;
  yStart = 11;
  xStop  = 14.4;
  yStop  = 11;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // right horizontal line EEE
  stroke(0, 0, 0);
  xStart = 15.3;
  yStart = 11;
  xStop  = 17.5;
  yStop  = 11;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // right most horizontal line EEE
  stroke(0, 0, 0);
  xStart = 19.5;  
  yStart = 11;
  xStop  = 28;
  yStop  = 11;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 



  stroke(0, 0, 0);

  // Vertical lines for EEE
  // line(width/2 + 2*a, height/2 - a*11, width/2 + 28*a, height/2 - a*11);     //28 wide
  stroke(0, 0, 0);


  line(width/2 + 26*a, height/2 - a*0.5, width/2 + 26*a, height/2 - a*4.0 );   //4.3 high
  line(width/2 + 26*a, height/2 - a*6.5, width/2 + 26*a, height/2 - a*10.5);   //28 high

  // Cross hair for top of E 2a long
  line(width/2 - a, height/2 - a*11, width/2 + a, height/2 - a*11);     //2

  // Default Arrow Translated to top of E EEE
  pushMatrix();
  translate(width / 2, height / 2 );
  fill(0);
  rotate(radians(90));

  translate(a*-12, a*-26.8 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();

  // Default Arrow Translated to bottom of E EEE
  pushMatrix();
  translate(width / 2, height / 2 );
  fill(0);
  rotate(radians(90+180));

  translate(a*-1, a*25.3 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();
  // End Guides for EEE --------------------------------------------


  // Start Guides for FFF ------------------------------------------

  // Guides for F FFF
  // stroke(0, 0, 255);
  //  line(width/2 + 2*a, height/2 - a*15, width/2 + 31*a, height/2 - a*15);     //28 wide Top Line for F
  stroke(0, 0, 0);
  line(width/2 + 2*a, height/2 - a*15, width/2 + 9.9*a, height/2 - a*15);     //28 wide Top Line for F
  line(width/2 + 10.9*a, height/2 - a*15, width/2 + 13.9*a, height/2 - a*15);     //28 wide Top Line for F
  line(width/2 + 14.8*a, height/2 - a*15, width/2 + 31*a, height/2 - a*15);     //28 wide Top Line for F



  stroke(0, 0, 0);
  line(width/2 + 29.5*a, height/2 - a*8.5, width/2 + 29.5*a, height/2 - a*14.5);   //  Top
  line(width/2 + 29.5*a, height/2 - a*0.5, width/2 + 29.5*a, height/2 - a*6.0 );   // Bottom
  stroke(0, 0, 0);

  // Cross hair for F
  line(width/2 - a, height/2 - a*15, width/2 + a, height/2 - a*15);     // Cross Hair for F

  //  Arrow Translated to top of F FFF
  pushMatrix();

  translate(width / 2, height / 2 );
  rotate(radians(90));

  translate(a*-15.96, a*-30.25 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();
  fill(0);

  //  Arrow Translated to bottom of F FFF
  pushMatrix();
  translate(width / 2, height / 2 );
  rotate(radians(90+180));

  translate(a*-1, a*28.77 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();


  // End Guides for FFF --------------------------------------------


  // Start of Guides for AAA Horizontal Line Below E
  stroke(0, 0, 255);
  // line(width/2 + 0.5*a, height/2 - a*10.1, width/2 + 23*a, height/2 - a*10.1);     //28 wide Top Line for F 
  stroke(0, 0, 0);


  // Lower Left most horizontal line AAA
  stroke(0, 0, 0);
  xStart = 2.5;
  yStart = 10.1;
  xStop  = 7.2;
  yStop  = 10.1;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // Lower smalest most horizontal line AAA
  stroke(0, 0, 0);
  xStart = 8.4;
  yStart = 10.1;
  xStop  = 9.0;
  yStop  = 10.1;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // Lower Middle horizontal line AAA
  stroke(0, 0, 0);
  xStart = 10.0;
  yStart = 10.1;
  xStop  = 14.4;
  yStop  = 10.1;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // Lower right horizontal line AAA
  stroke(0, 0, 0);
  xStart = 15.3;
  yStart = 10.1;
  xStop  = 23;
  yStop  = 10.1;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // End of Guides for A Horizontal Line Below E


  // Start of Guides for B Horizontal Line Below F
  stroke(0, 0, 0);
  line(width/2 + 0.5*a, height/2 - a*13.5, width/2 + 9.8*a, height/2 - a*13.5);     //28 wide Top Line for F
  line(width/2 + 10.9*a, height/2 - a*13.5, width/2 + 14.2*a, height/2 - a*13.5);     //28 wide Top Line for F
  line(width/2 + 15*a, height/2 - a*13.5, width/2 + 28*a, height/2 - a*13.5);

  // End of Guides for top B Horizontal Line Below F

  // Vertical Center Line CL
  stroke(0, 0, 0);
  line(width/2, height/2 - a*2, width / 2, height/2 - a*5.9); //1.0
  line(width/2, height/2 + a*2, width / 2, height/2 + a*10.2); //1.7


  line(width/2, height/2 - a*7.8, width / 2, height/2 - a*9.5); // 2a long

  line(width/2, height/2 - a*10.5, width / 2, height/2 - a*13); //
  line(width/2, height/2 - a*14, width / 2, height/2 - a*16); // 
  line(width/2, height/2 - a*16.5, width / 2, height/2 - a*18.5); // 

  stroke(0, 0, 0);
  line(width/2, height/2 - a*19, width / 2, height/2 - a*21.3);  // 21.7

  yStart = 24;
  yStop  = 27;

  stroke(0);
  line(width/2, height/2 - a*yStart, width / 2, height/2 - a*yStop);  // 2.7 Below C


  yStart = 28 + 1.8;
  yStop  = 28 + 1.8 + 1.5;

  stroke(0, 0, 0);
  line(width/2, height/2 - a*yStart, width / 2, height/2 - a*yStop);  // 2.7 Below C

  // continuation of lower Vertical Center Line 

  // stroke(255, 255, 0);
  line(width/2, height/2 + a*11.2, width / 2, height/2 + a*12.2); // 1 with a .5 gap;
  line(width/2, height/2 + a*13.2, width / 2, height/2 + a*18.5);  // 3.5 with a .5 gap **

  line(width/2, height/2 + a*19.5, width / 2, height/2 + a*20.5);  // 1 with a .5 gap
  line(width/2, height/2 + a*21.5, width / 2, height/2 + a*26.0);  // 6 with a .5 gap
  stroke(0);

  // Guides for D DDD
  line(width/2 - a*3.05, height/2, width / 2 - a*3.05, height/2 - a*7.5); // 
  line(width/2 + a*3.05, height/2, width / 2 + a*3.05, height/2 - a*7.5); //

  // horizontal lines for D Arrows
  line(width/2 - a*1.2, height/2 - a*6.75, width/2 - a*2.05, height/2 - a*6.75); 
  line(width/2 + a*1.2, height/2 - a*6.75, width/2 + a*2.05, height/2 - a*6.75);



  // Guides for G GGG
  // top vertical line
  stroke(0, 0, 0);
  xStart = 10.6;
  xStop  = 10.6;

  yStart = 22.5;
  yStop  = 30;

  line(width/2 - a*xStart, height/2 - a*yStart, width / 2 - a*10.6, height/2 - a*yStop); // 
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*10.6, height/2 - a*yStop); //

  // bottom vertical line
  stroke(0, 0, 0);
  xStart = 10.6;
  xStop  = 10.6;

  yStart = 17;
  yStop  = 20.8;

  line(width/2 - a*xStart, height/2 - a*yStart, width / 2 - a*10.6, height/2 - a*yStop); // 
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*10.6, height/2 - a*yStop); //

  stroke(0, 0, 0);

  // horizontal lines for G Arrows
  lineHeight = 28.4;

  line(width/2 - a*9.9, height/2 - a*lineHeight, width/2 - a*1.3, height/2 - a*lineHeight); 
  line(width/2 + a*9.9, height/2 - a*lineHeight, width/2 + a*1.3, height/2 - a*lineHeight);
  stroke(0, 0, 0);

  // Left Arrows for G GGG
  noStroke();
  x1= width/2  - a*10.555;
  y1= height/2 - a*lineHeight +0.5;

  x2= width/2  - a*10.555 + a;
  y2= height/2 - a*lineHeight +0.5 - a*0.27;

  x3= width/2  - a*10.555 + a;
  y3= height/2 - a*lineHeight +0.5 + a*0.27;

  triangle(x1, y1, x2, y2, x3, y3);

  // Right Arrows for G GGG
  x1= width/2  + a*10.6;
  y1= height/2 - a*lineHeight +0.5;

  x2= width/2  + a*10.6 -a;
  y2= height/2 - a*lineHeight +0.5 - a*0.27;

  x3= width/2  + a*10.6 -a;
  y3= height/2 - a*lineHeight +0.5 + a*0.27;
  triangle(x1, y1, x2, y2, x3, y3);
  stroke(0); // Turn Stroke Back on keep this line
  // end arrows for GGG

  // --------  HHH ----------------

  // Guides for H HHH
  // vertical line

  xStart = 15;
  xStop  = 15;

  yStart = 13.5;
  yStop  = 35;

  line(width/2 - a*xStart, height/2 - a*yStart, width / 2 - a*xStop, height/2 - a*yStop); // 
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); //


  // horizontal lines for H Arrows
  lineHeight = 33;
  lineWidth = 9.9 + 4.5;

  line(width/2 - a*lineWidth, height/2 - a*lineHeight, width/2 - a*1.3, height/2 - a*lineHeight); 
  line(width/2 + a*lineWidth, height/2 - a*lineHeight, width/2 + a*1.3, height/2 - a*lineHeight);
  stroke(0, 0, 0);

  // Left Arrows for H HHH
  noStroke();

  x1= width/2  - a*15;
  y1= height/2 - a*lineHeight +0.5;

  x2= width/2  - a*15 + a;
  y2= height/2 - a*lineHeight +0.5 - a*0.27;

  x3= width/2  - a*15 + a;
  y3= height/2 - a*lineHeight +0.5 + a*0.27;

  triangle(x1, y1, x2, y2, x3, y3);

  // Right Arrows for H HHH
  x1= width/2  + a*15;
  y1= height/2 - a*lineHeight +0.5;

  x2= width/2  + a*15 -a;
  y2= height/2 - a*lineHeight +0.5 - a*0.27;

  x3= width/2  + a*15 -a;
  y3= height/2 - a*lineHeight +0.5 + a*0.27;
  triangle(x1, y1, x2, y2, x3, y3);
  // end ------ HHH 



  // Left Arrows for C CCC
  fill(0, 0, 0);
  noStroke();

  x1= width/2  - a*2;
  y1= height/2 - a*22.7;

  x2= width/2  - a*2 + a;
  y2= height/2 - a*22.7 - a*0.25; // 0.25

  x3= width/2  - a*2 + a;
  y3= height/2 - a*22.7 + a*0.25;  // 0.25
  triangle(x1, y1, x2, y2, x3, y3);

  // Right Arrows for C CCC

  fill(0, 0, 0);

  x1= width/2  + a*2;
  y1= height/2 - a*22.7;

  x2= width/2  + a*1;
  y2= height/2 - a*22.7 + 0.25*a ; // 0.25

  x3= width/2  + a*1;
  y3= height/2 - a*22.7 -0.25*a ;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);



  // Left Arrows for D DDD
  fill(0);
  noStroke();
  x1= width/2  - a*3.05;
  y1= height/2 - a*6.75;

  x2= width/2  - a*3.05 + a;
  y2= height/2 - a*7.00; // 0.25

  x3= width/2  - a*3.05 + a;
  y3= height/2 - a*6.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);

  // Right Arrows for D

  fill(0, 0, 0);

  x1= width/2  + a*3.05;
  y1= height/2 - a*6.75;

  x2= width/2  + a*3.05 - a;
  y2= height/2 - a*7.00;

  x3= width/2  + a*3.05 - a;
  y3= height/2 - a*6.5;

  triangle(x1, y1, x2, y2, x3, y3);

  // ================== 45 degree Basic Unit A AAA Markeres =====================
  pushMatrix();
  translate(width / 2, height / 2 );
  stroke(0);
  rotate(radians(210 ));
  line(-a*3.74, -a*3.5, -a*3.74, a*6.0 ); // single line with a white gap 
  popMatrix();
  stroke(0, 0, 0);

  // White gap in right hand lower circle
  pushMatrix();
  translate(width / 2, height / 2 );
  noStroke();
  rotate(radians(210 + 90));
  fill(255);
  rect(0 - a /2, a + a /2, a, a *3 );
  popMatrix();

  // start 210 degree arrow v002
  xOffset = a* -0;
  yOffset = a* 19.5;
  lineHeight = -0;
  fill(0, 0, 0);
  pushMatrix();
  translate(width/2, height/2 );

  rotate(radians(-60));
  translate(xOffset, yOffset );
  noStroke();

  x1=  a*0;
  y1=  a*lineHeight +0;

  x2=  a*0 + a;
  y2=  a*lineHeight +0 - a*0.27;

  x3=  a*0 + a;
  y3=  a*lineHeight +0 + a*0.27;

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();
  // end 210 degree arrow v002

  // start 330 degree arrow v002
  // noStroke();

  xOffset = a* -0;
  yOffset = a* 19.5;
  lineHeight = -0;
  fill(0, 0, 0);
  pushMatrix();
  translate(width/2, height/2 );

  rotate(radians(60));
  translate(xOffset, yOffset );
  noStroke();

  x1=  a*0;
  y1=  a*lineHeight +0;

  x2=  a*0 + a;
  y2=  a*lineHeight +0 - a*0.27;

  x3=  a*0 + a;
  y3=  a*lineHeight +0 + a*0.27;

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();
  // end 330 degree arrow v002

  // start 90 degree arrow
  fill(0, 0, 0);

  xOffset = a*-2;
  yOffset = a*3.21;

  x1= width/2 +xOffset + a*2;
  y1= height/2 +yOffset - a*22.7;

  x2= width/2 +xOffset + a*1;
  y2= height/2 +yOffset - a*22.7 + 0.25*a ; // 0.25

  x3= width/2 +xOffset + a*1;
  y3= height/2 +yOffset - a*22.7 -0.25*a ;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  // end 90 degree arrow
  // ================== End Basic Unit A Markeres =====================

  // ================== Basic Unit A Markeres on arc =====================

  // Default Arrow for Arc guide lines for Basic Unit A AAA Translated to top %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  pushMatrix();
  translate(width / 2, height / 2 );
  fill(0, 0, 0);
  translate(a*2.95, a*10.75);
  rotate(radians(-25));
  noStroke();
  x1=  a*1;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*0.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();


  //  Arrow for Arc guide lines for Basic Unit A AAA Translated to bottom
  pushMatrix();
  translate(width / 2, height / 2 );
  fill(0, 0, 0);
  translate(a*4.9, a*10.0);
  rotate(radians(-16));
  noStroke();
  x1=  -a*2;
  y1=  a*0.75;

  x2=  -a*3;
  y2=  a*1.00; // 0.25

  x3=  -a*3;
  y3=  a*0.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();

  noFill();

  // Arc guide lines for Basic Unit A
  stroke(0, 0, 0);
  arc(width / 2, height / 2, 23.5*a, 23.5*a, radians(56.5), radians(65));
  stroke(0, 0, 0);
  arc(width / 2, height / 2, 23.5*a, 23.5*a, radians(76), radians(88));

  // Orange Rectangle below gap in right hand lower circle
  pushMatrix();
  translate(width / 2, height / 2 );
  noStroke();
  rotate(radians(210 + 90));
  fill(255, 69, 0);
  rect(-a*1, a*3, a *0.5, a*1.2 );
  popMatrix();

  // Orange Rectangle above gap in right hand lower circle456
  pushMatrix();
  translate(width / 2, height / 2 );
  noStroke();
  rotate(radians(210 + 90));
  fill(255, 69, 0);
  // fill(255, 0, 255);
  rect(+a*.5, a*3, a *0.5, a*1.2 );
  popMatrix();

  // Default Arrow Translated to top 
  pushMatrix();
  translate(width / 2, height / 2 );
  fill(0);
  rotate(radians(210 + 90));

  translate(a*-0.5, a*3 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*0.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();

  // Default Arrow Translated to bottom 
  pushMatrix();
  translate(width / 2, height / 2 );
  fill(0);
  rotate(radians(210 + 90 + 180));

  translate(a*-0.5, a*-4.5 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*0.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();
  stroke(0); // Turn Stroke back on leave this
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  // ================== End Basic Unit A AAA Markeres on arc =====================

  // ------------------ Start Basic Unit A AAA Vertical Guide Lines  ------------------

  // top vertical line for AAAA
  stroke(0, 0, 0);
  xStart = 12.34;
  xStop  = 12.34;

  yStart = 11.5;
  yStop  = 12.8;


  // bottom vertical line for AAAA
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 
  stroke(0, 0, 0);
  xStart = 12.34;
  xStop  = 12.34;

  yStart = 8.3; // bottom 
  yStop  = 9.5;  // top

  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // ------------------ End Basic Unit A AAA Vertical Guide Lines  ------------------


  // ------------------ Start Arrows for Basic Unit A AAA Vertical Guide Lines  ------------------

  // Default Arrow Translated to top of A AAAA 
  pushMatrix();
  translate(width / 2, height / 2 );
  rotate(radians(90 + 180));
  translate(a*10, a*11.6 ); // top arrow 
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();

  // Arrow Translated to bottom of A AAAA
  pushMatrix();
  translate(width / 2, height / 2 );
  rotate(radians(90));

  translate(a*-11.1, a*-13.1 );
  noStroke();
  x1=  a;
  y1=  a*0.75;

  x2=  a*2;
  y2=  a*1.00; // 0.25

  x3=  a*2;
  y3=  a*.5;  // 0.25

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();


  // ------------------ End Arrows for Basic Unit A AAA Vertical Guide Lines  ------------------

  // -- Start of BBB

  // top vertical line for BBBB
  stroke(0, 0, 0);
  xStart = 18.5;
  yStart = 14.5;
  xStop  = 18.5;
  yStop  = 16.8;
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // bottom vertical line for BBBB
  stroke(0, 0, 0);
  xStart = 18.5;
  yStart = 8.3; // bottom 
  xStop  = 18.5;
  yStop  = 9.5;  // top
  line(width/2 + a*xStart, height/2 - a*yStart, width / 2 + a*xStop, height/2 - a*yStop); // 

  // Default Arrow Translated to top of B BBBB 
  pushMatrix();
  translate(width / 2, height / 2 );
  rotate(radians(90 + 180));
  translate(a*12.5, a*17.8); // top arrow 
  noStroke();
  x1=  a;
  y1=  a*0.75;
  x2=  a*2;
  y2=  a*1.00;
  x3=  a*2;
  y3=  a*.5; 
  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();

  // Default Arrow Translated to bottom of B BBBB
  pushMatrix();
  translate(width / 2, height / 2 );
  rotate(radians(90));

  translate(a*-11.1, a*-19.3);
  noStroke();
  x1=  a;
  y1=  a*0.75;
  x2=  a*2;
  y2=  a*1.00; 
  x3=  a*2;
  y3=  a*.5;

  triangle(x1, y1, x2, y2, x3, y3);
  popMatrix();

  // -- End of BBB



  // White gap in left hand lower circle
  noStroke();
  pushMatrix(); 
  translate(width / 2, height / 2 );
  rotate(radians(330 - 90));
  noStroke();
  fill(255, 255, 255);
  rect(- c/2, - h + c/2, c, c);
  popMatrix();

  // White gap in right hand lower circle
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(radians(210 - 90));
  noStroke();
  fill(255);
  rect(- c/2, - h + c/2, c, c);
  popMatrix();

  // Adding Guidelines

  // draw 330 degree line 
  stroke(0, 0, 0);
  pushMatrix();
  translate(width/2, height /2);
  rotate(radians(330 + 180));
  line(a*2, 0, a*15.6, 0);    //1
  line(a*16.6, 0, a*17.6, 0);     //3.1
  line(a*18.6, 0, a*28.5, 0);     //
  line(a*29.5, 0, a*30.5, 0);     // extra


  popMatrix();


  arcRadius = 39;
  arcGap = 13;
  // 210 degree arc
  noFill();
  // arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(14), radians(29));
  stroke(0, 0, 0);
  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(14), radians(29-arcGap *.85));
  stroke(0, 0, 0);
  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(12 + arcGap), radians(29));
  stroke(0, 0, 0);
  // 330 degree arc
  //  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(134), radians(149));
  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(134), radians(149 -arcGap));
  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(134 + arcGap), radians(149));

  // 90 degree arc

  //  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(180 + 90 - 15), radians(180 + 90));

  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(180 + 90 - 18.4), radians(180 + 95 - arcGap *1.5));

  arc(width/2, height/2, arcRadius*a, arcRadius*a, radians(180 + 90 - 18.8 + arcGap * 1), radians(180 + 89));
  stroke(0, 0, 0);


  // draw 210. degree line `````````````````````````````````````````````````````
  pushMatrix();
  translate(width/2, height /2);
  rotate(radians(210 + 180));

  line(a*2, 0, a*15.6, 0);
  line(a*16.6, 0, a*17.6, 0);
  line(a*18.6, 0, a*27.5, 0);
  line(a*28.5, 0, a*29.5, 0);


  popMatrix();
  noFill();
  stroke(0, 0, 0);

  save("combined-v454-160.png");
  // exit();
}

void keyPressed() {
  if (key == 's') {
    save("normal-biohazard.png");
    noLoop(); 
    exit();
  }
}

void saveHiRes(int scaleFactor) {
  println("starting to save high.res copy");
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires-biohazard.png");
  println("saved high.res copy");
  exit();
}
