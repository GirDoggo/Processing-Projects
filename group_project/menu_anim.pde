//#FF9999, #FFCC99, #CCFF99, #9999FF, #CC99FF, #FF99FF, #FF99CC

float counter_play = 0;
float counter_settings = 0;
void menu(){
  fill(0);
  textSize(74);
  text("Floppy Butterfly", 270, 100);

  if (place == 0){
    textSize(72);
    textAlign(CENTER);
    name.set_string(username);
    name.menu_animation();
    textAlign(BASELINE);
    textSize(60);
    text("P", 440, 450);
    text("l",475,450);
    text("a",490,450);
    text("y",520,450);
    text("Settings", 390, 500);
    text("Exit", 440, 550);
  } else if (place == 1){
    textAlign(CENTER);
    textSize(72);
    text(username, 488, 340);
    textSize(60);
    textAlign(BASELINE);
    for (int i = 0; i <= 3; i++){
      play[i].menu_animation();
      if (play[i].get_adj() & i != 3 & counter_play%21==0){
        play[i+1].set_jig(true);
      }
    }
    if (counter_play %10001 == 0){
      play[0].set_jig(true);
      play[0].set_adj(false);
      counter_play = 0;
    } else{
    counter_play += 1;}
    //menu_anim(440,450,"Play");
    text("Settings", 390, 500);
    text("Exit", 440, 550);
  } else if (place == 2){
    textAlign(CENTER);
    textSize(72);
    text(username, 488, 340);
    textSize(60);
    textAlign(BASELINE);
    text("Play", 440, 400);
    for (int i = 0; i < 8; i++){
      settings[i].menu_animation();
      if (settings[i].get_adj() & i != 7 & counter_settings%21==0){
        settings[i+1].set_jig(true);
      }
    }
    if (counter_settings %10001 == 0){
      settings[0].set_jig(true);
      settings[0].set_adj(false);
      counter_settings = 0;
    } else{
    counter_play += 1;}
    text("Exit", 440, 550);
  } else if (place == 3){
    textAlign(CENTER);
    textSize(72);
    text(username, 488, 340);
    textSize(60);
    textAlign(BASELINE);
    text("Play", 440, 400);
    text("Settings", 390, 450);
    exit.menu_animation();
  }
}

int settings_scroll = 0;
void settings_menu(){
  fill(0);
  for (int i = 0; i <= 9; i+=1){
    text(names[i],200,(i+1)*50);
    text(scores[i], 400,(i+1)*50);
  }
  if (settings_scroll == 0){
    back.display();
  }
  else if (settings_scroll == 1){
    back.menu_animation();}
}
//float c1=0; float c2=0; float c3=0; float c4=0; float c5 = 0; float c6=0; float c7=0;float c8=0;
//float menu_anim(float text_locX, float text_locY, String text_words, float counter){
//  float lerpY = lerp(0, 50, counter);
//  text(text_words, text_locX, text_locY-lerpY);
//  counter += 0.1;
//  counter = constrain(counter, 0,1);
//  if (counter == 1){
    
//  }
//  return counter;
//}
