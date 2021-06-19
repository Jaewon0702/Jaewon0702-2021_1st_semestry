int buzzer = 13;
int val = 0;
void setup() {
}

void loop() {
  val = analogRead(A0);
  delay(val);
  tone(13,val,500);
  delay(val);
}
