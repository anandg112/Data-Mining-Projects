// compute the weight of a matched term
double computeOkapiWeight(int docID,
                     int termID,
                     int docTermFreq,
                     double qryTermWeight,
                     Index *ind)
{
  /*!!!!! Implement Okapi weighting scheme !!!!!*/
 return (docTermFreq/(docTermFreq + 0.5 + 1.5*(ind->docLength(docID)/ind->docLengthAvg())))*log((ind->docCount() - ind->docCount(termID)+ 0.5)/(ind->docCount(termID) + 0.5))*((8 + qryTermWeight/(7+qryTermWeight)));
}
