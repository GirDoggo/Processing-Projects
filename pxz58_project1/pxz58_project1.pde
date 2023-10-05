float e = (float)Math.E;
float pi = (float)Math.PI;

//float sharpen_kernel[] = {-1,-1,-1,-1,9,-1,-1,-1,-1};
float sharpen_kernel[] = {0,-1,0,-1,5,-1,0,-1,0};
float blur_kernel[] = {0.0625,0.125,0.0625,0.125,0.25,0.125,0.0625,0.125,0.0625};
float blur_kernel2[] = {0.2375,0.425,0.2375,0.425,0.8,0.425,0.2375,0.425,0.2375};
float hor_kernel[] = {-1,-2,1,0,0,0,-1,2,1};
float ver_kernel[] = {-1,0,-1,-2,0,2,1,0,1};

PImage img;
PImage buf;

float edge_conv = 0;
int kernel = 0;
float[] convolution = {0.0,0.0,0.0};
String photo = "lucy1.jpg";

boolean custom = false;
//this variable, u, must be odd, or the program will not work.
//u is the size of one side of the kernel for adjusting the size of the gaussian blur kernel.
int u = 23;
float[] custom_blur = gaussian(u);

void setup(){
  //println(custom_blur);
  surface.setResizable(true);
  img = loadImage(photo);
  buf = loadImage(photo);
  surface.setSize(img.width, img.height);
  //because this program only edits images, there's no need to keep the draw loop running.
  noLoop();
}

//the kernel size calculator returns the total of all numbers in the kernel matrix.
float kernel_size_calculator(float[] kernel){
  float tot = 0;
  for (int i=0; i<kernel.length; i++){
    tot += kernel[i];
  }
  
  return tot;
}

//this function generates a custom gaussian blur kernel based on a size given to it.
//the equation used is G(x,y)=(1/2pi(sigma)^2)*e^(-(x^2+y^2)/2(sigma)^2).
//the formula was taken from en.wikipedia.org/wiki/Gaussian_blur.
float[] gaussian(int size){
  float[] kernel = new float[size * size];
  int bound = (int)(size/2);
  //println(bound);
  for (int i = -bound; i<=bound; i++){
    //println(i);
    for (int j = -bound; j<=bound; j++){
      //println(j);
      float square1 = (float)Math.pow(i, 2);
      //println("square1", square1);
      float square2 = (float)Math.pow(j, 2);
      //println("square2", square2);
      float coefficient = (float)(1/(2 * pi * 4));
      //println(coefficient);
      float exponent = (float)(Math.pow(e, (-(square1+square2) / 8)));
      //println(e, "*", (-(square1+square2) / 2), "=", exponent);
      kernel[size * (i+bound) + (j+bound)] = coefficient * exponent;
    }
  }
  float kernel_size = kernel_size_calculator(kernel);
  //float tot = 0;
  
  for (int i=0; i<kernel.length; i++){
    kernel[i] = kernel[i]/kernel_size;
    //tot += kernel[i];
  }
  //println(tot);
  
  return kernel;
}

void convolute(PImage img, PImage buf){
  buf.loadPixels();
  
  for(int i=0; i<img.pixels.length; i++){
    int row = (int)Math.floor(i/img.width);
    int col = i - row*img.width;
    if (kernel == 2){
      convolution = sharpen(img, row, col);
  } else if (kernel == 3){
    if (custom){
      convolution = blur(img, row, col, u);
    } else{
      convolution = blur(img, row, col, 3);
    }
  } else if (kernel == 4){
    
    float convolution1 = hor_detect(img, row, col);
    float square1 = (float)Math.pow(convolution1, 2);
    //float square10 = (float)Math.pow(convolution1[0], 2);
    //float square11 = (float)Math.pow(convolution1[1], 2);
    //float square12 = (float)Math.pow(convolution1[2], 2);
    
    float convolution2 = ver_detect(img, row, col);
    float square2 = (float)Math.pow(convolution2, 2);
    //float square20 = (float)Math.pow(convolution2[0], 2);
    //float square21 = (float)Math.pow(convolution2[1], 2);
    //float square22 = (float)Math.pow(convolution2[2], 2);
    
    //float sum0 = square10 + square20;
    //float sum1 = square11 + square21;
    //float sum2 = square12 + square22;
    float sum = square1 + square2;
    edge_conv = (float)Math.pow(sum, 0.5);
    //convolution[0] = (float)Math.pow(sum0, 0.5);
    //convolution[1] = (float)Math.pow(sum1, 0.5);
    //convolution[2] = (float)Math.pow(sum2, 0.5);
    edge_conv = constrain(edge_conv,0,255);
    buf.pixels[i] = color(edge_conv);
    buf.updatePixels();
    continue;
  }
  
  convolution[0] = constrain(convolution[0],0,255);
  convolution[1] = constrain(convolution[1],0,255);
  convolution[2] = constrain(convolution[2],0,255);
  
  buf.pixels[i] = color(convolution[0], convolution[1], convolution[2]);
  
  buf.updatePixels();
  }
}

