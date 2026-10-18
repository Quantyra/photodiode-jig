// SPDX-License-Identifier: AGPL-3.0-only
/*
 * Photodiode logger: licensed under the GNU Affero General Public License,
 * version 3 only. See ../LICENSE for the complete terms and warranty disclaimer.
 * AGPL-compliant commercial use is permitted.
 * Separate paid, non-copyleft closed-source commercial terms require a written
 * agreement through info@qxcellerate.com. An inquiry alone grants no rights.
 * This notice applies to this code; CAD and circuit/setup documentation use
 * CERN-OHL-S-2.0 under the repository root LICENSE.
 */

const int PD_A_PIN = A0;
const int PD_B_PIN = A1;

const float VREF = 5.0;       // Uno/Nano default ADC reference
const int SAMPLES = 100;
const int SAMPLE_DELAY_MS = 1;
const int LOOP_DELAY_MS = 100;

float readAveragedPin(int pin) {
  long sum = 0;

  for (int i = 0; i < SAMPLES; i++) {
    analogRead(pin);          // discard first read for high-impedance source
    sum += analogRead(pin);
    delay(SAMPLE_DELAY_MS);
  }

  return sum / float(SAMPLES);
}

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);

  Serial.begin(115200);
  analogReference(DEFAULT);
  Serial.println("timestamp_ms,raw_a,volts_a,raw_b,volts_b");
}

void loop() {
  digitalWrite(LED_BUILTIN, LOW);

  float rawA = readAveragedPin(PD_A_PIN);
  float rawB = readAveragedPin(PD_B_PIN);
  float voltsA = rawA * VREF / 1023.0;
  float voltsB = rawB * VREF / 1023.0;

  Serial.print(millis());
  Serial.print(",");
  Serial.print(rawA, 2);
  Serial.print(",");
  Serial.print(voltsA, 5);
  Serial.print(",");
  Serial.print(rawB, 2);
  Serial.print(",");
  Serial.println(voltsB, 5);

  delay(LOOP_DELAY_MS);
}
