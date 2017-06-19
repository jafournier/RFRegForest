#include<iostream>
#include "DataContainer.h"
#include "RFRegNode.h"
#include "RFRegTree.h"
#include "RFRegForest.h"
using namespace std;

int main(void)//(int argc, const char **argv)
{
  DataContainer data;
  data.getDataFromMySQL((char*)"localhost",
                        (char*)"dummy",
                        (char*)"dummy",
                        (char*)"testdb",
                        (char*)"student_mat",
                        (char*)"student_meta");
//  void * ptr;
//  ptr = &(data.c_container_);
//  cout << " \n  test " << string((*ptr)[100][1])<< endl;
  cout << "data created" << endl ; 
  vector<float> target;
  size_t tidx = data.getIVarNum()-1;
  Slice slice;
  SliceVar slicevar;
  size_t nobs = data.getNRow();
  target.resize(nobs);
  slice.resize(nobs);
  cout << "here"<< endl;
  for(size_t i = 0; i <nobs; i++ ){
     target[i] = float(data.getI(i,tidx));
     slice[i] = i;
  }
  for(size_t i = 0 ; i < data.getNColI()-1  ; i++ ){
    slicevar.push_back(pair<char,int>('i',i));
  }
  int a;
  cout << data.getNColO()<< endl;
  cin >>a;
  for(size_t i = 0 ; i < data.getNColO(); i++ ){
    slicevar.push_back(pair<char,int>('o',i));
  }
  for(size_t i = 0 ; i < data.getNColC(); i++ ){
    slicevar.push_back(pair<char,int>('c',i));
  }
  cout << "traget created" << endl;
  // test on Feature
  RFRegNode node( &data,slicevar, slice, tidx, &target );
  cout << "node created" << endl;
  node.learn();
  cout << "node created" << endl;

  // random engine
  RndEng engine;
  DistrVect distr;
  distr.resize(slicevar.size());
   
  for(size_t i = 0; i < slicevar.size(); i++){
    distr[i] =uniform_int_distribution<std::size_t>(i,slicevar.size()-1); 
  }
  // test on Tree
 
  cout << "<<<<RUN TREE TEST>>>> "<< endl;
  printSlice(node.getRightSlice());
  RFRegTree tree( &data, 
                  slicevar ,
                  slice,
                  &target,
                  5,
                  &engine,
                  distr );
  tree.learn();
  cout << "tree result prediction" << tree.predict(data.getFeature(2)) << endl;
  cout << "<<<<RUN FOREST TEST>>>> "<< endl;
  RFRegForest forest(&data, slicevar, slice, target, engine, distr,10);  forest.learn();
   
  cout << " forest result prediction " << forest.predict(data.getFeature(2))<< " real value : "<< target[2] << endl;

  return 0;
}

