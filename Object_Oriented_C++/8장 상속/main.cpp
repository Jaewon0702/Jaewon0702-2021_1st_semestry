#include <iostream>
using namespace std;

class Point {
	int x, y;
public:
	void set(int x, int y) { this->x = x; this->y = y; }
	void showPoint() { cout << x << "," << y << endl; }
};
class ColorPoint : public Point {
	string color;
public:
	void serColor(string c) { this->color = c; }
	void showColorPoint() {
		cout << color << ":";
		showPoint();
	}
};

int main() {
	ColorPoint cp;
	cp.serColor("red");
	cp.set(30, 40);
	cp.showColorPoint();
	return 0;
}