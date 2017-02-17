#include "RFRegTree.h"


RFRegTree::RFRegTree( DataContainer * pdata, 
                SliceVar slice_var ,
                Slice slice,
                vector<float> * ptarget,
                size_t nbr_min,
                RndEng* pengine,
                DistrVect distr_vect ):
pdata_(pdata), slice_var_(slice_var), slice_(slice), ptarget_(ptarget),min_per_node_(nbr_min), pengine_(pengine), distr_vect_(distr_vect)
{
    // define number of variables on  which to run optimisation on each node
    nbr_sample_var_ = int(slice_var_.size()/3);
}

void RFRegTree::learn(){
    node_vect_ = vector<RFRegNode>() ;
    node_vect_.push_back(RFRegNode(pdata_,
                                sampleVar(),
                                slice_,
                                0,
                                ptarget_
                                  ));
    queue<size_t> learn_queue;
    learn_queue.push(0);
    size_t node_idx=0;
    size_t left_idx;
    size_t right_idx;
    while( ! learn_queue.empty() ){
        node_idx = learn_queue.front();
        learn_queue.pop();
          
        cout << "learning for node: "<< node_idx << endl; // DEBUG
        node_vect_[node_idx].learn();
        // if condition to expand
        cout << "gain split: "<<  node_vect_[node_idx].getGiniGain()<< "gini origine : " << node_vect_[node_idx].getGini()<< endl;// DEBUG
        if( (node_vect_[node_idx].getN() > min_per_node_ ) && (node_vect_[node_idx].getGiniGain() > 0.01 * node_vect_[node_idx].getGini()) ){
        // then expand
            left_idx = node_vect_.size();
            Slice left_slice = node_vect_[node_idx].getLeftSlice();
            Slice right_slice = node_vect_[node_idx].getRightSlice();
            RFRegNode left_node = RFRegNode(pdata_,
                                          sampleVar(),
                                          left_slice,
                                          left_idx, 
                                          ptarget_);
            node_vect_.push_back( left_node);
            right_idx = node_vect_.size();
            RFRegNode right_node = RFRegNode(pdata_,
                                          sampleVar(),
                                          right_slice,
                                          right_idx, 
                                          ptarget_);
            node_vect_.push_back( right_node);
            learn_queue.push(left_idx);
            learn_queue.push(right_idx);
            node_vect_[node_idx].setRightSon(right_idx);
            node_vect_[node_idx].setLeftSon(left_idx);
            cout << " expanded, created nodes  "<<left_idx<<" and " <<right_idx << endl; // DEBUG
            cout << " print variable sampling for left and right "<< endl; // DEBUG
            printSliceVar(node_vect_[left_idx].getSliceVar());
            printSliceVar(node_vect_[right_idx].getSliceVar());
        }else{
            // else stopping condition
            node_vect_[node_idx].setIsLeaf(true);
        }
    }
    cout << "tree grown :" << node_vect_.size() <<" nodes "<< endl ;// DEBUG
}
                                                  


float RFRegTree::predict(Feature feature){
// predict the result given a feature
    size_t idx = 0;
    while(! node_vect_[idx].isLeaf()){
    idx = node_vect_[idx].goLeftOrRight(feature);
    }
    return node_vect_[idx].getPrediction();
}

int RFRegTree::predictInt(Feature feature){
    float res = predict(feature);
    return int(res);
}

SliceVar RFRegTree::sampleVar(){
    // observe a projection of the random permutation
    // BEWARE if you want to parallelize RFRegTree, there is a 
    // memory race for slice_var_ (or change by passing it in copy) 
    size_t id = 0;
    pair<char,size_t> mem;
    for( size_t i = 0; i < nbr_sample_var_ ; i++ ){
        id = distr_vect_[i](*pengine_);
        mem = slice_var_[i];
        slice_var_[i]= slice_var_[id];
        slice_var_[id]= mem;
    }
    return SliceVar( slice_var_.begin(), slice_var_.begin()+nbr_sample_var_ );
}
