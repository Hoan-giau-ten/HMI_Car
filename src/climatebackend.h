#ifndef CLIMATEBACKEND_H
#define CLIMATEBACKEND_H

#include <QObject>

class ClimateBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int leftTemp READ leftTemp WRITE setLeftTemp NOTIFY leftTempChanged FINAL)
    Q_PROPERTY(int rightTemp READ rightTemp WRITE setRightTemp NOTIFY rightTempChanged FINAL)

public:
    explicit ClimateBackend(QObject *parent = nullptr);
    int leftTemp() const;
    void setLeftTemp(int newTemp);

    int rightTemp() const;
    void setRightTemp(int newTemp);

    Q_INVOKABLE void increaseLeftTemp();
    Q_INVOKABLE void decreaseLeftTemp();
    Q_INVOKABLE void increaseRightTemp();
    Q_INVOKABLE void decreaseRightTemp();

signals:
    void leftTempChanged();
    void rightTempChanged();

private:
    int m_leftTemp;
    int m_rightTemp;
};

#endif // CLIMATEBACKEND_H
