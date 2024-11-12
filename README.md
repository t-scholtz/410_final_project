# CSE 410: Final Project - Walkie Talkie Design Document

## Table of Contents
1. [Summary](#summary)
2. [Design Goals](#design-goals)
3. [Hardware Design](#hardware-design)
4. [Software Design](#software-design)
## Summary
This project aims to create a one-way wireless communication system using Tiva microcontroller boards. Audio data is captured on one Tiva board, transmitted wirelessly, and then played back on another Tiva board with minimal delay. The design focuses on achieving simple, real-time audio transmission.

## Design Goals
- **Wireless Communication**: Use the nRF24L01 transceiver for reliable wireless audio data transfer.
- **Audible Audio**: Achieve basic audio quality for recognizable sound using 12-bit resolution.

## Hardware Design
### Components
- **12-Bit DAC**: Converts digital audio data to analog for playback.
- **nRF24L01 Transceiver**: Handles wireless transmission at 2.4 GHz.
- **Speaker**: Outputs the received audio.
- **Microphone**: Captures audio for transmission.

## Software Design
- **Transmitter**: Encodes and sends audio data from the microphone.
- **Receiver**: Decodes audio data and outputs it through the DAC and speaker.
