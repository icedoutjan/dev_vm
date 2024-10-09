#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <filesystem> // C++17 or later
#include <cstdlib>

namespace fs = std::filesystem;

// Funktion zum Abrufen des Batterie-Status aus einer Datei
std::string getBatteryStatus(const std::string& batteryPath) {
    std::ifstream statusFile(batteryPath + "/status");
    std::string status;
    if (statusFile.is_open()) {
        getline(statusFile, status);
        statusFile.close();
    }
    return status;
}

// Funktion zum Abrufen der Batteriekapazität aus einer Datei
int getBatteryCapacity(const std::string& batteryPath) {
    std::ifstream capacityFile(batteryPath + "/capacity");
    int capacity = -1;
    if (capacityFile.is_open()) {
        capacityFile >> capacity;
        capacityFile.close();
    }
    return capacity;
}

// Funktion zur Zuordnung des Batterie-Status zu einem Emoji
std::string getStatusEmoji(const std::string& status) {
    if (status == "Full") return "⚡";
    if (status == "Discharging") return "🔋";
    if (status == "Charging") return "🔌";
    if (status == "Not charging") return "🛑";
    if (status == "Unknown") return "♻️";
    return "";
}

// Hauptfunktion
int main(int argc, char* argv[]) {
    // Prüfen, ob ein Mausklick (BLOCK_BUTTON) vorliegt
    if (argc > 1) {
        int blockButton = std::atoi(argv[1]);
        switch (blockButton) {
            case 3: // Rechte Maustaste
                std::system("notify-send \"🔋 Battery module\" \"🔋: discharging\n🛑: not charging\n♻: stagnant charge\n🔌: charging\n⚡: charged\n❗: battery very low!\"");
                return 0;
            case 4: // Mausrad hoch
                std::system("xbacklight -inc 10");
                return 0;
            case 5: // Mausrad runter
                std::system("xbacklight -dec 10");
                return 0;
            case 6: // Mausrad gedrückt
                std::system("$TERMINAL -e $EDITOR $0");
                return 0;
            default:
                break;
        }
    }

    // Batterieinformationen verarbeiten
    for (const auto& entry : fs::directory_iterator("/sys/class/power_supply")) {
        if (entry.path().filename().string().find("BAT") != std::string::npos) {
            std::string batteryPath = entry.path();
            
            // Batteriestatus und -kapazität abrufen
            std::string status = getBatteryStatus(batteryPath);
            int capacity = getBatteryCapacity(batteryPath);

            if (capacity == -1) continue; // Falls die Kapazität nicht lesbar ist, überspringen

            std::string emoji = getStatusEmoji(status);
            std::string warn = (emoji == "🔋" && capacity <= 25) ? "❗" : "";

            // Batterieinformationen ausgeben
            std::cout << emoji << warn << capacity << "%" << " ";
        }
    }
    std::cout << std::endl;

    return 0;
}

