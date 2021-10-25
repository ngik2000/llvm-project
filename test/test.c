#include <stdio.h>

int main()

{

	int sum[100000]={1,2,3,4};

	int x = 0;

	for (int i=1;i<100000;i++)

	{

			x  +=sum[i-1];

	}

	sum[0] = x;

	return sum[0];

}