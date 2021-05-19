#include <iostream>
using namespace std;
// 클래스 선언부
class Shape { // Shape Basic Class
	int x, y;
public:
	Shape(int x, int y) {
		this->x = x;
		this->y = y;
		cout << "Shape 생성자" << endl;
	}
	~Shape() { cout << "Shape 소멸자" << endl;}
	int getx() {return x;} // 위치 x 반환
	int gety() {return y;} // 위치 y 반환
};

class Rectangle : public Shape { // Rectangle  Derived Class
	int width, height;
public:
	Rectangle(int x, int y, int width, int height) : Shape(x,y) {
		this->width = width;
		this->height = height;
		cout << "Rectangle 생성자:" << endl;
	}
	~Rectangle() { cout << "Rectangle 소멸자" << endl; }
	void draw();
	double getArea();
};

class Circle : public Shape { // Circle Derived Class
	int radius;
public:
	Circle(int x, int y, int radius) : Shape(x, y) {
		this->radius = radius;
		cout << "Circle 생성자:" << endl;
	}
	~Circle() {
		cout << "Circle 소멸자" << endl;
	}
	void draw();
	double getArea();

};
// 클래스 함수 구현
void Rectangle::draw() {
	cout << "Rectangle drawn at : (" << getx() << "," <<  gety() << ")" << endl;
}
double Rectangle::getArea() {
	return width * height;
}

void Circle::draw() {
	cout << "Circle drawn at : (" << getx() << "," << gety() << ")" << endl;
}
double Circle::getArea() {
	return radius * radius * 3.14;
}

int main() {
	Rectangle r(10, 20, 100, 100);  // (10, 20)위치에 가로 100, 세로 100인 사각형 객체 생성
	r.draw();
	cout << "사각형 면적 = " << r.getArea() << endl << endl;

	Circle c(120, 150, 40);  // (120,150)위치에 반지름 40인 원을 생성
	c.draw();
	cout << "원 면적 = " << c.getArea() << endl << endl;
	return 0;
}