void grayscale(PImage img, PImage buf){
  buf.loadPixels();
  
  for(int i=0; i<buf.pixels.length; i++){
    buf.pixels[i] = color(brightness(color(img.pixels[i])));
  }
  
  buf.updatePixels();
}

//this function detects horizontal edges, and the blur2 kernel is applied
//too in order to remove noise from interfering with the edge detection process.
float hor_detect(PImage img, int x, int y){
  float conv = 0;
  //float conv[] = new float[3];
  //float conv_r = 0;
  //float conv_g = 0;
  //float conv_b = 0;
  
  for(int i = -1; i <= 1; i++){
    for(int e = -1; e <= 1; e++){
      int img_pos = (img.width * (x+i)) + (y+e);
      int ker_pos = (3*(i+1)+e+1);

      if ((0 <= img_pos) && (img_pos < (img.width*img.height))){
        //conv_r += (hor_kernel[ker_pos] * (red(img.pixels[img_pos])));
        //conv_g += (hor_kernel[ker_pos] * (green(img.pixels[img_pos])));
        //conv_b += (hor_kernel[ker_pos] * (blue(img.pixels[img_pos])));
        float bright = brightness(img.pixels[img_pos]);
        conv += (hor_kernel[ker_pos] * blur_kernel2[ker_pos] * bright);
        //conv_r += (hor_kernel[ker_pos] * blur_kernel2[ker_pos] * (red(img.pixels[img_pos])));
        //conv_g += (hor_kernel[ker_pos] * blur_kernel2[ker_pos] * (green(img.pixels[img_pos])));
        //conv_b += (hor_kernel[ker_pos] * blur_kernel2[ker_pos] * (blue(img.pixels[img_pos])));
      }
    }
  }
  
  //conv[0] = conv_r;
  //conv[1] = conv_g;
  //conv[2] = conv_b;
  
  return conv;
}

//this function detects vertical edges, and the blur2 kernel is applied
//too in order to remove noise from interfering with the edge detection process.
float ver_detect(PImage img, int x, int y){
  float conv = 0;
  //float conv[] = new float[3];
  //float conv_r = 0;
  //float conv_g = 0;
  //float conv_b = 0;

  for(int i = -1; i <= 1; i++){
    for(int e = -1; e <= 1; e++){
      int img_pos = (img.width * (x+i)) + (y+e);
      int ker_pos = (3*(i+1)+e+1);
      
      if ((0 <= img_pos) && (img_pos < (img.width*img.height))){
        conv += (ver_kernel[ker_pos] * blur_kernel2[ker_pos] * (brightness(img.pixels[img_pos])));
        //conv_r += (ver_kernel[ker_pos] * blur_kernel2[ker_pos] * (red(img.pixels[img_pos])));
        //conv_g += (ver_kernel[ker_pos] * blur_kernel2[ker_pos] * (green(img.pixels[img_pos])));
        //conv_b += (ver_kernel[ker_pos] * blur_kernel2[ker_pos] * (blue(img.pixels[img_pos])));
      }
    }
  }
  
  //conv[0] = conv_r;
  //conv[1] = conv_g;
  //conv[2] = conv_b;
  
  return conv;
}

