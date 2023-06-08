float scaleFactor = 1;
float translateX = 300;
float translateY = 500;
float base_color = 200;
boolean tricorn = false;
boolean burning_ship = false;

int count = 0;

boolean iterate_hue = false;

void setup() {
  size(1000, 1000);
  
}

void draw() {

  colorMode(HSB, 360, 100, 100);

  if(iterate_hue){
    base_color += 1;
  }

  loadPixels();

  int max_iterations = 256;

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      int loc = x + y * width;

      double sX = map(translateX, 0, width, -2, 2);
      double sY = map(translateY, 0, height, -2, 2);


      double a = map(x, 0, width, sX - scaleFactor*1.5, sX + scaleFactor*1.5);
      double b = map(y, 0, height, sY - scaleFactor*1.5, sY + scaleFactor*1.5);


      int n = 0;

      double c_a = a;
      double c_b = b;

      while(n < max_iterations && abs(a*a + b*b) < 4){

        double next_a = a*a - b*b;
        double next_b = 2*a*b;

        if(burning_ship){
          next_b = abs(next_b);
        }

        if(tricorn){
          next_b = next_b * -1;
        }
        
        a = next_a + c_a;
        b = next_b + c_b;

        //scales effect
        /*
        if (abs(a+b) > 16){
            break;
        }*/

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
  count++;
  
}

void keyPressed() {
    float delta = 1.02;
    if (key == 'r') {
      scaleFactor = 1;
      translateX = 300;
      translateY = 500;
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
    } else if (key == 'h') {
      if(iterate_hue){
        iterate_hue = false;
      } else {
        iterate_hue = true;
      }
    } else if (key == 't') {
      if(tricorn){
        tricorn = false;
      } else {
        tricorn = true;
      }
    } else if (key == 'b') {
      if(burning_ship){
        burning_ship = false;
      } else {
        burning_ship = true;
      }
    }
}

double abs(double value){
  if (value < 0){
    return value * -1;
  } else {
    return value;
  }

}

double map(double value, double istart, double istop, double ostart, double ostop) {
  return ostart + (ostop - ostart) * ((value - istart) / (istop - istart));
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
  translateX -= (mouseX - pmouseX) * scaleFactor;
  translateY -= (mouseY - pmouseY) * scaleFactor;
  
}
