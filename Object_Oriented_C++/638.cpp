#include <iostream>
#include <fstream>
using namespace std;

int main() {
	char buf[100];
	ifstream fin("c:\\Temp\\tel.txt");
	if (!fin) {
		cout << "오류입니다" << endl;
	}
	while (!fin.eof()) {
		fin.read(buf, 100);
		int n = fin.gcount();
		cout.write(buf, n);
	}

	char ch;
	while ((ch = fin.get()) != EOF) {
		cout << ch;
	}
}