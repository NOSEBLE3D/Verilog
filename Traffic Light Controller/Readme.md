**Traffic Light Controller — Specification**

**Objective**
To design and implement a traffic light control system that operates either:

on a fixed timing mechanism or

using intelligent detection based on vehicle presence.

**Core Components**
Controller (Brain)

A computer-based unit controlling the timing and transition between lights.

Receives inputs from sensors/detectors and determines state transitions.

Signal Face (Visualization)

Lights facing each direction: typically Red, Yellow, and Green LEDs.

Controls traffic movement visually.

Sensors/Detectors

Detect vehicle presence via:

Inductive loops (in-pavement)

Infrared sensors

Video detection (modern setup using a camera + processing)

These feed presence signals into the controller for dynamic timing.

**Design Approach**
The system is modeled as a finite state machine (FSM).

Each traffic light operates through three states:

Red

Yellow

Green

The transition is triggered by a countdown timer or input change.

**Implementation Details**
Uses 6 colored LEDs (e.g., on a BASYS board) to represent traffic lights.

Controlled through LabVIEW programming (graphical block-based control).

Sequencing logic determines how long each light stays active using a clock divider.

E.g., 3 Hz clock → stay in state for 3 cycles = 1 sec delay.

Stay for 15 cycles → 5 sec delay.

States and transitions are managed using a state diagram (Figure 3 in the doc).

LEDs ld[7:2] on BASYS board are used for outputting the current light status.

**Use Case Example**
Four-way intersection: roads going north-south and east-west.

Directional control is based on the vehicle presence detected via IR sensors labeled N1–N3, E1–E3, S1, and W1.

Fallback/default state is triggered if green light fails to illuminate (indicating missing input).

**Summary:**
The system is a programmable, FSM-based traffic light controller using LEDs and sensors to simulate real-world intersection behavior. Timing is governed by a countdown clock, and intelligent reaction is enabled through vehicle detection inputs.
