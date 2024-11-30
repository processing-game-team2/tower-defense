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
  int type = 0;

  Tower(float x, float y, float range) {
    this.x = x;
    this.y = y;
    this.range = range;
    this.damage = 10;
    this.rateOfFire = 30;  // 每隔 30 幀攻擊一次
    this.fireCooldown = 0;
  }

  void shoot(ArrayList<Enemy> enemies) {
    if (fireCooldown == 0) {  // 檢查耐久度
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

  void display() {
    fill(0, 0, 255);
    rect(x-10, y-10, 20, 20);  // 用藍色的方形代表防禦塔
    noFill();
    stroke(0, 0, 255);
    ellipse(x, y, range * 2, range * 2);  // 畫出範圍
  }
}