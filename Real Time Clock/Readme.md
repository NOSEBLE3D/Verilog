**Real Time Clock (RTC) — Specification**

**Introduction**
A Real Time Clock (RTC) is a digital system that keeps and displays real-world time.

Operates on a 24-hour format (00:00:00 to 23:59:59), and can be modified to support 12-hour format.

Time is displayed using seven-segment displays, showing:

Hours

Minutes

Seconds

**Applications**
Real-time display

Stopwatch

Industrial timers

Photographic timers

Medical applications with up to three alarm settings

**Design Overview**
The digital RTC design consists of two major components:

Counters

Count the seconds, minutes, and hours.

Each unit (hours, minutes, seconds) is split into MSB and LSB:

Hours: HRM, HRL

Minutes: MIN_M, MIN_L

Seconds: SEC_M, SEC_L

Rolls over to 00:00:00 after 23:59:59.

Seven Segment Display Drivers

Used to show the current time on 6-digit 7-segment displays.

Each segment displays a digit (0–9) corresponding to the counter output.

**System Architecture**
Block Diagram includes:

Counters for hours, minutes, and seconds.

A control unit for formatting time.

Display drivers for seven-segment LEDs.
