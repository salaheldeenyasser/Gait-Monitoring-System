# 🦶 Gait Monitoring System  

## 🧾 Overview  
The **Gait Monitoring System** is an embedded + software solution designed to monitor, analyze, and visualize human walking patterns in real time.  
It combines **sensor data acquisition**, **signal processing**, and **visual feedback** to help identify gait irregularities, support rehabilitation, and assist in research studies.

---

## 🧠 Table of Contents  
- [Project Motivation](#project-motivation)  
- [System Architecture](#system-architecture)  
- [Hardware Requirements](#hardware-requirements)  
- [Software Requirements](#software-requirements)  
- [Installation](#installation)  
- [Usage Guide](#usage-guide)  
- [Data Processing Pipeline](#data-processing-pipeline)  
- [Results & Visualization](#results--visualization)  
- [Future Improvements](#future-improvements)  
- [Contributing](#contributing)  
- [License](#license)  

---

## 💡 Project Motivation  
Gait — the way we walk — is a crucial indicator of health and mobility.  
Current gait-analysis systems are often expensive and confined to labs.  
This project provides a **low-cost, portable, and open-source** alternative that enables real-time gait tracking and visualization using embedded sensors and custom signal-processing algorithms.

---

## ⚙️ System Architecture  

+--------------------------+
|    Sensor Node (IMU)     |
| (Accelerometer + Gyro)   |
+------------+-------------+
             |
             |  Serial / Bluetooth
             v
+--------------------------+
|   Embedded Controller    |
| (Arduino / ESP / etc.)   |
+------------+-------------+
             |
             |  Data Stream
             v
+--------------------------+
|   Host Software (PC)     |
|  Processing + Visualization |
+--------------------------+


### **Main Components**
1. **Embedded Layer:**  
   Captures real-time motion data (acceleration, angular velocity).  
2. **Communication Layer:**  
   Sends sensor data to the host PC via serial or wireless link.  
3. **Software Layer:**  
   Performs signal filtering, gait-phase detection, feature extraction, and visualization.

---

## 🔩 Hardware Requirements  

| Component | Description | Example |
|------------|-------------|----------|
| Microcontroller | Reads sensor data | Arduino UNO / Nano |
| IMU Sensor | Measures acceleration & rotation | MPU-6050 / MPU-9250 |
| Power Source | Portable supply | USB / Li-ion battery |
| Optional | Wireless communication | HC-05 Bluetooth / ESP8266 |
| Mounting | Fix sensor to foot/leg | Elastic strap or shoe mount |

---

## 💻 Software Requirements  

| Tool | Purpose |
|------|----------|
| **Arduino IDE** | Firmware upload and serial communication |
| **Processing IDE** | Data visualization and analysis |
| **Python (optional)** | Advanced signal processing or ML |
| **MATLAB (optional)** | Post-processing and feature validation |

---

## 🧰 Installation  

### 1. Clone the repository
```bash
git clone https://github.com/salaheldeenyasser/Gait-Monitoring-System.git
cd Gait-Monitoring-System
```
### 2. Set up Arduino

Open the Arduino code from /Arduino/.

Connect your microcontroller.

Select the correct board and port.

Upload the sketch.

### 3. Set up Processing

Open the Processing script from /Processing/.

Adjust the COM port and baud rate in the code to match your Arduino.

Run the sketch to start data visualization.

## 🚀 Usage Guide

Mount the IMU on your foot, ankle, or shin securely.

Connect your microcontroller to your PC or via Bluetooth.

Open the Processing app to start visualizing motion data.

Walk naturally — the system will detect gait phases and plot live graphs.

Optionally, record the data for later analysis.

## 🔍 Data Processing Pipeline
Step	Operation	Description
1	Signal Acquisition	Collect raw sensor data (acc, gyro)
2	Filtering	Apply low-pass filter to remove noise
3	Segmentation	Detect gait cycles using peaks/zero crossings
4	Feature Extraction	Calculate stride length, cadence, gait symmetry, etc.
5	Visualization	Display real-time plots and statistics
## 📊 Results & Visualization

The Processing interface provides:

Real-time acceleration and orientation graphs

Detected gait phases and cycle count

Live numerical metrics (cadence, step duration)

Option to export logs for offline study

(Insert screenshots or graphs here)

## 🧭 Future Improvements

Add machine learning models to classify gait abnormalities.

Improve calibration for different body placements.

Support wireless streaming (ESP8266 / BLE).

Develop a mobile app for remote monitoring and data logging.

Integrate cloud storage and dashboards for therapists and researchers.

## 🤝 Contributing

Contributions, ideas, and feature suggestions are welcome!
To contribute:

Fork the repository

Create a feature branch (git checkout -b feature-name)

Commit your changes (git commit -m "Add feature")

Push to the branch (git push origin feature-name)

Open a Pull Request

## 🪪 License

This project is released under the MIT License.
You’re free to use, modify, and distribute it for educational or research purposes.

## 🧍 Author

Salah-Eldeen Yasser
👨‍💻 Junior Embedded Software Engineer
