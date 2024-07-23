#include <stdio.h>

int main() {
  int a, b, c, sq;
  scanf("%d %d %d%*c", &a, &b, &c);
  sq = (a * b) / 2;
  printf("%d\n", sq);
  
  return 0;
}