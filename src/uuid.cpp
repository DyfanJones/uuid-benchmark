#include <Rcpp.h>
#include "uuid.h"
using namespace Rcpp;


//  [[Rcpp::export]]
CharacterVector uuid_v4_cpp(size_t n = 1) {
 CharacterVector uuids(n);

 for (size_t i = 0; i < n; ++i) {
   std::string s = uuid::v4::UUID::New().String();
   uuids[i] = s;
 }

 return uuids;
}

