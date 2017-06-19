# include "RFRegNode.h"


void printSlice(Slice sl){
    size_t cnt = 0;
    Slice::iterator it2 = sl.begin();
    for(Slice::iterator it = sl.begin(); it != sl.end(); it++){
    cout << cnt << " - " << *it << endl;
    cnt++;
    }
}

void printSliceVar(SliceVar slvar){
    size_t cnt = 0;
    SliceVar::iterator it2 = slvar.begin();
    for(SliceVar::iterator it = slvar.begin(); it != slvar.end(); it++){
    cout << cnt << " - " << it->first<<","<< it->second << endl;
    cnt++;
    }
}

RFRegNode::RFRegNode(DataContainer* pdata ,
               SliceVar slicevar, 
               Slice slice, 
               size_t node_idx,
               vector<float>* ptarget ): 
pdata_(pdata),slicevar_(slicevar),slice_(slice),
ptarget_(ptarget),is_leaf_(false),node_idx_(node_idx){
    initComputation();
}



void RFRegNode::initComputation(){
    /* Compute and store
       n_, sumtar_, sumsqtar_, gini_
       initialize gini_split_ to gini_
    */
    n_ = slice_.size();
    cout << "size "<< n_ << endl ; // DEBUG 
    sumtar_ = 0;
    sumsqtar_ = 0;
    for(Slice::iterator it = slice_.begin(); it != slice_.end(); it++){    
        sumtar_ += ptarget_->at(*it) ; ///
        sumsqtar_ += pow(ptarget_->at(*it),2) ; ///
    }
    gini_ = sumsqtar_/n_ - pow(sumtar_/n_,2);
    gini_split_ = gini_;// initiate gini_split to gini_
    prediction_ =  sumtar_/n_ ; 
}




void RFRegNode::learn(){
    /* perform learning (finding best split among a subset of features,        and saving the prediction of this node )
    */
    for( SliceVar::iterator it = slicevar_.begin(); it != slicevar_.end(); it++){
        switch(it->first){
            case 'i': 
                // tryI( it->second );
                trySplitComp<Itype>( it->second,'i', pdata_->i_container_ );
                break;
            case 'o': 
                //tryO( it->second );
                trySplitComp<Otype>( it->second,'o', pdata_->o_container_ );
                break;
            case 'c': 
                //tryO( it->second );
                trySplitClass( it->second, pdata_->c_container_ );
                break;
        }
    }
    cout <<"gini"<< gini_ << endl;// DEBUG
    cout <<"sel_type_"<< sel_type_ << endl; // DEBUG
    switch(sel_type_){
        case 'i':
            cout <<"sel_thresh_"<< sel_thresh_i_ << endl; // DEBUG
            break;
        case 'o':
            cout <<"sel_thresh_"<< sel_thresh_i_ << endl; // DEBUG
            break;
        case 'f':
            cout <<"sel_thresh_"<< sel_thresh_f_ << endl; // DEBUG
            break;
        case 'c':
            cout <<"sel_thresh_"<< sel_thresh_c_ << endl; // DEBUG
            break;
    }
    cout <<"sel_idx_"<< sel_idx_ << endl; // DEBUG
}

size_t RFRegNode::goLeftOrRight( Feature & feature){
    /* a feature arrive on a given node of the tree.
       should he go left, or right to reach a leaf?
    */
    size_t idx; 
    switch(sel_type_){
        case 'c':
            if( get<0>(feature).end()!= get<0>(feature).find(sel_idx_) ){
                idx=idx_l_;                  
            }else if(order_cat_map_[get<0>(feature)[sel_idx_]]){
                idx=idx_r_;                  
            }else{
                idx=idx_l_;                  
            }
            break;
        case 'f':
            if( get<1>(feature).end()!= get<1>(feature).find(sel_idx_) ){
                idx=idx_l_;                  
            }else if( get<1>(feature)[sel_idx_] > sel_thresh_f_ ){
                idx=idx_r_;                  
            }else{
                idx=idx_l_;                  
            }
            break;
        case 'i':
            if( get<2>(feature).end()!= get<2>(feature).find(sel_idx_) ){
                idx=idx_l_;                  
            }else if( get<2>(feature)[sel_idx_] > sel_thresh_i_ ){
                idx=idx_r_;                  
            }else{
                idx=idx_l_;                  
            }
            break;
        case 'o':
            if( get<3>(feature).end()!= get<3>(feature).find(sel_idx_) ){
                idx=idx_l_;                  
            }else if( get<3>(feature)[sel_idx_] > sel_thresh_o_ ){
                idx=idx_r_;                  
            }else{
                idx=idx_l_;                  
            }
            break;
        
    }
    return idx;
}


