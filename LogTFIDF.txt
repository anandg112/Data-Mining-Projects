// compute the weight of a matched term
double computeLogTFIDFWeight(int docID,
                     int termID,
                     int docTermFreq,
                     double qryTermWeight,
                     Index *ind)
{
  /*!!!!! Implement log TF and IDF weighting scheme !!!!!*/
return (1+ log(docTermFreq))*qryTermWeight*(log(ind->docCount()/ind->docCount(termID)));
}
