function jC = jaccardCoefficient(ratings, itemid1, itemid2)
  %this function will calculate the jaccard coefficient from 2 movies
  
  %search for user that rate itemid1
  selectedrows1 = find(ratings(:,2) == itemid1);
  peoplethatrateitem1 = ratings(selectedrows1,1:2);
  
  %search for user that rate itemid2
  selectedrows2 = find(ratings(:,2) == itemid2);
  peoplethatrateitem2 = ratings(selectedrows2,1:2);
  
  %search for user that rate both movies
  peoplethatratebothitem1anditem2 = [0];
  peoplethatratebothitem1anditem2 = [peoplethatratebothitem1anditem2; intersect(peoplethatrateitem1(:,1), peoplethatrateitem2(:,1))];
  
  %assign the value of jaccard coefficient
  jC = (length(peoplethatratebothitem1anditem2(:,1))-1)/(length(selectedrows1)+length(selectedrows2)-(length(peoplethatratebothitem1anditem2(:,1))-1));
  
endfunction