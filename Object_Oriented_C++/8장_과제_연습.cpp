#include <iostream>
using namespace std;

class Shape {
protected:
	int x, y;
public:
	Shape(int x, int y) {
		this->x = x;
		this->y = y;
		cout << "Shape 생성자" << endl;
	}
	~Shape(){ cout << "Shape 소멸자" << endl; }
	int getX(){ return x; }
	int getY() { return y; }
};

class Rectangle : public Shape {
	int width, height;
public:
	Rectangle(int x, int y, int w, int h) : Shape(x,y) {
		this->width = w;
		this->height = h;
		cout << "Rectangle 생성자" << endl;
	}
	~Rectangle() { cout << "Rectangle 소멸자" << endl; }
	void virtual draw() {
		cout << "Rentangle drawn at : (" << getX() << "," << getY()
			<< ")" << endl;
	}
	double virtual getArea(){
		return width * height;
	}
};

class Circle : public Shape {
	int radius;
public:
	Circle(int x, int y, int r) : Shape(x, y) {
		this->radius = r;
		cout << "Circle 생성자" << endl;
	}
	~Circle() { cout << "Circle 소멸자" << endl; }

	void virtual draw() {
		cout << "Circle drawn at : (" << getX() << "," << getY()
			<< ")" << endl;
	}
	double virtual getArea() {
		return radius * radius * 3.14;
	}

};
int main() {
	Rectangle r(10, 20, 100, 100);
	// (10, 20)위치에 가로 100, 세로 100인 사각형 객체 생성
	r.draw();
	cout << "사각형 면적 = " << r.getArea() << endl << endl;

	Circle c(120, 150, 40);  // (120,150)위치에 반지름 40인 원을 생성
	c.draw();
	cout << "원 면적 = " << c.getArea() << endl << endl;
	return 0;
}
