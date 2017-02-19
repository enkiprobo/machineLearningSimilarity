function cC = correlationCoefficient(ratings, itemid1, itemid2)
  %this function will return correlation coefficient of ratings from 2 movies
  %source of formula http://www.statisticshowto.com/how-to-compute-pearsons-correlation-coefficients/
  
  %search for user that rate itemid1
  selectedrows1 = find(ratings(:,2) == itemid1);
  peoplethatrateitem1 = ratings(selectedrows1,1:3);
  
  %search for user that rate itemid2
  selectedrows2 = find(ratings(:,2) == itemid2);
  peoplethatrateitem2 = ratings(selectedrows2,1:3);
  
  %search for user that rate both movies
  peoplethatratebothitem1anditem2 = [0];
  peoplethatratebothitem1anditem2 = [peoplethatratebothitem1anditem2; intersect(peoplethatrateitem1(:,1), peoplethatrateitem2(:,1))];
  
  %return 0 if # of people that rate less than <>
  if length(peoplethatratebothitem1anditem2(:,1))<=10,
    cC = 0;
  %else, make new list that correspond of iduser ratemovie1 and ratemovie2  
  else
    userratelist = [];
    for i=2:length(peoplethatratebothitem1anditem2(:,1))
      iduser = peoplethatratebothitem1anditem2(i,1);
      ratemovie1 = peoplethatrateitem1(find(peoplethatrateitem1(:,1)==iduser),3);
      ratemovie2 = peoplethatrateitem2(find(peoplethatrateitem2(:,1)==iduser),3);
      userratelist = [userratelist; iduser ratemovie1 ratemovie2];
    end
    %disp(userratelist);
    
    %calculate the correlation coefficient
    summovie1 = sum(userratelist(:,2));
    summovie2 = sum(userratelist(:,3));
    sumsquaremovie1 = sum(userratelist(:,2).*userratelist(:,2));
    sumsquaremovie2 = sum(userratelist(:,3).*userratelist(:,3));
    sumtimemovie12 = sum(userratelist(:,2).*userratelist(:,3));
    n = length(userratelist(:,1));
    
    %return the correlation coefficient
    cC = (n*sumtimemovie12-summovie1*summovie2)/(sqrt((n*sumsquaremovie1-summovie1**2)*(n*sumsquaremovie2-summovie2**2)));
  end
endfunction