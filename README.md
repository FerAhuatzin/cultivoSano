# 🌱 Cultivo Sano

### **Smart Diagnosis for Sustainable Agriculture**

---

## 📖 **Description**
*Cultivo Sano* is an application designed to support small-scale farmers and rural communities in diagnosing diseases, pests, and deficiencies in crops. Using computer vision, real-time weather data, and personalized recommendations, it promotes sustainable and responsible agricultural practices.

---

## 🚀 **Key Features**
- **Computer Vision**: Diagnose crop issues from photos taken with your camera or selected from your gallery.  
- **Weather Insights**: Access real-time weather information and its impact on your crops.  
- **Personalized Recommendations**: Receive ecological and sustainable solutions to improve crop health.  
- **Crop Management**: Organize your crops and easily access diagnostics and advice.  

---

## 🎯 **Alignment with the United Nations Sustainable Development Goals (SDGs)**
- **SDG 11: Sustainable Cities and Communities**  
   Supporting farmers in rural areas by enhancing food security and improving resource management efficiency.  
- **SDG 12: Responsible Consumption and Production**  
   Encouraging sustainable agricultural practices to reduce environmental impact and promote biodiversity.

---

## 🛠️ **Technologies Used**
- **Primary Language**: Swift (with SwiftUI)  
- **APIs**:  
  - [WeatherKit](https://developer.apple.com/weatherkit/) for weather data.  
  - Computer Vision for image analysis.  
- **Frameworks**:  
  - CoreLocation for user location data.  
  - SwiftData for local database management.  

---

## 📋 Installation

Follow these steps to set up and run the application:

1. **Clone the repository**:  
   Open a terminal and run the following command:  
   ```bash
   git clone https://github.com/your-username/cultivo-sano.git
   cd cultivo-sano
2. **Open the project in Xcode**:

    Make sure you have the latest version of Xcode installed on your Mac.
    Double-click the CultivoSano.xcodeproj file to open the project in Xcode.
   
3. **Set up dependencies**:
    Go to your project settings and ensure the following capabilities are enabled:
    - WeatherKit
    - CoreLocation
    Open the Info.plist file and add the following permissions for location access:
   ```XML
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>We need your location to provide climate-based recommendations.</string>
   <key>NSLocationAlwaysUsageDescription</key>
   <string>We need your location to provide recommendations even in the background.</string>
4. **Run the app**:

    - Connect an iOS simulator or a real device.
    - In Xcode, select the target device from the toolbar.
    - Press the "Run" button (▶) in the top-left corner of Xcode.
    - The app will compile and launch on your selected device.
      
5. **Test the functionality**:
Use the app to add crops, take or upload photos, and view the crop analysis results.
Ensure the weather and location-based features work correctly.

If you encounter any issues during installation, please open an issue in the repository.

---

## 🌟 Development Team
- Fernando Ahuatzin (@FerAhuatzin) 
- Alejandro Zepeda (@zepedagg)
- Ladislao Martinez (@LADISMTZ)
- Ruben Suárez (@rubensuarez22)

