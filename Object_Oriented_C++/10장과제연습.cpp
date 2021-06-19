#include <iostream>
#include <vector>
using namespace std;

class Shape { // Shape Basic Class
protected:
	int x, y;
public:
	Shape(int x, int y) { // ������
		this->x = x;
		this->y = y;
	}
	virtual void draw() = 0; // ���������Լ� ����
	virtual double getArea() = 0; // ������ ���ϴ� �����Լ� ����
	virtual ~Shape() { } //
	int getx() { return x; } // ��ġ x ��ȯ
	int gety() { return y; } // ��ġ y ��ȯ
};

class Rectangle : public Shape { // Rectangle  Derived Class
	int width, height;
public:
	Rectangle(int x, int y, int width, int height) : Shape(x, y) {
		// ������
		this->width = width;
		this->height = height;
	}
	virtual ~Rectangle() { } // ���� �Ҹ���
	virtual void draw() {
		cout << "Rectangle drawn at : (" << getx() << "," << gety() << ")" << endl;
	}
	virtual double getArea() {
		return width * height;
	}
};

class Circle : public Shape { // Circle Derived Class
	int radius;
public:
	Circle(int x, int y, int radius) : Shape(x, y) { // ������
		this->radius = radius;
	}
	virtual ~Circle() { } // ����Ҹ���
	virtual void draw() {
		cout << "Circle drawn at : (" << getx() << "," << gety() << ")" << endl;
	}
	virtual double getArea() {
		return radius * radius * 3.14;
	}

};

int main() {  // ������ ���Ϳ� �����Ѵ�.
	vector<Shape*> vShape;
	vShape.push_back(new Rectangle(10, 10, 30, 40)); // 10,10 ��ġ�� ���μ��� 30x40
	vShape.push_back(new Circle(30, 30, 5));  // 30,30 ��ġ�� ������ 5�� ��
	vShape.push_back(new Rectangle(20, 30, 10, 10));
	// ���⿡ ���� ��� �� ���� ���հ� ��� �ڵ带 �߰��Ѵ�
	for (int i = 0; i < vShape.size(); i++) {
		vShape[i]->draw();
	}
	auto sum = 0;
	vector<Shape*> ::iterator it;
	for (it = vShape.begin(); it != vShape.end(); it++) {
		(*it)->draw();
		sum += (*it)->getArea();
	}
	cout << "Total araa: " << sum << endl;
}
