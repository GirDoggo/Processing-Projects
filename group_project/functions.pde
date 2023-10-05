void draw_top_pipe(PVector pos) {
    strokeWeight(2);
    pushMatrix();
    
    fill(#54CB3A);
    translate(pos.x, pos.y - 200);
    scale(0.2, -0.2);
    rect(0, 0, 80, 1800);
    rect(-4, -40, 80+8, 40);
    
    fill(#6BE850);
    noStroke();
    rect(80-20-2, 2, 20, 1800);
    rect(88-20-6, -40+2, 20, 40-4);
    stroke(1);
    
    popMatrix();
    strokeWeight(1);
  }
  
void loading_screen(){
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text("Loading...",500,400);
  textAlign(BASELINE);
}
  
int place = 0;
String[] names = new String[10];
float[] scores = new float[10];
String[] lines;
int length_text;
void keyPressed(){
  //keyPressed for when the game is being played
  if (new_game == false) {
    play_game.keyPressed();
  }
  
  // Play Again
  if ( (key == ' ') && (end_game) ) {
    //new_game = true;
    loading = false;
    game_active = false;
    new_game = true;
  }
  name.set_counter(0);
  settings[0].set_counter(0);
  settings[1].set_counter(0);
  settings[2].set_counter(0);
  settings[3].set_counter(0);
  settings[4].set_counter(0);
  settings[5].set_counter(0);
  settings[6].set_counter(0);
  settings[7].set_counter(0);
  play[0].set_counter(0);
  play[1].set_counter(0);
  play[2].set_counter(0);
  play[3].set_counter(0);
  exit.set_counter(0);
  
  if (!game_active){
    if (keyCode == DOWN & !check_scores){
      place += 1;
      place = constrain(place, 0, 3);
    } else if (keyCode == UP & !check_scores){
      place -= 1;
      place = constrain(place, 0, 3);
    }
    
    if (place == 0){
      username += key;
      if (keyCode == BACKSPACE){
        username = "";
      } 
      //else if(keyCode == ENTER){
      //  newrow.setString("Name", username);
      //}
    }
    
    if (place == 1){
      if (keyCode == ENTER){
        loading = true;
      }
    }
    
    if (place == 2){
      if (keyCode == ENTER){
        check_scores = true;
        //String[] lines_new = new String[10];
        String[] lines_new = loadStrings("scores.txt");
        length_text = lines_new.length;
        for (int i = 0; i <= 9; i++){
          names[i] = split(lines_new[i], ',')[0];
          scores[i] = Float.parseFloat(split(lines_new[i], ',')[1]);
        }
      }
    }
    
    if (place == 3){
      if (keyCode == ENTER){
        exit();
      }
    }
    
    if (check_scores){
      if (keyCode == DOWN){
        settings_scroll = 1;
      }
      if (keyCode == UP){
        settings_scroll = 0;
      }
      if (keyCode == ENTER & settings_scroll == 1){
        check_scores = false;
        settings_scroll = 0;
      }
    }
  }
}
