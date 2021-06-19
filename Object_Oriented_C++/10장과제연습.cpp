#include <iostream>
#include <vector>
using namespace std;

class Shape { // Shape Basic Class
protected:
	int x, y;
public:
	Shape(int x, int y) { // 생성자
		this->x = x;
		this->y = y;
	}
	virtual void draw() = 0; // 순수가상함수 선언
	virtual double getArea() = 0; // 면적을 구하는 가상함수 선언
	virtual ~Shape() { } //
	int getx() { return x; } // 위치 x 반환
	int gety() { return y; } // 위치 y 반환
};

class Rectangle : public Shape { // Rectangle  Derived Class
	int width, height;
public:
	Rectangle(int x, int y, int width, int height) : Shape(x, y) {
		// 생성자
		this->width = width;
		this->height = height;
	}
	virtual ~Rectangle() { } // 가상 소멸자
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
	Circle(int x, int y, int radius) : Shape(x, y) { // 생성자
		this->radius = radius;
	}
	virtual ~Circle() { } // 가상소멸자
	virtual void draw() {
		cout << "Circle drawn at : (" << getx() << "," << gety() << ")" << endl;
	}
	virtual double getArea() {
		return radius * radius * 3.14;
	}

};

int main() {  // 도형을 벡터에 저장한다.
	vector<Shape*> vShape;
	vShape.push_back(new Rectangle(10, 10, 30, 40)); // 10,10 위치에 가로세로 30x40
	vShape.push_back(new Circle(30, 30, 5));  // 30,30 위치에 반지름 5인 원
	vShape.push_back(new Rectangle(20, 30, 10, 10));
	// 여기에 순차 출력 및 면적 총합계 계산 코드를 추가한다
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
