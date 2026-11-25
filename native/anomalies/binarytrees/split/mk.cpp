#include "h.hpp"
Node *make(int d,Node_pool& pool)
{
   if (d==0)
      return pool.construct();
   return pool.construct(make(d-1,pool),make(d-1,pool));
}

