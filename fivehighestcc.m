function best5cc = fivehighestcc(ratings, items, itemid)
  %return 5 most highest jaccard coefficient with to itemid
  
  %initialization of jaccard coefficient list
  cclist = [];
  
  %assigning every movies with jaccard coefficient to itemid
  for i=1:length(items)
    cclist = [cclist; [i, correlationCoefficient(ratings, i, itemid)]];
  end
  
  %list of best 5 jaccard coefficient to itemid
  best5cc = sortrows(cclist,2);
  best5cc = best5cc(length(cclist(:,1))-5:length(cclist(:,1))-1,:);
  best5cc = flipud(best5cc);
  
  fprintf(1,"No. Movie_Name Item_Id Correlation_Coefficient\n");
  for i=1:5,
    fprintf(1,"%d. %s %d %f\n",i,items{best5cc(i,1)},best5cc(i,1),best5cc(i,2));
  end
  
endfunction