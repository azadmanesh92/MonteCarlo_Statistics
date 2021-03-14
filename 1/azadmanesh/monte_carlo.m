
clear all;
close all;

numberOfSteps = 100;
gridDim = 40;
experiments = 1000;
probabilityDistribution = zeros(gridDim, gridDim, 3);
for i=1:gridDim
for j=1:gridDim
   
      if i < j
         continue; 
      end
        
      imp = 0;
      left = 0;
      bottom = 0;
      top = 0;
      
      for m=1:experiments
          
      x = j; 
      y = i;
          
      for k=1:numberOfSteps
              
      directions = [-1 0 1];
      x = x + directions( randi([1 3]) );  
      y = y + directions( randi([1 3]) ); 
              
      if x < 1 
        left = left + 1;
        imp = imp + 1;
        break;
      end
              
      if y > gridDim
        bottom = bottom + 1;
        imp = imp + 1;
        break;
      end
              
      if y < x
        top = top + 1;
        imp = imp + 1;
        break;
      end

      end
      end
        
      probabilityDistribution(i,j,1) = bottom / imp;
      probabilityDistribution(i,j,2) = left / imp;
      probabilityDistribution(i,j,3) = top / imp;
      
end
end

pot = probabilityDistribution(:,:,1) * 10 + probabilityDistribution(:,:,2) * 0 + probabilityDistribution(:,:,3) * 100;

for n=1:3
for i=1:gridDim
for j=1:gridDim
    if j > i
        probabilityDistribution(i,j,n) = nan;
        pot(i,j) = 100;
    end
end
end
end

figure;
surf([1:gridDim],[1:gridDim],pot);
