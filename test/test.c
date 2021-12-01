#include <stdio.h>

void add(int* a, int* b, int* c){

	for (int i=0;i<100000;i++)
	{
		c[i] = a[i] - 0b1001;
	}
}

int main(){
	int a[100000]={0.0}, b[100000]={0.0}, c[100000]={0.0};

	for (int i=0;i<100000;i++)
	{
		a[i] = i+1;
		b[i] = i+2;
	}

	add(a, b, c);

	return 0;
}