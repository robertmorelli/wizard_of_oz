// timeit CMD ARGS...: run CMD once (stdout/stderr to /dev/null) and print
// "wall_ms user_ms sys_ms minflt majflt maxrss_kb". Only fork/exec/wait4 sit between the clock reads.
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>
int main(int argc, char **argv) {
  if (argc < 2) return 2;
  struct timespec a, b; struct rusage ru; int st;
  clock_gettime(CLOCK_MONOTONIC, &a);
  pid_t p = fork();
  if (p == 0) { int fd = open("/dev/null", O_WRONLY); dup2(fd, 1); dup2(fd, 2); execvp(argv[1], argv + 1); _exit(127); }
  wait4(p, &st, 0, &ru);
  clock_gettime(CLOCK_MONOTONIC, &b);
#ifdef __APPLE__
  long rss = ru.ru_maxrss / 1024;
#else
  long rss = ru.ru_maxrss;
#endif
  printf("%.3f %.1f %.1f %ld %ld %ld\n", (b.tv_sec - a.tv_sec) * 1e3 + (b.tv_nsec - a.tv_nsec) / 1e6,
    ru.ru_utime.tv_sec * 1e3 + ru.ru_utime.tv_usec / 1e3, ru.ru_stime.tv_sec * 1e3 + ru.ru_stime.tv_usec / 1e3,
    ru.ru_minflt, ru.ru_majflt, rss);
  return WIFEXITED(st) ? WEXITSTATUS(st) : 1;
}
