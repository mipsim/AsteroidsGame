//////////////////////////////////////////////////////////////--DECLARATION--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


Star [] stars = new Star[600];

ArrayList <Asteroid> astList = new ArrayList <Asteroid>();

SpaceShip player;

SpaceShip life;

ArrayList <Bullet> bulletList = new ArrayList <Bullet>();


/////////////////////////////////////////////////////////////////--SETUP--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() 
{
  size(1080,750);

  //INTERFACE//
  life = new SpaceShip();
  life.setX(30);
  life.setY(70);
  life.setDirectionX(0);
  life.setDirectionY(0);


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


  //STARS//
  for (Star starTemp : stars)
  {
    starTemp.show();
    starTemp.move();
  }  
  

  //BULLETS//
  for(Bullet bullets : bulletList)
  {
    bullets.setBulletRotation(100);
    bullets.show();
    bullets.move();
  }


  //SHIP//
  player.show();
  player.move();
  if (player.getHyperStatus() == true)
  {
    player.setColor(60);
  } 
  else
  {
    player.setColor(255);
  }


  //ASTEROIDS//
  for(int i = 0; i < astList.size(); i++) 
  {
    //Prevents player from losing/taking damage if touches asteroid while in hyperspace
    if (player.getHyperStatus() == false && dist((int)player.getX(), (int)player.getY(), 
       (int)astList.get(i).getX(), (int)astList.get(i).getY()) < 35 )
    {
      astList.remove(i);
      i--;
    }

    else 
    {
      astList.get(i).show();
      astList.get(i).move();
    }
  }

  //INTERFACE//
  textSize(40);
  fill(255);
  text("HEALTH", 20, 40); 
  
  for(int i = 0; i < 5; i++)
  {
    life.show();
  }

}


/////////////////////////////////////////////////////////////////--FUNCTIONS--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void keyTyped()
{
  if (keyPressed == true)
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
  else 
    {
      player.setHyperStatus(false);
    }
}


public void mousePressed()
{
  //prevent shooting while in hyperspace
  if (mousePressed == true && player.getHyperStatus() == false)
  {  bulletList.add(new Bullet(player)); }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////