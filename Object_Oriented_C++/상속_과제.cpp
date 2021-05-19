#include <iostream>
using namespace std;
// Ŭ���� �����
class Shape { // Shape Basic Class
	int x, y;
public:
	Shape(int x, int y) {
		this->x = x;
		this->y = y;
		cout << "Shape ������" << endl;
	}
	~Shape() { cout << "Shape �Ҹ���" << endl;}
	int getx() {return x;} // ��ġ x ��ȯ
	int gety() {return y;} // ��ġ y ��ȯ
};

class Rectangle : public Shape { // Rectangle  Derived Class
	int width, height;
public:
	Rectangle(int x, int y, int width, int height) : Shape(x,y) {
		this->width = width;
		this->height = height;
		cout << "Rectangle ������:" << endl;
	}
	~Rectangle() { cout << "Rectangle �Ҹ���" << endl; }
	void draw();
	double getArea();
};

class Circle : public Shape { // Circle Derived Class
	int radius;
public:
	Circle(int x, int y, int radius) : Shape(x, y) {
		this->radius = radius;
		cout << "Circle ������:" << endl;
	}
	~Circle() {
		cout << "Circle �Ҹ���" << endl;
	}
	void draw();
	double getArea();

};
// Ŭ���� �Լ� ����
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
	Rectangle r(10, 20, 100, 100);  // (10, 20)��ġ�� ���� 100, ���� 100�� �簢�� ��ü ����
	r.draw();
	cout << "�簢�� ���� = " << r.getArea() << endl << endl;

	Circle c(120, 150, 40);  // (120,150)��ġ�� ������ 40�� ���� ����
	c.draw();
	cout << "�� ���� = " << c.getArea() << endl << endl;
	return 0;
}