//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Star extends Floater
{
  private int starSize;
  private int myColor2;
  private int myColor3;

  public Star(int arg)
  {
    myColor = (int)(Math.random()*255);
    myColor2 = (int)(Math.random()*255);
    myColor3 = (int)(Math.random()*255);
    myCenterX = (int)(Math.random()*1080);
    myCenterY = (int)(Math.random()*750);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    starSize = (int)(Math.random()*3);
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move () 
  {      
    if (keyPressed == true)
    {
      if( key == 'w' || key == 'W' )
      {
        accelerate(-0.004);
      }
    }

    else if( key == 'd' || key == 'D')
    {
      rotate(10);
    }

    else if( key == 'a' || key == 'A')
    {
      rotate(-10);
    }

    super.move();   
  }

  public void show()
  {
    fill(myColor,myColor2,myColor3);
    noStroke();
    ellipse((int)myCenterX, (int)myCenterY, starSize, starSize);
  }   
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////