void RFRegNode::trySplitClass(size_t idx , const Ctype & cont){
    /* @cont: a boostmultiarray container Cttpe
       @idx : idx of the column (in the boost multi_array)
       @input_type : 'c' only not really usefull, just here to kke teh same syntax as trySplitComp<Itype/Otype/Ftype>
       Rq: for class type, see trySplitClass in the .c
       effect: try to split the node according to idx variable.
               If this split is best than the previous, modify node argument 
               (to keep in memory the best split)
    */ 
    cout << "c coordinate investigated: " << idx << endl;// DEBUG

    CatCarac carac;
    for(Slice::iterator it = slice_.begin(); it != slice_.end(); it++){
        if( carac.find(cont[*it][idx]) != carac.end() ){
            carac[cont[*it][idx]]= tuple< size_t, float, float>(0,0,0); 
        }

        get<0>(carac[cont[*it][idx]]) += 1; 
        get<1>(carac[cont[*it][idx]]) += ptarget_->at(*it);
        get<2>(carac[cont[*it][idx]]) += pow(ptarget_->at(*it),2); 
    }    
    OrderMap ordermap;
    for(CatCarac::iterator it = carac.begin();it != carac.end(); it++ ){
        ordermap[it->first] = get<1>(it->second)/get<0>(it->second);
    }
    CompOrderMap compordermap(ordermap);
    vector<string> ordered_cat;
    ordered_cat.resize(carac.size());
    int i = 0;
    for(CatCarac::iterator it = carac.begin();it != carac.end(); it++ ){
        ordered_cat[i] = it->first ;
        i++;
    }
    sort(ordered_cat.begin(),ordered_cat.end(),compordermap);
    size_t n_l = 0 ;
    size_t n_r = n_;
    float sumtar_l = 0 ; 
    float sumsqtar_l = 0; 
    float gini_h_min = gini_split_ ;// homogeneous gini of the partition
    float gini_h_temp = gini_split_;
    int change_flag = -1 ;
    float thresh;
    for( vector<string>::iterator it = ordered_cat.begin();
               it!= ordered_cat.end(); it++ ){
        sumtar_l += get<1>(carac[*it]);     
        sumsqtar_l += get<2>(carac[*it]);     
        n_r -= get<0>(carac[*it]);     
        n_l += get<0>(carac[*it]);
        gini_h_temp = n_l*(sumsqtar_l/n_l - pow(sumtar_l/n_l,2))
                     +n_r*( (sumsqtar_-sumsqtar_l)/n_r - pow((sumtar_l-sumtar_)/n_r,2) );
        gini_h_temp /= n_;
        cout << "gini_temp " << gini_h_temp << "gini_min"<< gini_h_min <<" " << n_r << " - "<< n_l << "-- " << n_ << endl;// DEBUG
        if( gini_h_temp < gini_h_min ){
            gini_h_min = gini_h_temp;
            change_flag = 1;
            thresh = ordermap[*it];
        }
    }
 
    //scope effects-------
    if( change_flag == 1 ){ 
        // i.e. if we indeed found something greater
        gini_split_ = gini_h_min ;
        slice_ord_ = slice_ ;
        n_l_ = n_l;
        n_r_ = n_r;
        sel_type_ = 'c';
        sel_idx_ = idx;
        order_cat_map_ = ordermap;
        sel_thresh_c_ = thresh;
        cout << " change gini occured class split" << endl; // DEBUG
    }
    //-------------------
}
