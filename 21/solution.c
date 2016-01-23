#include <stdio.h>
int main(int argc, const char * argv[]) {
    FILE *file = fopen(argv[1], "r");
    char line[1024];
    while (fgets(line, 1024, file)) {
      int i, sum = 0;
      for (
        i = 0;
        i < 1024 && line[i] != '\0' && line[i] != '\n';
        i++
      ) sum += line[i] - '0';
      printf("%d\n", sum);
    }
    return 0;
}
