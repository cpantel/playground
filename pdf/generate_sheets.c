#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char* argv[]) {
	if (argc != 3 ) {
		fprintf(stderr, "bad argument count\n");
		return 1;
	}
	int sheets = atoi(argv[1]);
	if (sheets == 0) {
		fprintf(stderr, "bad sheet count\n");
		return 2;
	}

	int start = atoi(argv[2]);

	int pages = sheets * 4;
	int fold  = 2;
	for (int i = 1; i <= pages / fold ; i+=2) {
		int p = i;
		printf("%d,%d,%d,%d,", 
			start -1 + pages + 1 -p,
			start -1 + p, 
			start -1 + p + 1, 
			start -1 + pages - p
		);
	}

}
