#include <iostream>
using namespace std;



class Rect {
	int width, height;
public:
	Rect(int w = 0, int h = 0) : width(w), height(h) {}
	void show() { cout << width << ", " << height << endl; }
	Rect operator+(Rect r2);
	bool operator>(int op2);
	bool operator&(Rect op2);
};
Rect Rect :: operator+(Rect r2) {
	Rect temp;
	temp.width = this->width + r2.height;
	temp.height += this -> height + r2.height;
	return temp;
}

bool Rect::operator>(int op2) {
	if (width > op2 && height > op2) return true;
	else return false;

}


int main() {
	Rect r1(3, 4), r2(5, 7), r3(-3, 2);
	Rect c;

	//c = r1 + r2;
	c = r1.operator+(r2);
	c.show();
	if (r3 > 0) cout << "0보다 크다.";
	else cout << "0보다 작다";

}