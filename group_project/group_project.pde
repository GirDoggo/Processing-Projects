//void collision(pipe pipe, player player){
//  float dist_x = pipe.x - player.x;
//  boolean x_overlap = dist_x > -(pipe.hor+player.radX) & dist_x < (pipe.hor+player.radX);
//  float dist_y = pipe.y - player.y;
//  boolean y_overlap = dist.y > -(pipe.ver+player.radY) & dist_y < (pipe.ver+player.radY);
//  if (x_overlap & y_overlap){
//    GAMEOVER();
//  }
//}

stationary_Butterfly bird1, bird2;
PVector pipe1;
String username = "Name";
menu_text name = new menu_text(488, 340, username);
menu_text exit = new menu_text(440, 550, "Exit");
menu_text back = new menu_text(300,650, "Back");
menu_text[] play = new menu_text[4];
menu_text[] settings = new menu_text[8];
//Table score;
//score = new Table();
//score.addColumn("Name");
//score.addColumn("Score");
//TableRow newrow = score.addRow();
PlayGame play_game;
EndScreen end_screen;

boolean new_game = false;
boolean end_game = false;
void setup(){
  size(1000,700, P2D);
  bird1 = new stationary_Butterfly(#FF99FF);
  bird2 = new stationary_Butterfly(#FF99FF);
  
  pipe1 = new PVector(650,500);
 //menu_text name = new menu_text(488, 340, username);
 name.set_size(72);
    play[0] = new menu_text(440,450,"P");
    play[1] = new menu_text(475,450,"l");
    play[2] = new menu_text(490,450,"a");
    play[3] = new menu_text(520,450,"y");
  settings[0] = new menu_text(390, 500, "S");
  settings[1] = new menu_text(422,500, "e");
  settings[2] = new menu_text(451,500,"t");
  settings[3] = new menu_text(470,500,"t");
  settings[4] = new menu_text(491,500,"i");
  settings[5] = new menu_text(505,500,"n");
  settings[6] = new menu_text(538,500,"g");
  settings[7] = new menu_text(568,500,"s");
    
    play_game = new PlayGame();
    
  lines = loadStrings("scores.txt");
  length_text = lines.length;
}

void transition_to_loading(float load_counter){
  float lerp_flyY = lerp(239,300,load_counter);
  float lerp_flyX = lerp(460,900,load_counter);
  pushMatrix();
  translate(lerp_flyX,lerp_flyY);
  scale(0.2);
  bird2.display();
  popMatrix();
  bird2.wingFlap();
  load_counter = constrain(load_counter,0,1);
}

boolean game_active = false;
boolean loading = false;
boolean check_scores = false;
float load_counter = 0;
PrintWriter output;
boolean dont_enter = false;
void draw(){
  if (!loading&!game_active){
    background(#42BAE8);
    background_draw();
    if (check_scores){
      settings_menu();
    } else{
      menu();
    }
  } else if(loading){
    if (load_counter<1){
      background(#42BAE8);
      background_draw();
      transition_to_loading(load_counter);
      load_counter +=0.005;
    } else if (load_counter < 50){
      loading_screen();
      load_counter += 1;
    } else{
      load_counter = 0;
      game_active = true;
      loading = false;
    }
  }
  
  if (game_active){
    //game_background();
    if (new_game) {
    play_game = new PlayGame();
    new_game = false;
    end_game = false;
    }
    
    if (frameCount < play_game.get_game_over_frame() + 120) {
      play_game.play();
    }
    else {
      if (end_game == false) {
        end_screen = new EndScreen();
        end_game = true;
        String to_write1 = username;
        String comma = ",";
        //String to_write2 = str(play_game.get_time());
        float to_write2 = play_game.get_time();
        output = createWriter("data\\scores.txt");
        for (int i = 0; i < length_text-1; i++){
          if (to_write2 > scores[i]& !dont_enter){
            output.println(to_write1 + comma + to_write2);
            dont_enter = true;
          }
          output.println(lines[i]);
        }
        dont_enter = false;
        end_screen.draw_screen(play_game.get_time());
        output.flush();
        output.close();
        lines = loadStrings("scores.txt");
        length_text = lines.length;
      }
    }
  }
  //if(game_over){
  //  gameOverScreen();
    
  //}
}
