#include <stdio.h>

extern "C" int rozmiar(wchar_t* napis);

int main()
{
	wchar_t text[1000];
	fgetws(text, 124, stdin);
	int n = rozmiar(text);
	printf_s("%d", n);
	return 0;
}