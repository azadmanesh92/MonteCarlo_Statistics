
clear all;
close all;

numberOfSteps = 100;
R_Max = 20;
Theta_Res = 20;
experiments = 1000;
probabilityDistribution = zeros(R_Max, 360/Theta_Res + 1, 4);
for R=1:R_Max
for THETA=1:Theta_Res:361
        
      imp = 0;
      q1 = 0;
      q2 = 0;
      q3 = 0;
      q4 = 0;
      
      for m=1:experiments
          
      r = R; 
      theta = THETA;
          
      for k=1:numberOfSteps
              
      directions = [-1 0 1];
      r = r + directions( randi([1 3]) );  
      if r < 1 
          r = 1;
      end
      theta = theta + Theta_Res * directions( randi([1 3]) ); 
              
      if r > R_Max 
        
        if theta > 0 && theta <= 90
          q1 = q1 + 1;
        end
        if theta > 90 && theta <= 180
          q2 = q2 + 1;
        end
        if theta > 180 && theta <= 270
          q3 = q3 + 1;
        end
        if theta > 270 && theta <= 360
          q4 = q4 + 1;
        end
        
        imp = imp + 1;
        break;
      end

      end
      end
        
      probabilityDistribution(R,ceil(THETA/20),1) = q1 / imp;
      probabilityDistribution(R,ceil(THETA/20),2) = q2 / imp;
      probabilityDistribution(R,ceil(THETA/20),3) = q3 / imp;
      probabilityDistribution(R,ceil(THETA/20),4) = q4 / imp;
      
end
end

%% Display
pot = probabilityDistribution(:,:,1) * 0 + probabilityDistribution(:,:,2) * 50 + probabilityDistribution(:,:,3) * 100 + probabilityDistribution(:,:,3) * 150;
polarPcolor([1:R_Max],[1:Theta_Res:361],pot);
