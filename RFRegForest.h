# ifndef RFFOREST_H_
# define RFFOREST_H_

#include "RFRegTree.h"
#include "math.h"
using namespace std;

typedef uniform_int_distribution<size_t> SamplerObs;

class RFRegForest{
  public:
    RFRegForest( DataContainer *, SliceVar ,Slice, vector<float> ,RndEng, DistrVect, size_t );
    void learn();
    float predict(Feature);
    int predictInt(Feature);
    Slice sampleObs();
  private:
    DataContainer * data_ptr_;
    SliceVar slice_var_;
    Slice    slice_;
    vector<float> target_; 
    size_t min_per_node_;
    RndEng  engine_;
    DistrVect  distr_vect_var_;
    SamplerObs sampler_obs_;// distribution for sampling observation
    size_t n_tree_;

    size_t n_obs_per_tree_;
    vector<RFRegTree> tree_vect_;
};

#endif
