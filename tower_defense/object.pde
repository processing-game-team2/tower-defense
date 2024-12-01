class Enemy {
  float x, y;
  float speed;
  float health;

  Enemy(float startX, float startY, float speed) {
    this.x = startX;
    this.y = startY;
    this.speed = speed;
    this.health = 30;
  }

  void move() {
    // 水平移動，讓敵人沿著 x 軸前進
    x += speed;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 20, 20); // 用紅色的圓圈代表敵人
  }
}
class Tower {
  float x, y;
  float range;
  float damage;
  int rateOfFire;
  int fireCooldown;
  int type;
  boolean option;

  Tower(float x, float y) {
    this.x = x;
    this.y = y;
    this.type = 0;
    this.option = false;
  }

  void type_change(int t){
    // 1
    if(type == 0 && coins >= 3){
      this.range = 100;
      this.damage = 10;
      this.rateOfFire = 30;  // 每隔 30 幀攻擊一次
      this.fireCooldown = 0;
      this.type = 1;
      this.option = false;
      coins -= 3;
    }
  }

  void shoot(ArrayList<Enemy> enemies) {
    if(type == 1){
      if (fireCooldown == 0) {
        for (Enemy enemy : enemies) {
          float d = dist(x, y, enemy.x, enemy.y);
          if (d < range) {  // 檢查敵人是否在範圍內
            enemy.health -= damage;
            fireCooldown = rateOfFire;
            break;
          }
        }
      } else if (fireCooldown > 0) {
        fireCooldown--;
      }
    }
  }

  void display_option(){
    if(option == true){
      fill(255);
      stroke(0);
      circle(x-25, y-25, 20);
      circle(x+25, y-25, 20);
      textSize(20);
      fill(0);
      textAlign(CENTER, CENTER);
      text("1", x-25, y-25);
      text("2", x+25, y-25);
    }
  }

  void display() {
    if(type == 1){
      fill(0, 0, 255);
      rect(x-10, y-10, 20, 20);  // 用藍色的方形代表防禦塔
      noFill();
      stroke(0, 0, 255, 50);
      ellipse(x, y, range * 2, range * 2);  // 畫出範圍
    }
    else{
      noFill();
      stroke(0);
      rect(x-10, y-10, 20, 20);
      display_option();
    }
  }

  void mouse(){
    if(mouseX > x-10 && mouseX < x+10 && mouseY > y-10 && mouseY < y+10){
      option = !option;
    }
    if(option == true){
      if(mouseX > x-35 && mouseX < x-15 && mouseY > y-35 && mouseY < y-15){
        println("option1");
        type_change(1);
      }
    }
  }
}