#include "DataContainer.h"

void DataContainer::getDataFromMySQL(char* hostname , 
                                     char*  user ,
                                     char* password ,
                                     char*  db_name ,
                                     char*  table_name ,
                                     char*  metadata_table_name ){
  
  try {

    // create connection
    sql::Driver *driver;
    sql::Connection *con;
    sql::Statement *stmt;
    sql::ResultSet *res;
    driver = get_driver_instance();
    con = driver->connect(hostname, user, password);
    con->setSchema(db_name);
    stmt = con->createStatement();

    // count variable
    char query_string[1000] ;
    sprintf(query_string, "SELECT COUNT(*) FROM %s ", metadata_table_name);
    res = stmt->executeQuery(query_string) ;
    res->next();
    int count_var = stoi(res->getString(1));
    idx_to_name_.resize(count_var);
    idx_to_container_key_.resize(count_var); 

    // count number of observations
    sprintf(query_string, "SELECT COUNT(*) FROM %s ", table_name);
    res = stmt->executeQuery(query_string) ;
    res->next();
    size_t count_obs = stoi(res->getString(1));

    // create query and fetch to retriev metadata
    sprintf(query_string, "SELECT * FROM %s ", metadata_table_name);
    res = stmt->executeQuery(query_string);
    size_t cnt = 0 ;
    map<char,size_t> cnt_per_type = {{'o',0}, {'i', 0}, {'f', 0}, {'c',0}}; // BEWARE c++1 syntax
    map<pair<char,size_t>,size_t> key_to_idx ;
    char ch;
    while (res->next()) {
      idx_to_name_[cnt] =  res->getString(1);
      name_to_idx_[idx_to_name_[cnt]] = cnt;
      ch = res-> getString(2)[0];
      idx_to_container_key_[cnt]= pair<char,size_t>(ch, cnt_per_type[ch]) ;
      key_to_idx[pair<char,size_t>(ch, cnt_per_type[ch])] = cnt; 
      cout << " = " << ch; // DEBUG
      cout << ", name = '" << idx_to_name_[cnt] << "'" << endl; // DEBUG
      cnt_per_type[ch] += 1 ;
      cnt +=1;
    };
    // metadata retrieved!


    // Now we have variable names and size.
    o_container_.resize( boost::extents[count_obs][cnt_per_type['o']] );
    i_container_.resize( boost::extents[count_obs][cnt_per_type['i']] );
    f_container_.resize( boost::extents[count_obs][cnt_per_type['f']] );
    c_container_.resize( boost::extents[count_obs][cnt_per_type['c']] );
 
    for (std::map<pair<char,size_t>,size_t>::iterator it=key_to_idx.begin(); it!=key_to_idx.end(); ++it){
      std::cout << it->first.first <<" , " << it->first.second <<  " => " << it->second << '\n';
      
    }
    
    // build data query--------------------------------------------------------
    ostringstream os ;
    os << "SELECT " ;
    os << idx_to_name_[key_to_idx.begin()->second];
    for (std::map<pair<char,size_t>,size_t>::iterator it= next(key_to_idx.begin());
         it!=key_to_idx.end(); ++it){
        os << " , " << idx_to_name_[it->second];
    };

    os << " FROM " << table_name;
    string query_string2 = os.str();
    cout << query_string2;
    res = stmt->executeQuery(query_string2);
    // resultSet initialized --------------------------------------------------   

    cnt = 0; // DEBUG
    size_t cnt_col_idx;      
    while (res->next()) {
      cnt_col_idx = 1;
      for( size_t i = 0 ; i != cnt_per_type['c']; i++ ){
         c_container_[cnt][i] = res-> getString(cnt_col_idx );
         cnt_col_idx  += 1;
      }
      for( size_t i = 0 ; i != cnt_per_type['f']; i++ ){
         f_container_[cnt][i] = float(res-> getDouble(cnt_col_idx ));
         cnt_col_idx  += 1;
      }
      for( size_t i = 0 ; i != cnt_per_type['i']; i++ ){
         i_container_[cnt][i] = res-> getInt(cnt_col_idx );
         cnt_col_idx  += 1;
      }
      for( size_t i = 0 ; i != cnt_per_type['o']; i++ ){
         o_container_[cnt][i] = res-> getInt(cnt_col_idx );
         cnt_col_idx  += 1;
      }
      cnt++;
    };
    
    cout << "Download from database finished "<< cnt <<" columns processed "<< endl; // DEBUG
  

    // end delete Connector objects.-------------------------------------------
    delete res;
    delete stmt;
    delete con;
  // catch sql exception if any -----------------------------------------------
  } catch (sql::SQLException &e) {
    /*
      MySQL Connector/C++ throws three different exceptions:

      - sql::MethodNotImplementedException (derived from sql::SQLException)
      - sql::InvalidArgumentException (derived from sql::SQLException)
      - sql::SQLException (derived from std::runtime_error)
    */
    cout << "# ERR: SQLException in " << __FILE__;
    cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
    /* what() (derived from std::runtime_error) fetches error message */
    cout << "# ERR: " << e.what();
    cout << " (MySQL error code: " << e.getErrorCode();
    cout << ", SQLState: " << e.getSQLState() << " )" << endl;

  }

}


Feature DataContainer::getFeature(size_t idx){
    Feature feat;
    for(size_t i =0;i< c_container_.shape()[1]; i++ ){
        get<0>(feat)[i] = c_container_[idx][i] ;
    }
    for(size_t i =0;i< f_container_.shape()[1]; i++ ){
        get<1>(feat)[i] = f_container_[idx][i] ;
    }
    for(size_t i =0;i< i_container_.shape()[1]; i++ ){
        get<2>(feat)[i] = i_container_[idx][i] ;
    }
    for(size_t i =0;i< o_container_.shape()[1] ; i++ ){
        get<3>(feat)[i] = o_container_[idx][i] ;
    }
    return feat;
}



