
#include "RFRegForest.h"

RFRegForest::RFRegForest( DataContainer * dptr, 
                SliceVar slice_var ,
                Slice slice,
                vector<float> target,
                RndEng engine,
                DistrVect distr_vect,
                size_t ntree = 50 ):
data_ptr_(dptr), slice_var_(slice_var), slice_(slice), target_(target), engine_(engine), distr_vect_var_(distr_vect),n_tree_(ntree){
    n_obs_per_tree_ = size_t(slice.size()/3);
    min_per_node_ = size_t(sqrt(n_obs_per_tree_));
    for(size_t i = 0; i < slice_var.size(); i++){
        distr_vect_var_[i] =uniform_int_distribution<std::size_t>(i,slice_var.size()-1); 
    }
    sampler_obs_ = SamplerObs(0,slice_.size()-1);
    tree_vect_.reserve(ntree);  
}

 
Slice RFRegForest::sampleObs(){
    // observe a projection of the random permutation
    // BEWARE if you want to parallelize RFRegTree, there is a 
    // memory race for slice_var_ (or change by passing it in copy) 
    Slice sl;
    sl.resize(n_obs_per_tree_);
    for( size_t i = 0; i < n_obs_per_tree_ ; i++ ){
        size_t idx = sampler_obs_(engine_);
        sl[i] = slice_[idx];
    }
    return sl;
}

void RFRegForest::learn(){
    /* perform learning for each tree.
    */
    for(size_t i = 0 ; i < n_tree_; i++){
        RFRegTree tree(data_ptr_,slice_var_,sampleObs(),&target_,min_per_node_,&engine_,distr_vect_var_);
        tree_vect_.push_back(tree);
    }

    for(size_t i = 0 ; i < n_tree_; i++){
        tree_vect_[i].learn();
    }
}

float RFRegForest::predict(Feature feature){
    /* give the average prediction of each tree
    */
    float res;
    for(vector<RFRegTree>::iterator it = tree_vect_.begin(); it != tree_vect_.end();it++ ){
        res += it->predict(feature);
    }
    res /= tree_vect_.size();
    return res;
}


int RFRegForest::predictInt(Feature feature){
    /* give the integer version of the average of prediction of each tree
    */
    return int(predict(feature));
}