//this function either applies the standard gaussian blur kernel
//given by the variable blur_kernel or a custom kernel called custom_blur
//depending on if the custom variable is set to true or not.
float[] blur(PImage img, int x, int y, int size){
  float conv[] = new float[3];
  float conv_r = 0;
  float conv_g = 0;
  float conv_b = 0;
  int bound = (int)size/2;
  //println(bound);
  
  for (int i = -bound; i<=bound; i++){
    for (int j = -bound; j<=bound; j++){
      int img_pos = (img.width * (x+i)) + (y+j);
      int ker_pos = (size*(i+bound)+j+bound);
      
      if ((0 <= img_pos) && (img_pos < (img.width*img.height))){
        if (custom){
          conv_r += custom_blur[ker_pos] * red(img.pixels[img_pos]);
          conv_g += custom_blur[ker_pos] * green(img.pixels[img_pos]);
          conv_b += custom_blur[ker_pos] * blue(img.pixels[img_pos]);
        } else {
          conv_r += (blur_kernel[ker_pos] * (red(img.pixels[img_pos])));
          conv_g += (blur_kernel[ker_pos] * (green(img.pixels[img_pos])));
          conv_b += (blur_kernel[ker_pos] * (blue(img.pixels[img_pos])));
        }
      }
    }
  }
  conv[0] = conv_r;
  conv[1] = conv_g;
  conv[2] = conv_b;
  
  return conv;
}

float[] sharpen(PImage img, int x, int y){
  float conv[] = new float[3];
  float conv_r = 0;
  float conv_g = 0;
  float conv_b = 0;
  
  // this code is basically taken from what we did in class.
  for(int i = -1; i <= 1; i++){
    for(int e = -1; e <= 1; e++){
      int img_pos = (img.width * (x+i)) + (y+e);
      int ker_pos = (3*(i+1)+e+1);
      
      // because we can ignore edge cases for the most part, only the exceptions for
      // when the pixel position called would be outside of the image are
      // accounted for 
      if ((0 <= img_pos) && (img_pos < (img.width*img.height))){
        conv_r += (sharpen_kernel[ker_pos] * (red(img.pixels[img_pos])));
        conv_g += (sharpen_kernel[ker_pos] * (green(img.pixels[img_pos])));
        conv_b += (sharpen_kernel[ker_pos] * (blue(img.pixels[img_pos])));
      }
    }
  }
  
  conv[0] = conv_r;
  conv[1] = conv_g;
  conv[2] = conv_b;
 
  return conv;
}

void RG_blind(PImage img, PImage buf){
  buf.loadPixels();
  for (int i = 0; i<img.pixels.length; i++){
    //because we see green slightly stronger than red, a greener picture should be slightly brighter than a red one.
    //therefore, the coefficients 0.9 and 1.1 affect the average brightness of colors with red and green elements.
    float r = 0.9 * red(img.pixels[i]);
    float g = 1.1 * green(img.pixels[i]);
    //g = constrain(g,0,255);
    float avg = (r+g)/2;
    avg = constrain(avg, 0, 255);
    
    //buf.pixels[i] = color((avg - 0.03*avg), (avg-0.05*avg), (blue(img.pixels[i])-0.06*avg));
    buf.pixels[i] = color((avg), (avg), blue(img.pixels[i]));
  }
  
  buf.updatePixels();
}

void keyPressed(){
  assert keyPressed;
  
  if (key == '0'){
    buf = loadImage(photo);
    redraw();
  } else if (key == '1'){
    grayscale(img, buf);
    redraw();
  } else if (key == '2'){
    kernel = 2;
    convolute(img, buf);
    redraw();
  } else if (key == '3'){
    kernel = 3;
    convolute(img, buf);
    redraw();
  } else if (key == '4'){
    kernel = 4;
    convolute(img, buf);
    redraw();
  } else if (key == '5'){
    RG_blind(img, buf);
    redraw();
  } 
    //pressing the f key on the keyboard toggles the custom variable,
    //which tells the blur feature whether or not to use the custom kernel.
    else if (key == 'f'){
    custom = !custom;
  }
}

void draw(){
  image(buf,0,0);
}
