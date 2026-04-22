#include "climatebackend.h"

ClimateBackend::ClimateBackend(QObject *parent)
    : QObject{parent},
    m_leftTemp(68),
    m_rightTemp(72)
{}

int ClimateBackend::leftTemp() const
{
    return m_leftTemp;
}

void ClimateBackend::setLeftTemp(int newTemp)
{
    if (newTemp >= 60 && newTemp <= 85 && m_leftTemp != newTemp) {
        m_leftTemp = newTemp;
        emit leftTempChanged();
    }
}

int ClimateBackend::rightTemp() const
{
    return m_rightTemp;
}

void ClimateBackend::setRightTemp(int newTemp)
{
    if (newTemp >= 60 && newTemp <= 80 && m_rightTemp != newTemp) {
        m_rightTemp = newTemp;
        emit rightTempChanged();
    }
}

void ClimateBackend::increaseLeftTemp()
{
    setLeftTemp(m_leftTemp + 1);
}

void ClimateBackend::decreaseLeftTemp()
{
    setLeftTemp(m_leftTemp - 1);
}

void ClimateBackend::increaseRightTemp()
{
    setRightTemp(m_rightTemp + 1);
}

void ClimateBackend::decreaseRightTemp()
{
    setRightTemp(m_rightTemp - 1);
}
