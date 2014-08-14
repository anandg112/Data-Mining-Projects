// compute the weight of a matched term
double computeRawTFIDFWeight(int docID,
                     int termID,
                     int docTermFreq,
                     double qryTermWeight,
                     Index *ind)
{
  /*!!!!! Implement raw TF and IDF weighting scheme !!!!!*/
  return docTermFreq*qryTermWeight*log(ind->docCount()/ind->docCount(termID));
}
