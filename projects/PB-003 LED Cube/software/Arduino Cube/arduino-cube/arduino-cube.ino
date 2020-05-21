#include <Arduino.h>
#include "constants.h"

void set_output(byte value, const int latch) {  
  for (int pin = PA0; pin <= PA7; pin += 1) {
    digitalWrite(pin, value & 1);
    value = value >> 1;
  }
  digitalWrite(latch, LOW);
  delayMicroseconds(1);
  digitalWrite(latch, HIGH);
}

void setup() {
  pinMode(SW1, INPUT);
  pinMode(SW2, INPUT);

  for(int i = PA0; i <= PA7; i++) {
    digitalWrite(i, LOW);
    pinMode(i, OUTPUT);
  }
  digitalWrite(CP1, HIGH);
  digitalWrite(CP2, HIGH);
  digitalWrite(L0, LOW);
  digitalWrite(L1, LOW);
  digitalWrite(L2, LOW);
  digitalWrite(L3, LOW);

  pinMode(CP1, OUTPUT);
  pinMode(CP2, OUTPUT);
  pinMode(L0, OUTPUT);
  pinMode(L1, OUTPUT);
  pinMode(L2, OUTPUT);
  pinMode(L3, OUTPUT);
}

void loop() {
  set_output(random(0, 255), CP1);
  set_output(random(0, 255), CP2);

  for (int i = L0; i <= L3; i++) {
    digitalWrite(i, HIGH);
    delay(250);
    digitalWrite(i, LOW);
  }
}