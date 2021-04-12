#include <iostream>
using namespace std;
class Timer {
	int hour;
	int minute;
public:
	Timer(int h = 0, int m = 0) {
		hour = h, minute = m;
	};
	void show();
};

void Timer::show() {
	cout << hour << ':' << minute << endl;;

}

int main() {
	Timer t1;
	Timer t2(10, 15);
	t1.show();
	t2.show();
}
