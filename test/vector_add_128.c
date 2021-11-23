#include <stdio.h>
#include "data.h"
#include "crc.h"

#define N 128

int a[N];
int b[N];
int s[N] = {0};

int *init_data = (int*)__320mm_dat;

unsigned long imatrix_calc_crc32(int *a)
{
    static unsigned long crc_table[256];
    unsigned long sum = 0;
    int i;

    make_crc32_table(crc_table);

    for (i = 0; i < N; i++)
      sum = update_crc32(sum, a[i], crc_table);
    return sum;
}

void addarrays(int *a, int *b, int *c)
{
  int i;
  for(i = 0; i < N; i++)
    c[i] = a[i] + b[i];
}

int main(void)
{
  int i, y;
  int d = 0;
  for(y=0; y<N; y++) {
      a[y] = init_data[d     % (128)];
      b[y] = init_data[(d+1) % (128)];
      d +=2;
  }
  
  addarrays(a, b, s);
  for(i = 0; i < N; i += N/16)
    printf("s[%d] = %d\n", i, s[i]);
  printf("CRC32=%lu\n", imatrix_calc_crc32(s));
  return 0;
}
