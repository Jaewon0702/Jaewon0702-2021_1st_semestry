#include <iostream>
#include <vector>
using namespace std;

class Shape { // Shape Basic Class
protected:
	int x, y;
public:
	static double sum; // 총 면적 sum을 static으로 선언
	static void add(double n) { 
		sum += n;
	}
	Shape(int x, int y) { // 생성자
		this->x = x;
		this->y = y;
	}
	virtual void draw() = 0; // 순수가상함수 선언
	virtual double getArea() = 0; // 면적을 구하는 가상함수 선언
	virtual ~Shape() { }
	int getx() { return x; } // 위치 x 반환
	int gety() { return y; } // 위치 y 반환
};
double Shape::sum = 0.0;
// static 변수를 전역 공간에 생성 및 초기화
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
		cout << "Rectangle: (" << width << ", " << height << ") drawn at : (" << getx() << ", " << gety() << ")" << endl;
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
		cout << "Circle: (" << radius << ") drawn at : (" << getx() << ", " << gety() << ")" << endl;
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
	vector<Shape*>::iterator it; //벡터 vShape의 원소에 대한 포인터 it 선언
	for (auto it = vShape.begin(); it != vShape.end(); it++) {
		auto s = *it; // it이 가리키는 원소 객체 리턴
		s->draw(); //draw() 함수 실행
		auto hap = s->getArea();
		s->add(hap); // static 멤버 add 넓이 더하기
	}
	cout << "Total area: " << Shape::sum << endl; // static 멤버 sum 접근

}