#ifndef VEHICLEBACKEND_H
#define VEHICLEBACKEND_H

#include <QObject>
#include <QTimer> // Thư viện chạy vòng lặp thời gian

class VehicleBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int batteryLevel READ batteryLevel WRITE setBatteryLevel NOTIFY batteryLevelChanged)
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int range READ range WRITE setRange NOTIFY rangeChanged)
    Q_PROPERTY(bool isDriving READ isDriving WRITE setIsDriving NOTIFY isDrivingChanged)

public:
    explicit VehicleBackend(QObject *parent = nullptr);

    int batteryLevel() const;
    void setBatteryLevel(int newLevel);

    int speed() const;
    void setSpeed(int newSpeed);

    int range() const;
    void setRange(int newRange);

    bool isDriving() const;
    Q_INVOKABLE void setIsDriving(bool driving); // Cho phép QML gọi hàm này

signals:
    void batteryLevelChanged();
    void speedChanged();
    void rangeChanged();
    void isDrivingChanged();

private slots:
    void updateSimulation(); // Hàm này sẽ chạy liên tục mỗi 100ms

private:
    int m_batteryLevel;
    int m_speed;
    int m_range;
    bool m_isDriving;

    QTimer *m_simulationTimer; // Bộ đếm nhịp C++
    double m_internalDrain;    // Biến phụ để tính toán độ tụt pin mượt mà
};

#endif // VEHICLEBACKEND_H
