class Enemy {
  int id;
  float x, y;
  float speed;
  float health;

  Enemy(float startX, float startY, float speed) {
    this.x = startX;
    this.y = startY;
    this.speed = speed;
    this.health = 40;
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
  int id;
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
    if(type!=0)return;
    // 1
    if(t == 1 && type == 0 && coins >= 3){
      println("type1");
      range = 100;
      damage = 10;
      rateOfFire = 30;  // 每隔 30 幀攻擊一次
      fireCooldown = 0;
      type = 1;
      coins -= 3;
    }
  }

  void shoot(ArrayList<Enemy> enemies) {
    if(type == 1){
      if (fireCooldown == 0) {
        for (Enemy enemy : enemies) {
          float d = dist(x, y, enemy.x, enemy.y);
          if (d < range) {  // 檢查敵人是否在範圍內
            bullets.add(new Bullet(this, enemy));
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
    if(option == false){
      return;
    }
    if(type == 0){
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
      stroke(0);
      strokeWeight(2);
      rect(x-10, y-10, 20, 20);  // 用藍色的方形代表防禦塔

      noFill();
      stroke(0, 0, 255, 100);
      strokeWeight(1);
      ellipse(x, y, range * 2, range * 2);  // 畫出範圍
    }
    else{
      noFill();
      stroke(0);
      strokeWeight(2);
      rect(x-10, y-10, 20, 20);
      display_option();
    }
  }

  void mouse(int nowX, int nowY){
    if(nowX > x-10 && nowX < x+10 && nowY > y-10 && nowY < y+10){
      option = !option;
    }
    if(option == true){
      if(nowX > x-35 && nowX < x-15 && nowY > y-35 && nowY < y-15){
        type_change(1);
        option = false;
      }
    }
  }
}

class Bullet{
  Tower from;
  Enemy to;
  int time, totaltime = 10;
  Bullet(Tower from, Enemy to){
    this.from = from;
    this.to = to;
    time = totaltime;
  }
  
  int show(){
    time--;
    float x = to.x + (from.x - to.x)/totaltime*(float)time;
    float y = to.y + (from.y - to.y)/totaltime*(float)time;
    fill(0);
    circle(x,y,8);
    stroke(0);
    strokeWeight(1);
    // line(from.x, from.y, to.x, to.y);
    return time;
  }
}