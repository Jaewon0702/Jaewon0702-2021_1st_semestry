#include <iostream>
using namespace std;

class Circle {
	int radius;
public:
	Circle() {
		radius = 1;
		cout << radius << " Constructor excuted!" << endl;
	}
	Circle(int r) : radius(r){
		cout << radius << " Constructor excuted!" << endl;
	}
	~Circle() {
		cout << radius << " Destructor" << endl;
	}
	int getRadius() { return radius; }
	void setRadius() {
		radius++;
	}
};

void increase(Circle* c){ // Circle c
	c -> setRadius(); //c.setRadius()
}

int main() {
	Circle waffle(30);
	increase(&waffle); // ������ ȣ�� X, �Ҹ��ڴ� ȣ��, call by value�� call by adress ���� ������!
	cout << waffle.getRadius() << endl; 
}