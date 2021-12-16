#include <stdio.h>

#define N 999

void add(int* a, int* b, int* c){

	for (int i=0;i<N;i++)
	{
		c[i] = a[i] + b[i];
	}
}

int main(){
	int a[N]={0}, b[N]={0}, c[N]={0};

	for (int i=0;i<N;i++)
	{
		a[i] = i+1;
		b[i] = i+2;
	}

	add(a, b, c);

	return 0;
}