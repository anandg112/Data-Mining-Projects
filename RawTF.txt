// compute the weight of a matched term
double computeRawTFWeight(int docID,
                     int termID,
                     int docTermFreq,
                     double qryTermWeight,
                     Index *ind)
{
  //implementation of raw TF weighting scheme
  return docTermFreq*qryTermWeight;
}
