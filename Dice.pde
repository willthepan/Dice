void setup() {
  size(300, 300);
  noLoop();
}

void draw() {
  background(200, 200, 200);
  
  int rows = 3;
  int cols = 3;
  int w = width / cols;
  int h = height / rows;
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int x = j * w + w/2;
      int y = i * h + h/2;
      
      Die dice = new Die(x, y);
      dice.roll();
      dice.show();
    }
  }
}

void mousePressed() {
  redraw();
}

class Die {
  int x;
  int y;
  int number;
  int size = 80;
  
  Die(int startX, int startY) {
    x = startX;
    y = startY;
  }
  
  void roll() {
    number = (int)(Math.random() * 6 + 1);
  }
  
  void show() {
    rectMode(CENTER);
    fill(255);
    stroke(0);
    rect(x, y, size, size);
    
    fill(0);
    int move = size / 4;
    int dot = size / 8;
    
    if (number == 1 || number == 3 || number == 5) ellipse(x, y, dot, dot);
    if (number > 1) {
      ellipse(x - move, y - move, dot, dot);
      ellipse(x + move, y + move, dot, dot);
    }
    if (number > 3) {
      ellipse(x + move, y - move, dot, dot);
      ellipse(x - move, y + move, dot, dot);
    }
    if (number == 6) {
      ellipse(x - move, y, dot, dot);
      ellipse(x + move, y, dot, dot);
    }
  }
}

