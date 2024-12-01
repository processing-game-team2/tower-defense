void menu(){
  background(255);
  fill(50);
  noStroke();
  rect(width/2 - 100, height/2 - 50, 200, 100);
  textAlign(CENTER,CENTER);
  fill(255);
  text("start!", width/2, height/2);
}

void end(){
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(endmessage, width / 2, height / 2);
}