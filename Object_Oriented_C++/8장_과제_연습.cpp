#include <iostream>
using namespace std;

class Shape {
protected:
	int x, y;
public:
	Shape(int x, int y) {
		this->x = x;
		this->y = y;
		cout << "Shape ������" << endl;
	}
	~Shape(){ cout << "Shape �Ҹ���" << endl; }
	int getX(){ return x; }
	int getY() { return y; }
};

class Rectangle : public Shape {
	int width, height;
public:
	Rectangle(int x, int y, int w, int h) : Shape(x,y) {
		this->width = w;
		this->height = h;
		cout << "Rectangle ������" << endl;
	}
	~Rectangle() { cout << "Rectangle �Ҹ���" << endl; }
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
		cout << "Circle ������" << endl;
	}
	~Circle() { cout << "Circle �Ҹ���" << endl; }

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
	// (10, 20)��ġ�� ���� 100, ���� 100�� �簢�� ��ü ����
	r.draw();
	cout << "�簢�� ���� = " << r.getArea() << endl << endl;

	Circle c(120, 150, 40);  // (120,150)��ġ�� ������ 40�� ���� ����
	c.draw();
	cout << "�� ���� = " << c.getArea() << endl << endl;
	return 0;
}
