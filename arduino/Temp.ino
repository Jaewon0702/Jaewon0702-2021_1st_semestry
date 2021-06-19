  int Pin = A0;
  int reading;
  float tempC;
void setup() {
  Serial.begin(9600);


}

void loop() {
  reading = analogRead(Pin);
  tempC = (5.0 * reading * 100.0)/1024.0;
  Serial.print(tempC);
  Serial.println(" 도");
  delay(1000);
}
