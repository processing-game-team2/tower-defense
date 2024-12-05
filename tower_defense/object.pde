class Enemy {
  float id;
  float x, y;
  float speed;
  float health;

  Enemy(float id,float startX, float startY, float speed) {
    this.id = id; //出現種類，以level3來說某條路來的怪是1，另一條是2，其餘目前沒差
    this.x = startX;
    this.y = startY;
    this.speed = speed;
    if(id==1.0) this.health = 40;
    if(id==2.0) this.health = 50;
    if(id==3.0) this.health = 40;
    if(id==4.0) this.health = 50;
  }

  void move1() {//for first level
    // 水平移動，讓敵人沿著 x 軸前進
    x += speed;
    //println(x);
  }
  void move(){//for second level
    if(scene == 11){//level 1
      x += speed;
    }
    else if(scene == 12){//level 2
      if(x<140.0 && y==195.0) x+=speed;     // up at (100,200)
      else if(x==140.0 && y>110.0) y-=speed;// right at (100,150)
      else if(x<290.0 && y==110.0) x+=speed;// dowon at (150,150)
      else if(x==290.0 && y<300.0) y+=speed;// right at (150,300)
      else if(x<450.0 && y==300.0) x+=speed;// up at (250,300)
      else if(x==450.0 && y>180.0) y-=speed;// right at (250,200)
      else x+=speed;
    }else if(scene == 13){//level 3
      if(id==1){
        if(x==120.0 && y>170.0) y-=speed;     // up at (100,200)
        else if(x<290.0 && y==130.0) x+=speed; // right at (100,150)
        else if(x==290.0 && y<280.0) y+=speed;// dowon at (150,150)
        else x+=speed;
      }
      else if(id==2){
        if(x==290.0 && y<280.0) y+=speed;     // up at (100,200)
        else  x+=speed;
      }
    }
    //println(x,y);
  }
  void display() {
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, 20, 20); // 用紅色的圓圈代表敵人
  }
}
class Tower {
  int id;
  float x, y;
  float range;
  float damage; 
  int rateOfFire; //子彈冷卻時間
  int fireCooldown; //子彈冷卻計時器
  int type; //0還沒蓋塔 1普通塔 2冰凍塔
  boolean option; //是否顯示選單

  Tower(float x, float y) {
    this.x = x;
    this.y = y;
    this.type = 0;
    this.option = false;
  }

  // 建置防禦塔
  void type_change(int t){
    if(type!=0)return;
    // 1普通塔，花費3
    if(t == 1 && type == 0 && coins >= 3){
      // println("type1");
      range = 120;
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

  // 畫選單
  void display_option(){
    if(option == false){
      return;
    }
    if(type == 0){
      fill(255);
      stroke(0);
      // circle(x-25, y-25, 20);
      // circle(x+25, y-25, 20);
      circle(x, y-25, 20);
      textSize(20);
      if(coins >= 3){
        fill(0, 0, 255);
        textAlign(CENTER, CENTER);
        text("+", x, y-26);
      }
      else{
        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        text("X", x, y-26);
      }
      // text("2", x+25, y-25);
    }
  }

  // 畫防禦塔
  void display() {
    if(type == 1){//第一種
      // fill(0, 0, 255);
      // stroke(0);
      // strokeWeight(2);
      // rect(x-10, y-10, 20, 20);  // 用藍色的方形代表防禦塔
      imageMode(CENTER);
      image(tower_img, x, y-20, 40, 80);

      noFill();
      stroke(0, 0, 255, 100);
      strokeWeight(2);
      ellipse(x, y, range * 2, range * 2);  // 畫出範圍
    }
    else{//還沒蓋
      noFill();
      stroke(0);
      strokeWeight(2);
      rect(x-10, y-10, 20, 20);
      display_option();
    }
  }

  // 防禦塔點擊事件
  void mouse(int nowX, int nowY){
    // 點擊防禦塔：關閉/開啟選單
    if(nowX > x-10 && nowX < x+10 && nowY > y-10 && nowY < y+10){
      option = !option;
    }

    // 點擊選單，建立防禦塔
    if(option == true){
      if(nowX >= x-10 && nowX <= x+10 && nowY >= y-35 && nowY <= y-15){
        type_change(1);
        option = false;
      }
    }
  }
}

class Bullet{
  Tower from; // 發射的防禦塔
  Enemy to; // 目標敵人
  int time, totaltime = 10; // 從防禦塔到敵人需要幾幀的時間
  Bullet(Tower from, Enemy to){
    this.from = from;
    this.to = to;
    time = totaltime;
  }
  
  // 畫子彈，並回傳發射多久
  int show(){
    time--;
    float x = to.x + (from.x - to.x)/totaltime*(float)time;
    float y = to.y + (from.y-50 - to.y)/totaltime*(float)time;
    fill(0);
    circle(x,y,8);
    stroke(0);
    strokeWeight(1);
    // line(from.x, from.y-50, to.x, to.y);
    return time;
  }
}
