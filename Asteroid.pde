//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Asteroid extends Floater
{
  private int astRotation;

  public Asteroid()
  {
    corners = 6;
    int[] xS = {(int)myCenterX-(int)(Math.random()*20+5), (int)myCenterX-(int)(Math.random()*26+5), (int)myCenterX-(int)(Math.random()*20+5), 
                (int)myCenterX+(int)(Math.random()*20+5), (int)myCenterX+(int)(Math.random()*26+5), (int)myCenterX+(int)(Math.random()*20+5)};
    int[] yS = {(int)myCenterY-(int)(Math.random()*24+5), (int)myCenterY, (int)myCenterY+(int)(Math.random()*24+5),
                (int)myCenterY+(int)(Math.random()*24+5), (int)myCenterY, (int)myCenterY-(int)(Math.random()*24+5)}; 
    xCorners = xS;
    yCorners = yS;
    myColor = (int)(Math.random()*75+75);
    myCenterX = (int)(Math.random()*1080);
    myCenterY = (int)(Math.random()*750);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    astRotation = (int)(Math.random()*3-1);
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
    if (astRotation == 0)
    {
      astRotation = -1;
    }

    rotate(astRotation);

    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
   
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