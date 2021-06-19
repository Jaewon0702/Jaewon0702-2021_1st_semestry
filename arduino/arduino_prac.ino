int myLed[] = {2,4,6,8}; //LED 번호를 배열로 지정
void setup() {
// put your setup code here, to run once:
for(int i=0; i<4; i++){
pinMode(myLed[i], OUTPUT); //PinMode 설정
}

}

void loop() {
// put your main code here, to run repeatedly:
for(int i=0; i<4; i++){
digitalWrite(myLed[i], HIGH);
delay(500);
digitalWrite(myLed[i],LOW);
delay(500);
}
}
