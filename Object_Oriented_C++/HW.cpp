#include <iostream>
#include <vector>
using namespace std;

class Shape { // Shape Basic Class
protected:
	int x, y;
public:
	static double sum; // �� ���� sum�� static���� ����
	static void add(double n) { 
		sum += n;
	}
	Shape(int x, int y) { // ������
		this->x = x;
		this->y = y;
	}
	virtual void draw() = 0; // ���������Լ� ����
	virtual double getArea() = 0; // ������ ���ϴ� �����Լ� ����
	virtual ~Shape() { }
	int getx() { return x; } // ��ġ x ��ȯ
	int gety() { return y; } // ��ġ y ��ȯ
};
double Shape::sum = 0.0;
// static ������ ���� ������ ���� �� �ʱ�ȭ
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
		cout << "Rectangle: (" << width << ", " << height << ") drawn at : (" << getx() << ", " << gety() << ")" << endl;
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
		cout << "Circle: (" << radius << ") drawn at : (" << getx() << ", " << gety() << ")" << endl;
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
	vector<Shape*>::iterator it; //���� vShape�� ���ҿ� ���� ������ it ����
	for (auto it = vShape.begin(); it != vShape.end(); it++) {
		auto s = *it; // it�� ����Ű�� ���� ��ü ����
		s->draw(); //draw() �Լ� ����
		auto hap = s->getArea();
		s->add(hap); // static ��� add ���� ���ϱ�
	}
	cout << "Total area: " << Shape::sum << endl; // static ��� sum ����

}