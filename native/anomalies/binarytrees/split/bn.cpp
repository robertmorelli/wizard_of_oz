#include "h.hpp"
static uint32_t fnv(uint32_t h, const char *s, int len) {
    for (int i = 0; i < len; i++) { h ^= (unsigned char)s[i]; h *= 16777619u; }
    return h;
}

extern "C" __attribute__((export_name("bench"))) uint32_t bench(int n)
{
   uint32_t h = 2166136261u;
   char buf[128];
   int min_depth = 4,
      max_depth = std::max(min_depth+2, n),
      stretch_depth = max_depth+1;

   {
      Node_pool pool;
      Node *c = make(stretch_depth,pool);
      h = fnv(h, buf, snprintf(buf, sizeof buf, "stretch tree of depth %d\t check: %d\n", stretch_depth, c->check()));
   }

   Node_pool long_lived_pool;
   Node *long_lived_tree=make(max_depth,long_lived_pool);

   for (int d=min_depth; d<=max_depth; d+=2) {
      int iterations = 1 << (max_depth - d + min_depth);
      int   c=0;
      c = make_iteration(1,iterations,d,true);
      h = fnv(h, buf, snprintf(buf, sizeof buf, "%d\t trees of depth %d\t check: %d\n", iterations, d, c));
   }

   h = fnv(h, buf, snprintf(buf, sizeof buf, "long lived tree of depth %d\t check: %d\n", max_depth, long_lived_tree->check()));

   return h;
}
