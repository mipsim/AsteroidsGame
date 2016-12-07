//////////////////////////////////////////////////////////////--DECLARATION--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


Star [] stars = new Star[600];

ArrayList <Asteroid> astList = new ArrayList <Asteroid>();

SpaceShip player;

ArrayList <SpaceShip> lifeList = new ArrayList <SpaceShip>();

ArrayList <Bullet> bulletList = new ArrayList <Bullet>();

ArrayList <AlienBullet> alienBulletList = new ArrayList <AlienBullet>();

boolean gameStart = false;

int score;

PowerUp item = new PowerUp();

Enemy alien = new Enemy();


/////////////////////////////////////////////////////////////////--SETUP--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() 
{
  size(1080,750);

  //HUD//

   textAlign(CENTER);

  for (int i = 0; i < 5; i++)
  {
    lifeList.add(new SpaceShip());
    lifeList.get(i).setY(52);
    lifeList.get(i).setDirectionX(0);
    lifeList.get(i).setDirectionY(0);
  }

  lifeList.get(0).setX(310);
  lifeList.get(1).setX(360);
  lifeList.get(2).setX(410);
  lifeList.get(3).setX(460);
  lifeList.get(4).setX(510);

  score = 0000;
  

  //STARS//
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(i);
  }


  //PLAYER//
  player = new SpaceShip();
  player.setX(540);
  player.setY(375);
  player.setDirectionX(0);
  player.setDirectionY(0); 
  player.setPointDirection(0);


  //ENEMY//

  //FIX//
  alien.setX(1080);
  alien.setY((int)(Math.random()*750));
  alien.setDirectionX((int)(Math.random()*8-5));
    if (alien.getDirectionX() == 0) {alien.setDirectionX(-1);}

    alien.setDirectionY((int)(Math.random()*8-5));
    if (alien.getDirectionY() == 0) {alien.setDirectionY(-1);}
  alien.setDead(true);


  //ASTEROIDS//
  for (int i = 0; i < 20; i++)
  {
    astList.add(new Asteroid());

    astList.get(i).setDirectionX((int)(Math.random()*3-1));
    if (astList.get(i).getDirectionX() == 0) {astList.get(i).setDirectionX(-1);}

    astList.get(i).setDirectionY((int)(Math.random()*3-1));
    if (astList.get(i).getDirectionY() == 0) {astList.get(i).setDirectionY(-1);}
  }


  //POWERUP//
  item.setX((int)(Math.random()*1060 + 10));
  item.setY((int)(Math.random()*750 + 110));
  item.setItemRotation(15);
}


//////////////////////////////////////////////////////////////////--DRAW--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void draw() 
{
  background(0);


  keyTyped();


  //STARS//
  for (Star starTemp : stars)
  {
    starTemp.show();
    if (player.getDead() == false)
    { starTemp.move(); }
  }  
  

  //BULLETS//
  if ( player.getDead() == false)
  {
    for(Bullet bullets : bulletList)
    {
      bullets.setBulletRotation(100);
      bullets.show();
      bullets.move();
    }
  }
  
   //ALIENBULLETS//
  if ( player.getDead() == false)
  {
    for(AlienBullet laser : alienBulletList)
    {
      if( alien.getDead() == false )
      laser.setBulletRotation(100);
      laser.show();
      laser.move();
    }
  }

  for(int i = 0; i < alienBulletList.size(); i++) 
  {
    //Prevents player from losing/taking damage if touches asteroid while in hyperspace
    if (player.getHyperStatus() == false && dist((int)player.getX(), (int)player.getY(), 
       (int)alienBulletList.get(i).getX(), (int)alienBulletList.get(i).getY()) < 35 )
    {
      //Check for powerup
      if (player.getPowerStat() == true)
      {
        player.setPowerStat(false);
      }

      alienBulletList.remove(i);
        i--;
        score = score - 300;
        lifeList.get(0).setHealth(lifeList.get(0).getHealth()-1);
    }
  }


  //SHIP//
  player.show();
  player.move();
  if (player.getHyperStatus() == true)
  {
    player.setColor(100);
  } 
  else
  {
    player.setColor(255);
  }


  //ENEMY//
  if (score == 700)
  { alien.setDead(false); }

  if (alien.getDead() == false)
  {
    alien.show();

    if (player.getDead() == false)
    { alien.move(); }
  }
  alien.setPointDirection(-(int)(player.getPointDirection()));





  //ASTEROIDS//
  if (gameStart == false)
  {
    fill(255);
    textSize(100);
    text("PRESS ENTER", 540, 85); 
    textSize(180);
    text("ASTEROIDS", 540, 710); 
  }

  else 
  {
    for(int i = 0; i < astList.size(); i++) 
    {
      //Prevents player from losing/taking damage if touches asteroid while in hyperspace
      if (player.getHyperStatus() == false && dist((int)player.getX(), (int)player.getY(), 
        (int)astList.get(i).getX(), (int)astList.get(i).getY()) < 35 )
      {
        //Check for powerup
        if (player.getPowerStat() == true)
        {
          player.setPowerStat(false);
        }

        astList.remove(i);
        i--;
        score = score - 100;
        lifeList.get(0).setHealth(lifeList.get(0).getHealth()-1);
      }
      else 
      {
        astList.get(i).show();
        if (player.getDead() == false)
        { astList.get(i).move(); }
      }
    }
  }

  //Removes bullets and asteroids on collision
  for (int i = 0; i < astList.size(); i++)
  {
    for (int j = 0; j < bulletList.size(); j++)
    {
      if (dist((int)bulletList.get(j).getX(), (int)bulletList.get(j).getY(), (int)astList.get(i).getX(), (int)astList.get(i).getY()) < 25 )
      {
        bulletList.remove(bulletList.get(j));
        astList.remove(astList.get(i));
        score = score + 100;
        break;
      }
    }
  }
  
  //POWERUP//
  if (score == 1100)
  { item.setPowerAvail(true); }

  if ( item.getPowerAvail() == true )
  {
    item.show();
    if (player.getDead() == false)
    { item.move(); }
  }

  if (player.getHyperStatus() == false && dist((int)player.getX(), (int)player.getY(), 
      (int)item.getX(), (int)item.getY()) < 35 )
  {
    player.setPowerStat(true);
    item.setPowerAvail(false);
    item.setX(600);
    item.setY(52);
  }

  if (player.getPowerStat() == true)
  {
    mousePressed();
  }

  //HUD//
  headsUpDisplay();
}


