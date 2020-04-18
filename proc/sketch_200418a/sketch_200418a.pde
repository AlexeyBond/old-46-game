void setup() {
  size(512, 512);
}

void draw() {
  background(0);
  clear();
  fill(0);

  for (int i = 0; i < 512; ++i) {
    float fk = ((float)i) / 512f;
    float fc = pow(min(1f, fk * 2), 2);
    int c = (int)(fc * 255);
    fill(c);
    stroke(c);
    ellipse(256, 256, 512-i, 512-i);
  }
  
  save("sprite.png");
}