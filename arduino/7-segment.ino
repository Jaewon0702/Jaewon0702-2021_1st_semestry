byte numbers[10][8] = {
  {1,1,1,1,1,1,0,0}, //0
  {0,1,1,0,0,0,0,0}, //1
  {1,1,0,1,1,0,1,0}, //2
  {1,1,1,1,0,0,1,0}, //3
  {0,1,1,0,0,1,1,0}, //4
  {1,0,1,1,0,1,1,0}, //5
  {1,0,1,1,1,1,1,0}, //6
  {1,1,1,0,0,1,0,0}, //7
  {1,1,1,1,1,1,1,0}, //8
  {1,1,1,1,0,1,1,0} //9
};
int pin = 2;
int num = 9; // 표시할 숫자

void setup(){
  for(int i = 2; i<=9; i++){
    pinMode(i, OUTPUT);
  }
  digitalWrite(9, HIGH);

}

void loop(){
  for(int i=0; i<8; i++){
  digitalWrite(pin+i, numbers[num][i]);
  }
  num--;
  if(num < 1) num =9;
  delay(1000); // Wait for 1000 millisecond(s)
 
}
