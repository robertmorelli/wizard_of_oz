// Minimal knucleotide: count k-mers of a random ACGT string with pbds cc_hash_table.
// Os ~30% faster than O3 on Apple clang (O3 doesn't inline the lookup; key spills to stack).
#include <cstdio>
#include <cstdint>
#include <vector>
#include <chrono>
#include <ext/pb_ds/assoc_container.hpp>

template <unsigned K> struct Key {
    uint32_t d;
    struct Hash { uint32_t operator()(const Key& k) const { return k.d; } };
    bool operator==(const Key& o) const { return d == o.d; }
};

template <unsigned K>
uint32_t count(const std::vector<unsigned char>& s) {
    __gnu_pbds::cc_hash_table<Key<K>, unsigned, typename Key<K>::Hash> t;
    Key<K> key{0};
    for (unsigned i = 0; i < K; ++i) key.d = key.d << 2 | s[i];
    ++t[key];
    for (size_t i = K; i < s.size(); ++i) {
        key.d = (key.d << 2 | s[i]) & ((1u << 2 * K) - 1);
        ++t[key];
    }
    uint32_t h = t.size();
    for (auto& p : t) h = h * 31 + p.second;
    return h;
}

int main() {
    std::vector<unsigned char> s(5000000);
    uint32_t r = 1;
    for (auto& c : s) { r = r * 1103515245 + 12345; c = r >> 30; }
    auto t0 = std::chrono::steady_clock::now();
    uint32_t h = 0;
    for (int rep = 0; rep < 5; ++rep) h += count<2>(s) + count<4>(s) + count<6>(s);
    auto t1 = std::chrono::steady_clock::now();
    printf("%.1f ms  %u\n", std::chrono::duration<double, std::milli>(t1 - t0).count(), h);
}
