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
	increase(&waffle); // 생성자 호출 X, 소멸자는 호출, call by value와 call by adress 차이 인지해!
	cout << waffle.getRadius() << endl; 
}