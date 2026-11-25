#include <cstdio>
#include <ext/pb_ds/assoc_container.hpp>
int main() {
    __gnu_pbds::cc_hash_table<unsigned, unsigned> t;
    unsigned key = 0, r = 1, h = 0;
    for (int i = 0; i < 50000000; ++i) {
        r = r * 1103515245 + 12345;
        key = (key << 2 | r >> 30) & 0xfff;
        ++t[key];
    }
    for (auto& p : t) h = h * 31 + p.second;
    printf("%u\n", h);
}
