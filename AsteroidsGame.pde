//////////////////////////////////////////////////////////////--DECLARATION--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


Star [] stars = new Star[600];

ArrayList <Asteroid> astList = new ArrayList <Asteroid>();

SpaceShip player;

ArrayList <SpaceShip> lifeList = new ArrayList <SpaceShip>();

ArrayList <Bullet> bulletList = new ArrayList <Bullet>();

boolean gameStart = false;

int score;


/////////////////////////////////////////////////////////////////--SETUP--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() 
{
  size(1080,750);

  //HUD//
  for (int i = 0; i < 5; i++)
  {
    lifeList.add(new SpaceShip());
    lifeList.get(i).setY(90);
    lifeList.get(i).setDirectionX(0);
    lifeList.get(i).setDirectionY(0);
  }

  lifeList.get(0).setX(30);
  lifeList.get(1).setX(70);
  lifeList.get(2).setX(110);
  lifeList.get(3).setX(150);
  lifeList.get(4).setX(190);

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


  //ASTEROIDS//
  for (int i = 0; i < 16; i++)
  {
    astList.add(new Asteroid());

    astList.get(i).setDirectionX((int)(Math.random()*3-1));
    if (astList.get(i).getDirectionX() == 0) {astList.get(i).setDirectionX(-1);}

    astList.get(i).setDirectionY((int)(Math.random()*3-1));
    if (astList.get(i).getDirectionY() == 0) {astList.get(i).setDirectionY(-1);}
  }
}


//////////////////////////////////////////////////////////////////--DRAW--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void draw() 
{
  background(0);


  keyTyped();

  //If holding powerup:
  //mousePressed();


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


  //ASTEROIDS//
  if (gameStart == false)
  {
    textSize(150);
    fill(255);
    text("PRESS ENTER", 75, 650); 
  }

  else 
  {
    for(int i = 0; i < astList.size(); i++) 
    {
      //Prevents player from losing/taking damage if touches asteroid while in hyperspace
      if (player.getHyperStatus() == false && dist((int)player.getX(), (int)player.getY(), 
        (int)astList.get(i).getX(), (int)astList.get(i).getY()) < 35 )
      {
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
    

  //HUD//
  headsUpDisplay();
}


/////////////////////////////////////////////////////////////////--FUNCTIONS--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void keyTyped()
{
  if (keyPressed == true)
  {

    if( key == 'g' &&  gameStart == false || key == 'G' && gameStart == false)
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
        player.setY((int)(Math.random()*750));
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
  {  bulletList.add(new Bullet(player)); }
}


public void headsUpDisplay()
{
  if (gameStart == true)
  {
    if ( player.getDead() == false) 
    {
      textSize(52);
      fill(255);
      text("HEALTH", 15, 60);
      text("SCORE: " + score, 700, 60);
      if (score < 0)
      { score = 0; }
    }
    

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

   if (lifeList.get(0).getHealth() == 0)
   {
      player.setDead(true);
      player.setDirectionX(0);
      player.setDirectionY(0);
      player.setPointDirection(0);
      player.setColor(0);
      textSize(150);
      fill(255);
      text("GAME OVER", 110, 450);
   }
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////