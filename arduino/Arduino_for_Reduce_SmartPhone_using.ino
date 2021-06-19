int force = 0;
int buzzer = 13;
int ledPin = 7;
long cnt, mil;
int hour = 0, min = 0;
int check = 0; // 시간, 분, 초를 한 번만 출력하기 위한 변수
boolean state=false;
void setup(){ 
  Serial.begin(9600);
  tone(3,523,500);
}

void loop(){
  force = analogRead(A0);
  if(force == 0){
    tone(3,523,500);
    digitalWrite(ledPin, HIGH);
    if(cnt > 0){ // 시간, 분, 초 출력
      if(check == 0){
        Serial.print(hour);
        Serial.print("h : ");
        Serial.print(min);
        Serial.print("m : ");
        Serial.print(cnt);
        Serial.println("s");
        check = 1;
      }
      delay(3600);
    }
      
  }
  
  else if(force >= 0.001){
    digitalWrite(ledPin, LOW);
    if((millis() - mil) >= 1000){
      mil = millis();
      check = 0;
      cnt++;
      
    }
    }
 else{}
  min = (cnt/60)%60; // 분 계산
  hour = (cnt/(60*60))%24;  // 시간 계산     
}
