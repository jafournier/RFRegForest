# ifndef RFREGTREE_H_
# define RFREGTREE_H_
#include <random>
#include <queue>
#include "DataContainer.h"
#include "RFRegNode.h"

using namespace std;

typedef  vector<uniform_int_distribution<size_t>> DistrVect; 
typedef  default_random_engine RndEng;

class RFRegTree{
  // implement Tree structure for regression on a float variable
  // @ptarget_ : "label" data that we want to predict
  public:
    RFRegTree( DataContainer *, SliceVar ,Slice, vector<float> *, size_t nbr_min,  RndEng * , DistrVect  );
    void learn();
    float predict(Feature);
    int predictInt(Feature);
    SliceVar sampleVar();
    size_t getN(){return slice_.size();};
 
  private:
    DataContainer * pdata_;
    SliceVar slice_var_;
    Slice    slice_;
    vector<float> *  ptarget_; 
    size_t min_per_node_;
    RndEng*  pengine_;
    DistrVect  distr_vect_;
    
    size_t nbr_sample_var_;
    vector<RFRegNode> node_vect_;
};

# endif
