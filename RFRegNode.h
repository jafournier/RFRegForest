# ifndef RFREGNODE_H_
# define RFREGNODE_H_


#include <stdlib.h>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <boost/multi_array.hpp>
#include <algorithm>
#include <string>
#include <map>
#include <vector>
#include <tuple>

#include "DataContainer.h"


using namespace std;

typedef vector<size_t> Slice ;                          // slice of observation
typedef vector<pair<char,size_t>> SliceVar;             // slice of variable
// caracteristics type of
// the category for qualitative variables.
// moraly index,sum,sum of square
typedef map<string,tuple<size_t, float,float >> CatCarac; 

// for each class: number of elements, sum of the target, sum of square of the target
typedef map<string, float> OrderMap ;
typedef struct CompOrderMap{
    OrderMap order_;
    CompOrderMap(OrderMap order):order_(order){return;};
    bool operator()(const string & s1,const string & s2){
    return order_[s1]<order_[s2];
    }

} CompOrderMap;

// Helper function for debug
void printSlice(Slice);
void printSliceVar(SliceVar);



class RFRegNode{

  public:
    // constructor
    RFRegNode( DataContainer* , SliceVar , Slice  , size_t , vector<float> *);

    // setters
    void setIsLeaf(bool b ){ is_leaf_ = b; return ; };
    void setRightSon(size_t idx ){ idx_r_ = idx; return ; };
    void setLeftSon(size_t idx ){ idx_l_ = idx; return ; };

    // getters
    float getGini()const{ return gini_ ; };
    float getGiniGain()const{ return gini_-gini_split_ ; };
    size_t getRightIdx(){ return idx_r_ ; };
    size_t getLeftIdx(){ return idx_l_ ; };
    size_t getN()const{ return n_;};
    size_t getNL()const{ return n_r_ ; };
    size_t getNR()const{ return n_l_ ; };
    Slice getSlice()const { return slice_ord_;};
    Slice getSliceOrd()const{ return slice_;};
    SliceVar getSliceVar()const { return slicevar_;};
    Slice getLeftSlice()const{ return
          Slice(slice_ord_.begin(),slice_ord_.begin()+n_l_) ; };
    Slice getRightSlice()const{ return 
          Slice(slice_ord_.begin()+n_l_,slice_ord_.begin()+n_);};
    float getPrediction()const{ return prediction_;};
    bool isLeaf()const{return is_leaf_;};    
    // methods
    void learn();
    void tryI(size_t);
    void tryO(size_t);
    void initComputation();
    template<typename C>
    void trySplitComp(size_t , char, const C & );

    void trySplitClass(size_t, const Ctype & );
    size_t goLeftOrRight( Feature & );
    char getSelType(){return sel_type_;};

  private:
    DataContainer* pdata_;
    SliceVar slicevar_;
    Slice slice_;
    Slice slice_ord_;
    vector<float>* ptarget_;

    bool is_leaf_;
    float prediction_;
    size_t node_idx_;// idx in node vector of the tree// TODO change

    // store some data to avoid computating it always
    size_t n_;
    float sumtar_;
    float sumsqtar_; 
    float gini_ ;
    
    float gini_split_ ;
    size_t n_l_;
    size_t n_r_;

    // store utlimate split choice
    char sel_type_;
    size_t sel_idx_; //idx in the data container boost array
    size_t sel_obs_split_;
    float sel_thresh_f_ ;
    float sel_thresh_c_ ;
    int sel_thresh_i_ ;
    int sel_thresh_o_ ;
    OrderMap order_cat_map_;// to deal with categorial input feature

    // sons
    size_t idx_l_ ;
    size_t idx_r_ ;

};





template<typename C> // C :   container type element type
void RFRegNode::trySplitComp(size_t idx, char input_type, const C & cont){
    /* @cont: a boostmultiarray container Otype Itype Ctype
       @idx : idx of the column (in the boost multi_array)
       @input_type : 'i','o',or 'f'
       Rq: for class type, see trySplitClass in the .c
       effect: try to split the node according to idx variable.
               If this split is best than the previous, modify node argument 
               (to keep in memory the best split)
    */ 
    CompType<C> comp(cont ,idx);
    sort( slice_.begin(), slice_.end(), comp);

    size_t n_l = 0 ;
    size_t n_r = n_;
    float sumtar_l = 0 ; 
    float sumsqtar_l = 0; 
    float gini_h_min = gini_split_ ;// homogeneous gini of the partition
    float gini_h_temp = 0;
    int obs_split = -1 ;

    Slice::iterator it = slice_.begin();
    Slice::iterator it_next = slice_.begin();
    it_next++;
    Slice::iterator it_stop = slice_.end();
    while( it_next != it_stop ){
        if(it_next == it_stop){
            break;
        }
        
        while( cont[*it][idx] == cont[*it_next][idx] ){
            sumtar_l += ptarget_->at(*it) ; ///
            sumsqtar_l += pow(ptarget_->at(*it),2) ; ///
            n_l++; n_r--;
            it++; it_next++; 
            if(it_next == it_stop){
                break;
            }
        }
        if(it_next == it_stop){
            break;
        }
        gini_h_temp = n_l*(sumsqtar_l/n_l - pow(sumtar_l/n_l,2))
                     +n_r*( (sumsqtar_-sumsqtar_l)/n_r - pow((sumtar_-sumtar_l)/n_r,2) );
        gini_h_temp /= n_;

        if( gini_h_temp < gini_h_min ){
            gini_h_min = gini_h_temp;
            obs_split = *it;
        }
        it++; it_next++;
    }
    //scope effects-------
    if( obs_split != -1 ){ // i.e. if we indeed found something greater
        gini_split_ = gini_h_min ;
        slice_ord_ = slice_ ;
        n_l_ = n_l;
        n_r_ = n_r;
        sel_type_ = input_type;
        sel_idx_ = idx;
        sel_obs_split_ = obs_split;
        
        switch(input_type){
            case 'i' :
                sel_thresh_i_ = cont[obs_split][idx];
                break;
            case 'o' :
                sel_thresh_o_ = cont[obs_split][idx];
                break;
            case 'f' :
                sel_thresh_f_ = cont[obs_split][idx];
                break;
        }
    }
    //-------------------
}
# endif
