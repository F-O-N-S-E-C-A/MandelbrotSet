float scaleFactor = 1.0;
float translateX = 0;
float translateY = 0;
float base_color = 200;

void setup() {
  size(800, 800);
  
}

void draw() {

  colorMode(HSB, 360, 100, 100);



  loadPixels();

  int max_iterations = 50;

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      int loc = x + y * width;

      float sX = map(translateX, 0, width, 0, 1);
      float sY = map(translateY, 0, height, 0, 1);


      float a = map(x, 0, width, sX - scaleFactor, sX + scaleFactor);
      float b = map(y, 0, height, sY - scaleFactor, sY + scaleFactor);


      int n = 0;

      float c_a = a;
      float c_b = b;

      while(n < max_iterations){

        float next_a = a*a - b*b;
        float next_b = 2*a*b;

        a = next_a + c_a;
        b = next_b + c_b;

        if (abs(a+b) > 16){
            break;
        }

        n++;

      }

      float col = map(n, 0, max_iterations, 0, 360);

      if (n == max_iterations){
        pixels[loc] = color(0, 0, 0);
      } else {
        col = col + base_color;
        while(col > 360){
          col = col - 360;
        }
        pixels[loc] = color(col, 100, 100);
      }


      
    }  
  }
  updatePixels();

  
}

void keyPressed() {
    float delta = 1.02;
    if (key == 'r') {
        scaleFactor = 1;
    } else if (keyCode == UP) {
      scaleFactor /= delta;
    } else if (keyCode == DOWN) {
      scaleFactor *= delta;
    } else if (key == 'w') {
      translateY -= 20;
    } else if (key == 's') {
      translateY += 20;
    } else if (key == 'a') {
      translateX -= 20;
    } else if (key == 'd') {
      translateX += 20;
    } else if (key == 'c') {
      base_color += 20;
    }
}

void mouseWheel(MouseEvent event) {
  
  float delta = 1.02;
  if(event.getCount() > 0){
    scaleFactor *= delta;
  } else {
    scaleFactor /= delta;
  }

}

void mouseDragged() {
  // Pan the image when the mouse is dragged
  translateX -= mouseX - pmouseX;
  translateY -= mouseY - pmouseY;

  //println(translateX);
}
