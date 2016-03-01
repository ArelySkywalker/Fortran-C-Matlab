#define THRESHOLD 600
#define STARTCOUNT 0
#include <tank_Cwrap.h>
/*
  successfully deals with curves and 90 degree turns.
*/
int loopCount = STARTCOUNT;
int tLCount = STARTCOUNT;
void setup()
{
  //former speed 123
    setSpeed(111);
   // enableDebug();
   // testSensors(1000);
   
}

void loop()
{
/*
  Updating sensors to detect the lighting to determind turns.
*/
   updateSensors();
   
   
    
       //forward(); 
   if(lf_left > THRESHOLD && lf_mleft > THRESHOLD && lf_right > THRESHOLD && lf_mright > THRESHOLD)
   {
     turnLeft_hard();
     loopCount=loopCount+1;
     if(loopCount>2000)
     {
       turnRight_hard();
     }
     if(loopCount>7000)
     {
       loopCount = STARTCOUNT;
     }
       /*if(loopCount<50)
     {
       turnLeft_hard;
       loopCount ++;
     }
     else if (loopCount>=50 && loopCount<100)
     {
       turnRight_hard;
       loopCount++;
     }
     else
     {
       loopCount = STARTCOUNT;
     }*/
   }
   else if(lf_left<THRESHOLD && lf_mleft>THRESHOLD && lf_mright >THRESHOLD&& lf_right>THRESHOLD)
   {
     tLCount++;
     if(tLCount>300)
     {
       turnRight_hard();
     }
     if(tLCount>1000)
     {
       tLCount=STARTCOUNT;
     }
   }
   else if(lf_mleft >= THRESHOLD)
   {
       turnLeft_slight();  
   }
   else if (lf_mright >= THRESHOLD)
   {
       turnRight_slight();
   }
   else if ((lf_left >= THRESHOLD) && (lf_mleft >= THRESHOLD)) // for use with right angle turn to left. Note order is important
   {
       while(lf_mright < THRESHOLD)  
       {
           turnLeft_slight();  
           updateSensors();
       }
   }
   else if ((lf_right >= THRESHOLD)&& (lf_mright >= THRESHOLD)) // for use with right angle turn to right. Note order is important 
   {
       while(lf_mleft < THRESHOLD)
       { 
           turnRight_slight();
           updateSensors();
       }   
   }
   else if(lf_left >= THRESHOLD) // curve handling left
   {
       while(lf_mright < THRESHOLD)    
       {
           turnLeft();   
           updateSensors();
       }
   } 
   else if(lf_right >= THRESHOLD) // curve handling right
   {
        while(lf_mleft < THRESHOLD)
       { 
           turnRight();
           updateSensors();
       }    
   }
   else if(lf_left < THRESHOLD && lf_mleft > THRESHOLD && lf_mright > THRESHOLD && lf_right < THRESHOLD)
   {
     while(lf_left < THRESHOLD && lf_mleft > THRESHOLD && lf_mright > THRESHOLD && lf_right < THRESHOLD)
     {
       forward();
       updateSensors();
     }
   }
   else if(lf_left <THRESHOLD && lf_mleft < THRESHOLD && lf_right < THRESHOLD && lf_mright)
   {
     turnAround_left();
   }
   else 
   {
       stop();
   }  
}   
