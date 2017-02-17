# ifndef DATA_CONTAINER_H_
# define DATA_CONTAINER_H_

#include <stdlib.h>
#include <iostream>
#include <sstream>
#include <stdexcept>

#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>
#include <boost/multi_array.hpp>
#include <string>
#include <map>
#include <vector>


using namespace std;

// Distinguish between Ordered class, Class, Integer, Float types
typedef boost::multi_array<int, 2> Otype;
typedef boost::multi_array<string, 2> Ctype;
typedef boost::multi_array<int, 2> Itype;
typedef boost::multi_array<float, 2> Ftype;

// this is the form of the feature for prediction frameword
typedef tuple< map<size_t,string>, map<size_t,float>, 
               map<size_t,int>,map<size_t,int> > Feature;
// class features, float feature, int feature, ordered class feature. 

typedef map<int,size_t> CounterMap;


class DataContainer{
/* implement DataContainer, i.e. class which can load and store data from a MySQL database
and put them whether they are cathegorical ('c'), ordered ('o'), int ('') or float ('')
*/
public:
    // constructors
    void getDataFromMySQL(char* , char*  , char* ,char* ,char* ,char* );
    string getC(size_t a , size_t   b ){return c_container_[a][b]; };
    float getF(size_t a , size_t   b ){return f_container_[a][b]; };
    int getI(size_t a , size_t   b ){return i_container_[a][b]; };
    int getO(size_t a , size_t   b ){return o_container_[a][b]; };
    int getF(size_t a, string st ){
             size_t i = name_to_idx_[st];
             pair<char,int> p = idx_to_container_key_[i];
             int j = p.second;
             return f_container_[a][j]; };// for debug. TOCHANGE
    size_t getIVarNum(){return i_container_.shape()[1];};
    size_t getNRow(){return i_container_.shape()[0];};// TOCHANGE
    size_t getNColI(){return i_container_.shape()[1];};// TOCHANGE
    size_t getNColO(){return o_container_.shape()[1];};// TOCHANGE
    size_t getNColC(){return c_container_.shape()[1];};// TOCHANGE
    Feature getFeature(size_t);// return feature map/vector associated to 
                               // a given row index
public:
    Ctype c_container_ ;              // container of class   data type
    Ftype f_container_ ;              // container of float   data type
    Itype i_container_ ;              // container of int     data type
    Otype o_container_ ;              // container of ordered data type
    vector<string> idx_to_name_ ;
    map<string, int> name_to_idx_ ;
    vector<pair<char,int>> idx_to_container_key_ ;
    map<char,void*> type_to_container_;
};


// helper type for comparison purpose
// basically a fonctor to carry out comparyson
// of lines with respect to a specific column
// Needed for split purpose

template< typename T >     // T : container type (I,O,F only)
struct CompType{
    const T & cont_; // container is assumed not to move
    int idx_ref_;
    CompType(const T & cont, size_t idx):
         cont_(cont), idx_ref_(idx){};
    bool operator()(const size_t & a ,const size_t & b ){
    return cont_[a][idx_ref_] < cont_[b][idx_ref_] ;};
    void setCompIdx(size_t idx){ idx_ref_ = idx; return; };
} ;


#endif