/////////////////////////////////////////////////////////////////--FUNCTIONS--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void keyTyped()
{
  if (keyPressed == true)
  {

    if( key == ENTER &&  gameStart == false ||  key == RETURN &&  gameStart == false )
    {  
      gameStart = true;
      player.setX(540);
      player.setY(375);
      
    }

    if (gameStart == true && player.getDead() == false)
    {
      
      if( key == 'w' || key == 'W' )
      {  player.accelerate(0.05); }
    

      else if( key == 's' || key == 'S')
      {
        player.setHyperStatus(true);
        player.setDirectionX(0);
        player.setDirectionY(0);
        player.setPointDirection((int)(Math.random()*360));
        player.setX((int)(Math.random()*1080));
        player.setY((int)(Math.random()*640+110));
      }
      
      else if( key == 'd' || key == 'D')
      {  player.rotate(10); }


      else if( key == 'a' || key == 'A')
      {  player.rotate(-10); }
    }
  }

  else 
    {
      player.setHyperStatus(false);
    }

}


public void mousePressed()
{
  //prevent shooting while in hyperspace
  if (mousePressed == true && player.getHyperStatus() == false && gameStart == true)
  {  bulletList.add(new Bullet(player)); 
     alienBulletList.add(new AlienBullet(alien));
   }
}


public void headsUpDisplay()
{
  noStroke();
  fill(150, 100);
  rect(0, 0, 1080, 100);

  if (gameStart == true)
  {
    textSize(65);
    fill(255);
    text("HEALTH", 140, 75);
    text("SCORE: " + score, 850, 75);
    if (score < 0)
    { score = 0; }
    

    if (lifeList.get(0).getHealth() == 5)
    {
      lifeList.get(0).show();
      lifeList.get(1).show();
      lifeList.get(2).show();
      lifeList.get(3).show();
      lifeList.get(4).show();
    }

    if (lifeList.get(0).getHealth() == 4)
    {
      lifeList.get(0).show();
      lifeList.get(1).show();
      lifeList.get(2).show();
      lifeList.get(3).show();
    }

    if (lifeList.get(0).getHealth() == 3)
    {
      lifeList.get(0).show();
      lifeList.get(1).show();
      lifeList.get(2).show();
    }

    if (lifeList.get(0).getHealth() == 2)
    {
      lifeList.get(0).show();
      lifeList.get(1).show();
    }

   if (lifeList.get(0).getHealth() == 1)
   {
      lifeList.get(0).show();
   }

   if (lifeList.get(0).getHealth() <= 0)
   {
      player.setDead(true);
      player.setDirectionX(0);
      player.setDirectionY(0);
      player.setPointDirection(0);
      player.setColor(0);
      textSize(150);
      fill(255);
      text("GAME OVER", 540, 450);
   }
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////