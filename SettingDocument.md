# Rotorflight Telemetry Widget for RadioMaster TX15

## Installation Steps

1. Connect USB to TX15, power on and put in USB Storage (SD) mode

2. In the existing folder `WIDGETS`, make a new folder called `DBKDashboard`

3. Copy the following contents to `DBKDashboard` folder

   > **Note:** The `logs` folder can be empty since new logs will be created during runtime.

4. Your PNG graphics file of your model will be different. Save any image as PNG and resize to 200 x 100 pixels. Make sure to name the file the same as your Rotorflight model name. Please refer to later instructions.

### Folder Structure: `USB Drive (E:) > WIDGETS > DBKDashboard`

| Name | Date Modified | Type | Size |
|------|---------------|------|------|
| logs | 12/14/2025 10:03 PM | File folder | - |
| default.png | 12/14/2025 10:03 PM | PNG File | 9 KB |
| main.lua | 12/15/2025 9:55 AM | Lua Source File | 37 KB |
| main.luac | 12/15/2025 9:55 AM | LUAC File | 17 KB |
| RS4-1.png | 1/19/2026 4:19 PM | PNG File | 8 KB |
| S2U.png | 1/19/2026 4:24 PM | PNG File | 18 KB |

### File Descriptions

<img src="/image/1.jpg" alt="Rotorflight Default Image" width="420"/>

- **default.png** - Default main Rotorflight image
- **main.lua** - The main lua script
- **PNG graphics** - PNG graphics for your model. File name needs to be the same model name in Rotorflight

---

## Enabling the Widget

1. Long press and then select the model of interest by selecting on the model and then "Select model"

2. Press **TELEM** button. Select the white box

   <img src="/image/2.jpg" alt="Layout Setup Widgets" width="420"/>

3. Select "App mode"

   <img src="/image/3.jpg" alt="Layout Full Screen App Mode" width="420"/>

   > **Note:** If anything happens, RTN can be pressed and then TELEM can be pressed again.

4. Select "Setup widgets"

   <img src="/image/4.jpg" alt="Screen 1 Layout Setup Widgets" width="420"/>

5. Select "DBKDashboard"

   <img src="/image/5.jpg" alt="Select Widget DBKDashboard" width="420"/>

6. Configure switches for BankSwitch, HoldSwitch, ArmSwitch, etc. Press **RTN** when complete

   <img src="/image/6.jpg" alt="DBKDashboard Configuration" width="420"/>

7. When you want to change any settings later, press **TELE** and select "Setup widgets". Tap on the main screen until this is displayed. Select "Widget settings". When complete press **RTN**

   <img src="/image/7.jpg" alt="Widget Settings" width="420"/>

---

## Required TX15 Radio Settings for Model Match

1. Press **SYS** button and select "ExpressLRS"

2. Ensure the "Model Match" is set to "On"

   <img src="/image/8.jpg" alt="ExpressLRS Model Match Settings" width="420"/>

3. EXIT

   > **Note:** This means that the ID number needs to match in order to connect.

---

## Required TX15 Radio Settings to Display "Model On Tx" Option

### Step 1: Access Rotorflight Settings

1. Press **SYS** button and select "Rotorflight 2"

   > **Note:** You need to be connected between Radio and Rotorflight.

   <img src="/image/9.jpg" alt="Rotorflight Apps Menu" width="420"/>

2. Select "Settings"

3. Ensure that "Model on TX" is selected with "Show"

   <img src="/image/10.jpg" alt="Rotorflight Settings - Model on TX" width="420"/>

4. To Save, press **SYS** button and Select "Save". Press **RTN** to exit out

---

## Required TX15 Radio Settings to Display "Set Name on Tx" Option

1. Press **SYS** button and select "Rotorflight 2"

   > **Note:** You need to be connected between Radio and Rotorflight.

   <img src="/image/16.jpg" alt="Rotorflight Apps Menu" width="420"/>

2. Select "Model on Tx"

### Rotorflight 2.2.1 Main Menu

| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Status | Rates | Rate Dynamics |
| PID Gains | PID Controller | Profile-Various |
| Profile-Rescue | Profile-Governor | Servos |
| Mixer | Gyro Filters | Governor |
| Accelerometer Trim | **Model on TX** | XDFly |

3. Ensure that "Set name on Tx" is selected with "On"

   <img src="/image/17.jpg" alt="Rotorflight Model Settings" width="420"/>

4. Press **RTN** to exit out

---

## RotorFlight Receiver Telemetry Settings

*Configure via RotorFlight Configurator*

<img src="/image/20.jpg" alt="RotorFlight Receiver Telemetry Settings" />

### Telemetry Sensors Configuration

| Telemetry Sensors | Sort | Select |
|-------------------|------|--------|
| Battery | | 6/6 |
| Voltage | | 1/4 |
| Current | | 1/4 |
| Temperature | | 2/3 |
| ESC#1 | | 2/12 |
| ESC#2 | | 0/6 |
| RPM | | 1/2 |
| Headspeed | | |
| Tailspeed | | |
| Barometer | | 0/2 |
| Gyro | | 0/9 |
| GPS | | 0/8 |
| Status | | 7/7 |
| Model Id | | |
| Flight Mode | | |
| Arming Flags | | |
| Arming Disable Flags | | |
| Rescue State | | |
| Governor State | | |
| Adjustment Function | | |
| Profile | | 2/3 |
| PID Profile | | |
| Rates Profile | | |
| LED Profile | | |
| Control | | 1/6 |
| Control(hi-res) | | |
| Pitch Control | | |
| Roll Control | | |
| Yaw Control | | |
| Collective Control | | |
| Throttle Control | | |

---

## Custom Model Images

1. Obtain any image

2. Save as **PNG** format image file

3. Resize image file to **200 x 100 pixels**

4. For example, screenshot any image and using Microsoft Paint, paste and save:

   <img src="/image/21.jpg" alt="Image Resize Example" />

5. The image file name needs to be the same name as what is in the Rotorflight configuration for "Craft name"

### Example: Craft Name Matching

**ROTORFLIGHT Configurator Settings:**
- Configurator: 2.2.1
- Firmware: 4.5.1 RTFL
- Target: GSKY/GOOSKYF4MINI(STM32F405)
- Craft name: **S2U**

**TX15 USB Storage (SD) folder:** `USB Drive (E:) > WIDGETS > DBKDashboard`

| Name | Date Modified | Type | Size |
|------|---------------|------|------|
| logs | 12/14/2025 10:03 PM | File folder | - |
| default.png | 12/14/2025 10:03 PM | PNG File | 9 KB |
| main.lua | 12/15/2025 9:55 AM | Lua Source File | 37 KB |
| main.luac | 12/15/2025 9:55 AM | LUAC File | 17 KB |
| RS4-1.png | 1/19/2026 4:19 PM | PNG File | 8 KB |
| **S2U.png** | 1/19/2026 4:24 PM | PNG File | 18 KB |

> **Important:** The craft name "S2U" in Rotorflight matches the image file "S2U.png" in the DBKDashboard folder.

<img src="/image/22.jpg" alt="Rotorflight Configurator Receiver" />

---

## Lockout State During Usage

1. During normal usage, "EDGE TX" will be displayed in upper left corner

   <img src="/image/23.jpg" alt="Normal Usage Display" width="420" />

2. Press anywhere on the screen and you will enter a lockout state where any buttons pressed will be beeped

   <img src="/image/25.jpg" alt="Lockout State Display" width="420" />

3. To get out of this lockout state, press and hold **RTN** button

