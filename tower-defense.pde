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

  Tower(float x, float y, float range) {
    this.x = x;
    this.y = y;
    this.range = range;
    this.damage = 10;
    this.rateOfFire = 30; // 每隔 30 幀攻擊一次
    this.fireCooldown = 0;
  }

  void shoot(ArrayList<Enemy> enemies) {
    if (fireCooldown == 0) {
      for (Enemy enemy : enemies) {
        float d = dist(x, y, enemy.x, enemy.y);
        if (d < range) {  // 檢查敵人是否在範圍內
          enemy.health -= damage;
          fireCooldown = rateOfFire;
          break;
        }
      }
    } else {
      fireCooldown--;
    }
  }

  void display() {
    fill(0, 0, 255);
    rect(x, y, 20, 20); // 用藍色的方形代表防禦塔
    noFill();
    stroke(0, 0, 255);
    ellipse(x, y, range * 2, range * 2); // 畫出範圍
  }
}
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Tower> towers = new ArrayList<Tower>();
int lives = 3;  // 玩家初始生命值

void setup() {
  size(600, 400);
  towers.add(new Tower(300, 200, 100));  // 初始化防禦塔
}

void draw() {
  background(255);

  // 檢查遊戲是否結束
  if (lives <= 0) {
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("gmae over", width / 2, height / 2);
    noLoop();  // 停止 draw() 的迴圈
    return;
  }

  // 顯示生命值
  fill(0);
  textSize(16);
  text("life: " + lives, width - 80, 30);

  // 生成敵人
  if (frameCount % 60 == 0) {
    enemies.add(new Enemy(0, 200, 2));  // 從左側開始
  }

  // 更新和顯示敵人
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy enemy = enemies.get(i);
    enemy.move();
    enemy.display();

    // 如果敵人到達螢幕右邊，扣除玩家生命值並移除敵人
    if (enemy.x > width) {
      lives--;  // 扣除一條生命
      enemies.remove(i);
    } else if (enemy.health <= 0) {
      enemies.remove(i);
    }
  }

  // 更新和顯示防禦塔
  for (Tower tower : towers) {
    tower.shoot(enemies);
    tower.display();
  }
}
void mousePressed() {
  towers.add(new Tower(mouseX, mouseY, 100));
}