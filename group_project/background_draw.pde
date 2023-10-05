float cloud_counter = 0;
float bird_counter = 0;
//float extra_counter = 0;
void background_draw(){
  //cloud_counter = (cos(cloud_counter*PI/8)+1)*0.5;
  float cloud_lerp = lerp(0,200, (cos(cloud_counter*PI/8)+1)*0.5);
  //clouds
  noStroke();
  fill(255);
  ellipse(40+cloud_lerp,90,120,60);
  ellipse(30+cloud_lerp,75,94,50);
  
  ellipse(120+cloud_lerp,200,120,70);
  ellipse(110+cloud_lerp,180,80,70);
  ellipse(80+cloud_lerp,190,70,80);
  
  ellipse(190+cloud_lerp,140,160,60);
  ellipse(200+cloud_lerp,110,40,30);
  ellipse(166+cloud_lerp,125,100,50);
  
  ellipse(495+cloud_lerp,110,200,70);
  ellipse(515+cloud_lerp,60,76,55);
  ellipse(476+cloud_lerp,80,100,55);
  ellipse(578+cloud_lerp,90,300,40);
  
  ellipse(290+cloud_lerp,50,105,50);
  ellipse(330+cloud_lerp,30,69,45);
  ellipse(250+cloud_lerp,20,120,50);
  
  ellipse(523+cloud_lerp,190,200,60);
  ellipse(516+cloud_lerp,180,120,50);
  ellipse(556+cloud_lerp,210,100,50);
  
  ellipse(744+cloud_lerp,300,250,60);
  ellipse(762+cloud_lerp,270,100,50);
  ellipse(799+cloud_lerp,250,76,50);
  
  ellipse(845,160,500,10);
  ellipse(730,110,600,10);
  ellipse(765,130,600,10);
  ellipse(680,118,800,10);
  ellipse(540,50,900,10);
  ellipse(490,56,700,10);
  ellipse(250,250,900,10);
  ellipse(200,170,600,10);
  ellipse(180,240,600,20);

  cloud_counter += 0.01;
  
  stroke(5);
  //building1
  fill(#A2A2A2);
  rect(589,523, 70,300);
  fill(#7E7E7E);
  beginShape();
  vertex(659,523);
  vertex(669,548);
  vertex(669,723);
  vertex(659,723);
  endShape(CLOSE);
  fill(#1F9FFF);
  beginShape();
  vertex(599,533);
  vertex(629,533);
  vertex(629,553);
  vertex(599,553);
  endShape(CLOSE);
  
  //building4
  fill(#A2A2A2);
  rect(708,463, 60,100);
  fill(#7E7E7E);
  beginShape();
  vertex(768,463);
  vertex(788,488);
  vertex(788,703);
  vertex(768,708);
  endShape(CLOSE);
  fill(#1F9FFF);
  beginShape();
  vertex(723,483);
  vertex(756,483);
  vertex(756,503);
  vertex(723,503);
  endShape(CLOSE);
  
  //building2
  fill(#A2A2A2);
  rect(679,523, 70,300);
  fill(#7E7E7E);
  beginShape();
  vertex(749,523);
  vertex(764,548);
  vertex(764,723);
  vertex(749,723);
  endShape(CLOSE);
  fill(#1F9FFF);
  beginShape();
  vertex(690,533);
  vertex(729,533);
  vertex(729,553);
  vertex(690,553);
  endShape(CLOSE);
  
  //building3
  fill(#A2A2A2);
  rect(758,563, 40,100);
  fill(#7E7E7E);
  beginShape();
  vertex(798,563);
  vertex(819,588);
  vertex(819,688);
  vertex(798,663);
  endShape(CLOSE);
  fill(#1F9FFF);
  beginShape();
  vertex(773,588);
  vertex(790,588);
  vertex(790,573);
  vertex(773,573);
  endShape(CLOSE);
  
  //pipes
  draw_top_pipe(pipe1);
  pushMatrix();
  translate(0,650);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  pushMatrix();
  translate(70,-100);
  draw_top_pipe(pipe1);
  translate(0,660);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  pushMatrix();
  translate(140,50);
  draw_top_pipe(pipe1);
  translate(0,650);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  pushMatrix();
  translate(210,20);
  pushMatrix();
  scale(1, 1.3);
  draw_top_pipe(pipe1);
  popMatrix();
  translate(0,745);
  scale(1,-1);
  draw_top_pipe(pipe1);
  popMatrix();
  
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
  
  //floor
  fill(#54A01F);
  beginShape();
  vertex(0,578);
  vertex(100,578);
  vertex(466,612);
  vertex(572, 606);
  vertex(1000,588);
  vertex(1000,700);
  vertex(0,700);
  //vertex(0,578);
  endShape(CLOSE);
  
  //branch
  fill(#8B6D07);
  beginShape();
  vertex(387,300);
  vertex(400,300);
  vertex(414,312);
  vertex(490,304);
  vertex(462,311);
  vertex(403,319);
  endShape(CLOSE);
  
  //butterfly
  //fill();
  float lerpStat = lerp(0,-100,(cos(cloud_counter*PI)+1)*0.5);
  pushMatrix();
  scale(0.4);
  translate(310,500-lerpStat);
  bird1.display();
  bird1.wingFlap();
  popMatrix();
  
  //butterfly flying
  if(!loading){
  float lerp_flyY = lerp(450,1170,bird_counter);
  float lerp_flyX = lerp(0,2250,bird_counter);
  pushMatrix();
  scale(0.2);
  translate(lerp_flyX,lerp_flyY);
  bird2.display();
  popMatrix();
  bird2.wingFlap();
  bird_counter += 0.005;
  bird_counter = constrain(bird_counter,0,1);}
  
  //foreground trunk
  fill(#8B6D07);
  beginShape();
  vertex(0,800);
  vertex(0,0);
  vertex(110,0);
  vertex(113,129);
  vertex(128, 309);
  vertex(137,488);
  vertex(154,672);
  vertex(159,701);
  endShape(CLOSE);
}
