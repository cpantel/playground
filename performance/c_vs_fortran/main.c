#include <stdlib.h>

#define DIM 1000

int main(int argc, char* argv[]) {
/*  if (argc!=2) {
    return 1;
  }
  int dim=atoi(argv[1]);
  int* m = malloc(sizeof(int)*dim*dim);
*/
  int m[DIM][DIM];


  for (int i=0; i< DIM; ++i) {
    for (int j=0; j < DIM; ++j) {
      m[i][j]=0;
    }
  }

  for (int i=0; i< DIM; ++i) {
    for (int j=0; j < DIM; ++j) {
      ++m[i][j];
    }
  }

  return 0;
}
