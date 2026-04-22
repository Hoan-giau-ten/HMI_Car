#include "vehiclebackend.h"

VehicleBackend::VehicleBackend(QObject *parent)
    : QObject(parent),
    m_batteryLevel(84),
    m_speed(0),
    m_range(342),
    m_isDriving(false),
    m_internalDrain(0.0)
{
    // Khởi tạo và chạy Timer mỗi 100ms (10 khung hình/giây)
    m_simulationTimer = new QTimer(this);
    connect(m_simulationTimer, &QTimer::timeout, this, &VehicleBackend::updateSimulation);
    m_simulationTimer->start(100);
}

// --- Các hàm Getter cơ bản ---
int VehicleBackend::batteryLevel() const { return m_batteryLevel; }
int VehicleBackend::speed() const { return m_speed; }
int VehicleBackend::range() const { return m_range; }
bool VehicleBackend::isDriving() const { return m_isDriving; }

// --- Các hàm Setter cập nhật QML ---
void VehicleBackend::setBatteryLevel(int newLevel) {
    if (m_batteryLevel != newLevel) { m_batteryLevel = newLevel; emit batteryLevelChanged(); }
}
void VehicleBackend::setSpeed(int newSpeed) {
    if (m_speed != newSpeed) { m_speed = newSpeed; emit speedChanged(); }
}
void VehicleBackend::setRange(int newRange) {
    if (m_range != newRange) { m_range = newRange; emit rangeChanged(); }
}
void VehicleBackend::setIsDriving(bool driving) {
    if (m_isDriving != driving) { m_isDriving = driving; emit isDrivingChanged(); }
}

// ========================================================
// ĐÂY LÀ TRÁI TIM CỦA MÔ PHỎNG: Chạy liên tục mỗi 100ms
// ========================================================
void VehicleBackend::updateSimulation()
{
    if (m_isDriving) {
        // 1. Tăng tốc từ từ lên 82 MPH
        if (m_speed < 82) {
            setSpeed(m_speed + 2);
        }

        // 2. Tụ pin và quãng đường khi xe chạy
        m_internalDrain += 0.05;
        if (m_internalDrain >= 1.0) {
            if (m_range > 0) setRange(m_range - 1);

            // Cứ tụt 4 dặm thì tụt 1% pin
            if (m_range % 4 == 0 && m_batteryLevel > 0) {
                setBatteryLevel(m_batteryLevel - 1);
            }
            m_internalDrain = 0.0;
        }
    } else {
        // 3. Nếu tắt máy (Stop), xe từ từ giảm tốc độ về 0
        if (m_speed > 0) {
            setSpeed(m_speed - 3);
            if (m_speed < 0) setSpeed(0);
        }
    }
}
