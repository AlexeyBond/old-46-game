void setup() {
  size(512, 512);
}

void draw() {
  background(0);
  clear();
  fill(0);

  for (int i = 0; i < 512; ++i) {
    float fk = ((float)i) / 512f;
    float fc = pow(min(1f, fk * 1), 2);
    int c = (int)(fc * 255);
    fill(c);
    stroke(c);
    //rect(0, i / 2, 512, 512 - i);
    triangle(0,i / 2, 512, 256, 0, 512 - i / 2);
  }
  
  save("sprite.png");
}