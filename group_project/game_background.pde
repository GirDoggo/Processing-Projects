int background_scroll = 0;
void game_background(){
  pushMatrix();
  translate(-background_scroll,0);
  background(#42BAE8);
  stroke(5);

  clouds();
  
  tree2();
  
  //ruins
  fill(#A2A2A2);
  beginShape();
  vertex(2330,420);
  vertex(2350,380);
  vertex(2390,380);
  vertex(2450,240);
  vertex(2490,255);
  vertex(2460,370);
  vertex(2490,450);
  endShape(CLOSE);
  //window
  fill(#1F9FFF);
  beginShape();
  vertex(2420,335);
  vertex(2450,345);
  vertex(2430,355);
  vertex(2415,350);
  endShape(CLOSE);
  beginShape();
  vertex(2438,295);
  vertex(2460,305);
  vertex(2446,337);
  vertex(2425,327);
  endShape(CLOSE);
  //3
  beginShape();
  vertex(2455,253);
  vertex(2475,260);
  vertex(2460,295);
  vertex(2440,286);
  endShape(CLOSE);
  fill(#7E7E7E);
  beginShape();
  vertex(2490,255);
  vertex(2520,285);
  vertex(2475,385);
  vertex(2400,450);
  endShape(CLOSE);
  //rock
  beginShape();
  fill(#9F9F9F);
  beginShape();
  vertex(2370,420);
  vertex(2390,360);
  vertex(2450,334);
  vertex(2500,420);
  endShape(CLOSE);
  fill(#7E7E7E);
  beginShape();
  vertex(2450,334);
  vertex(2500,420);
  vertex(2530,420);
  endShape(CLOSE);
  
  //barn
  fill(#BC4C0B);
  rect(1650,350,250,300);
  fill(#894A25);
  beginShape();
  vertex(1650,350);
  vertex(1900,350);
  vertex(1860,300);
  vertex(1690,300);
  endShape(CLOSE);
  beginShape();
  vertex(1900,350);
  vertex(1950,375);
  vertex(1950,600);
  vertex(1900,600);
  endShape(CLOSE);
  fill(#622D0E);
  beginShape();
  vertex(1900,350);
  vertex(1950,375);
  vertex(1910,330);
  vertex(1860,300);
  endShape(CLOSE);
  fill(#1F9FFF);
  rect(1675,400,50,25);
  
  buildings();
  
  pushMatrix();
  translate(3000,0);
  buildings();
  popMatrix();
  
  pipes();
  
  ground();
  
  road();
  
  tree1();
  pushMatrix();
  translate(3000,0);
  tree1();
  popMatrix();
  
  airplane();
  
  popMatrix();
  
  background_scroll += 5;
  //if (background_scroll == 2000){
  //  background_scroll-=10;
  //}
  if (background_scroll == 3000){
    background_scroll = 0;
    plane_x = 0;
    plane_y = 0;
  }
}

void buildings(){
  //building1
  fill(#A2A2A2);
  beginShape();
  vertex(624, 234);
  vertex(649, 234);
  vertex(649, 600);
  vertex(624, 600);
  endShape(CLOSE);
  fill(#7E7E7E);
  beginShape();
  vertex(649,234);
  vertex(669,254);
  vertex(669,600);
  vertex(649,600);
  endShape(CLOSE);
  fill(#1F9FFF);
  beginShape();
  vertex(654,244);
  vertex(659,249);
  vertex(659,254);
  vertex(654,249);
  endShape(CLOSE);
  beginShape();
  vertex(654,254);
  vertex(659,259);
  vertex(659,264);
  vertex(654,259);
  endShape(CLOSE);
  beginShape();
  vertex(654,264);
  vertex(659,269);
  vertex(659,274);
  vertex(654,269);
  endShape(CLOSE);
  beginShape();
  vertex(654,274);
  vertex(659,279);
  vertex(659,284);
  vertex(654,279);
  endShape(CLOSE);
  beginShape();
  vertex(654,284);
  vertex(659,289);
  vertex(659,294);
  vertex(654,289);
  endShape(CLOSE);
  
  //building2
  fill(#A2A2A2);
  rect(708,276,80,300);
  beginShape();
  fill(#7E7E7E);
  vertex(788,276);
  vertex(804,300);
  vertex(804,600);
  vertex(786,600);
  endShape(CLOSE);
  fill(#1F9FFF);
  rect(718,289,60,30);
  rect(718,329,60,30);
}

void road(){
  //road
  fill(#AA9C6C);
  beginShape();
  vertex(0,500);
  vertex(200,515);
  vertex(500,502);
  vertex(700,492);
  vertex(1000,498);
  vertex(1200,490);
  vertex(1400,500);
  vertex(1650,506);
  vertex(1800,512);
  vertex(2000,508);
  vertex(2200,499);
  vertex(2400,493);
  vertex(2600,503);
  vertex(2800,513);
  vertex(3000,500);
  vertex(3200,515);
  vertex(3500,502);
  vertex(3700,492);
  vertex(4000,498);
  vertex(4000,548);
  
  vertex(3000,570);
  vertex(2000,562);
  vertex(1000,548);
  vertex(800,552);
  vertex(550,558);
  vertex(300,550);
  vertex(200,545);
  vertex(0,538);
  endShape(CLOSE);
}

void ground(){
  //ground
  fill(#54A01F);
  beginShape();
  vertex(0,400);
  vertex(300,424);
  vertex(500,418);
  vertex(750,422);
  vertex(1000,434);
  vertex(1200,422);
  vertex(1400,418);
  vertex(1600,411);
  vertex(1800,423);
  vertex(2000,427);
  vertex(2150,420);
  vertex(2300,414);
  vertex(2500,405);
  vertex(2750,398);
  vertex(3000,400);
  vertex(3300,424);
  vertex(3500,418);
  vertex(3750,422);
  vertex(4000,434);
  vertex(4000,700);
  vertex(0,700);
  endShape(CLOSE);
}

void clouds(){
  fill(255);
  ellipse(100,150,200,30);
  ellipse(170,350,250,40);
  ellipse(180,400,220,30);
  ellipse(300,200,300,20);
  ellipse(360,250,200,30);
  ellipse(440,300,250,30);
  ellipse(430,90,190,20);
  ellipse(600,80,150,20);
  ellipse(620,110,170,20);
  ellipse(630,240,260,30);
  ellipse(700,340,300,30);
  ellipse(730,270,200,20);
  ellipse(790,190,220,20);
  ellipse(810,40,200,20);
  ellipse(870,360,300,30);
  ellipse(930,150,280,25);
  ellipse(960,70,200,20);
  ellipse(1020,130,230,25);
  ellipse(1040,350,300,30);
  ellipse(1100,10,200,25);
  ellipse(1130,50,200,20);
  ellipse(1150,190,220,30);
  ellipse(1170,240,250,25);
  ellipse(1220,130,300,30);
  ellipse(1270,340,200,20);
  ellipse(1290,220,200,20);
  ellipse(1300,110,230,30);
  ellipse(1360,40,200,20);
  ellipse(1410,210,300,20);
  ellipse(1440,160,230,25);
  ellipse(1450,270,200,20);
  ellipse(1480,90,200,30);
  ellipse(1560,140,200,20);
  ellipse(1590,260,250,25);
  ellipse(1630,340,200,20);
  ellipse(1650,30,250,25);
  ellipse(1730,170,200,30);
  ellipse(1780,30,200,30);
  ellipse(1820,260,240,30);
  ellipse(1860,320,300,20);
  ellipse(1880,100,250,25);
  ellipse(1970,160,250,30);
  ellipse(1990,300,200,20);
  ellipse(2000,40,300,30);
  ellipse(2020,130,230,25);
  ellipse(2040,350,300,30);
  ellipse(2100,10,200,25);
  ellipse(2130,50,200,20);
  ellipse(2150,190,220,30);
  ellipse(2170,240,250,25);
  ellipse(2220,130,300,30);
  ellipse(2270,340,200,20);
  ellipse(2290,220,200,20);
  ellipse(2300,110,230,30);
  ellipse(2360,40,200,20);
  ellipse(2410,210,300,20);
  ellipse(2440,160,230,25);
  ellipse(2590,220,200,20);
  ellipse(2500,110,230,30);
  ellipse(2660,40,200,20);
  ellipse(2810,210,300,20);
  ellipse(2740,160,230,25);
  ellipse(2750,270,200,20);
  ellipse(2880,90,200,30);
  ellipse(2960,140,200,20);
  
  ellipse(3100,150,200,30);
  ellipse(3170,350,250,40);
  ellipse(3180,400,220,30);
  ellipse(3300,200,300,20);
  ellipse(3360,250,200,30);
  ellipse(3440,300,250,30);
  ellipse(3430,90,190,20);
  ellipse(3600,80,150,20);
  ellipse(3620,110,170,20);
  ellipse(3630,240,260,30);
  ellipse(3700,340,300,30);
  ellipse(3730,270,200,20);
  ellipse(3790,190,220,20);
  ellipse(3810,40,200,20);
  ellipse(3870,360,300,30);
  ellipse(3930,150,280,25);
  ellipse(3960,70,200,20);
  ellipse(4020,130,230,25);
}

void tree1(){
    //trunk
  fill(#8B6D07);
  beginShape();
  vertex(230,600);
  vertex(284,544);
  vertex(300,510);
  vertex(311,487);
  vertex(296, 455);
  vertex(254,432);
  vertex(384,419);
  vertex(372,432);
  vertex(363,455);
  vertex(375,478);
  vertex(374,502);
  vertex(380,544);
  vertex(410,620);
  endShape(CLOSE);
  
  //treetop
  fill(#057C27);
  beginShape(); 
  vertex(294,438);
  vertex(254,432);
  vertex(232,412);
  vertex(212,397);
  vertex(188,339);
  vertex(189,310);
  vertex(205,290);
  vertex(224,275);
  vertex(264,261);
  vertex(248,251);
  vertex(249,240);
  vertex(266,227);
  vertex(288,214);
  vertex(302,205);
  vertex(321,202);
  vertex(349,200);
  vertex(378,205);
  vertex(385,210);
  vertex(420,240);
  vertex(450,280);
  vertex(460,310);
  vertex(440,360);
  vertex(420,390);
  vertex(400,410);
  vertex(395,420);
  endShape(CLOSE);
}
void tree2(){
  //tree2
  fill(#8B6D07);
  beginShape();
  vertex(1056,450);
  vertex(1072,400);
  vertex(1083,392);
  vertex(1090,373);
  vertex(1102,365);
  vertex(1096,355);
  vertex(1080,330);
  vertex(1100,315);
  vertex(1090,300);
  vertex(1080,290);
  vertex(1184,250);
  vertex(1190,325);
  vertex(1187,330);
  vertex(1193,340);
  vertex(1190,350);
  vertex(1200,370);
  vertex(1198,383);
  vertex(1190,390);
  vertex(1200,400);
  vertex(1210,420);
  endShape(CLOSE);
  fill(#057C27);
  beginShape();
  vertex(1100,320);
  vertex(1080,300);
  vertex(1060,298);
  vertex(1050,290);
  vertex(1030,280);
  vertex(1000,250);
  vertex(990,240);
  vertex(990,230);
  //vertex(1030,220);
  //vertex(1040,200);
  vertex(1000,200);
  vertex(1040,170);
  vertex(1030,140);
  vertex(1020,130);
  vertex(1030,115);
  vertex(1050,100);
  vertex(1070,95);
  vertex(1110,115);
  vertex(1120,105);
  vertex(1140,95);
  vertex(1160,100);
  vertex(1180,90);
  //vertex(1190,130);
  vertex(1200,100);
  vertex(1215,90);
  vertex(1230,100);
  vertex(1240,110);
  //vertex(1253,110);
  //vertex(1255,120);
  vertex(1250,130);
  vertex(1260,145);
  vertex(1250,160);
  vertex(1240,180);
  vertex(1255,200);
  //
  //vertex(1250,235);
  vertex(1260,235);
  vertex(1260,240);
  vertex(1255,235);
  vertex(1240,255);
  vertex(1220,260);
  vertex(1200,270);
  vertex(1200,285);
  vertex(1190,290);
  vertex(1170,290);
  vertex(1150,280);
  
  endShape(CLOSE);
}

float plane_x = 0;
float plane_y = 0;
void airplane(){
  float x_offset = lerp(0,1400,plane_x);
  float y_offset = lerp(0,1200,plane_y);
  if (background_scroll >= 1800){
  plane_x += 0.006;
  plane_y += 0.006;}
  if (plane_x >= 1 || plane_y >= 1){
    plane_x = 0;
    plane_y = 0;
  }
  pushMatrix();
  translate(1600+x_offset,-500+y_offset);
  fill(#838689);
  beginShape();
  vertex(360,340);
  vertex(315,295);
  vertex(330,80);
  vertex(343,115);
  endShape(CLOSE);
  fill(#A2A2A2);
  beginShape();
  vertex(500, 500);
  vertex(470,450);
  vertex(240,220);
  vertex(220,220);
  vertex(230,260);
  vertex(440,470);
  //vertex(510,540);
  endShape(CLOSE);
  fill(#838689);
  beginShape();
  vertex(355,360);
  vertex(305,310);
  vertex(80,320);
  vertex(120,340);
  endShape(CLOSE);
  fill(#045990);
  beginShape();
  vertex(243,222);
  vertex(275,190);
  vertex(282,195);
  vertex(278,244);
  vertex(295,275);
  endShape(CLOSE);
  beginShape();
  vertex(270,260);
  vertex(200,210);
  vertex(170,195);
  vertex(250,260);
//  vertex();
  endShape(CLOSE);
  fill(#1F9FFF);
  beginShape();
  //point1
  vertex(480,468);
  vertex(475,460);
  vertex(453,445);
  vertex(460,455);
  endShape(CLOSE);
  popMatrix();
}

void pipes(){
//pipes
  pushMatrix();
  translate(2350,0);
  draw_top_pipe(pipe1);
  translate(0,650);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  pushMatrix();
  translate(2420,-100);
  draw_top_pipe(pipe1);
  translate(0,660);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  pushMatrix();
  translate(2490,50);
  draw_top_pipe(pipe1);
  translate(0,650);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  pushMatrix();
  translate(2560,20);
  pushMatrix();
  scale(1, 1.3);
  draw_top_pipe(pipe1);
  popMatrix();
  translate(0,745);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
}
