#include "h.hpp"
int make_iteration(int from,int to,int d,bool thread)
{
   int c{0};
   if (thread) {
      for (int j=0; j<threads; ++j) {
         int span{(to-from+1)/threads};
         c += make_iteration(from+span*j,span+span*j,d,false);
      }
   }
   else {
      Node_pool pool;
      for (int i=from; i<=to; ++i) {
         Node *a = make(d,pool);
         c += a->check();
      }
   }
   return c;
}

