function best5jc = fivehighestjc(ratings, items, itemid)
  %return 5 most highest jaccard coefficient with to itemid
  
  %initialization of jaccard coefficient list
  jclist = [];
  
  %assigning every movies with jaccard coefficient to itemid
  for i=1:length(items)
    jclist = [jclist; [i, jaccardCoefficient(ratings, i, itemid)]];
  end
  
  %list of best 5 jaccard coefficient to itemid
  best5jc = sortrows(jclist,2);
  best5jc = best5jc(length(jclist(:,1))-5:length(jclist(:,1))-1,:);
  best5jc = flipud(best5jc);
  
  fprintf(1,"No. Movie_Name Item_Id Jaccard_Coefficient\n");
  for i=1:5,
    fprintf(1,"%d. %s %d %f\n",i,items{best5jc(i,1)},best5jc(i,1),best5jc(i,2));
  end
  
endfunction