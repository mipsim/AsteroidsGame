//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class SpaceShip extends Floater  
{ 
  private int health;
  private boolean inHyperSpace;
  private boolean collision;
  private boolean powerStatus;
  private boolean dead;

  public SpaceShip()
  {
    corners = 17;
    int[] xS = {(int)myCenterX-11, (int)myCenterX-7, (int)myCenterX, (int)myCenterX+5, (int)myCenterX+10, (int)myCenterX+15, (int)myCenterX+20,
                (int)myCenterX+15, (int)myCenterX+10, (int)myCenterX+5, (int)myCenterX, (int)myCenterX-7, (int)myCenterX-11, (int)myCenterX-11,
                (int)myCenterX-20, (int)myCenterX-20, (int)myCenterX-11};

    int[] yS = {(int)myCenterY-20, (int)myCenterY-15, (int)myCenterY-11, (int)myCenterY-7, (int)myCenterY-7, (int)myCenterY-4, (int)myCenterY,
                (int)myCenterY+4, (int)myCenterY+7, (int)myCenterY+7, (int)myCenterY+11, (int)myCenterY+15, (int)myCenterY+20, (int)myCenterY+4,
                (int)myCenterY+12, (int)myCenterY-12, (int)myCenterY-4}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;

    inHyperSpace = false;
    collision = false;
    health = 5;
    powerStatus = false;
    dead = false;
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
  public void setColor(int x) {myColor = x;}
  public void setHyperStatus (boolean x) {inHyperSpace = x;} 
  public boolean getHyperStatus () {return inHyperSpace;} 
  public int getHealth() {return health;}
  public void setHealth(int x) {health = x;}
  public boolean getDead() {return dead;}
  public void setDead(boolean x) {dead = x;}
  public boolean getPowerStat() { return powerStatus; }
  public void setPowerStat(boolean x) { powerStatus = x; }

  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 110;    
    }   
    else if (myCenterY < 110)
    {     
      myCenterY = height;    
    }   
  } 
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
