#include <QDebug>
#include "seatcontrolmodel.h"

SeatControlModel::SeatControlModel(QObject *parent) : QObject(parent)
                                                      ,m_footRestValue(0)
                                                      ,m_backRestValue(0)
                                                      ,m_seatHardnessValue(0)
                                                      ,m_headrestValue(0)
                                                      , m_isValueEmpty(false)
{
    connect(&m_jsonObj, &jsonDataHandler::loadControlDataToModel,
            this, &SeatControlModel::loadSeatControlData);
}

int SeatControlModel::footRestValue() const
{
    return m_footRestValue;
}

int SeatControlModel::backRestValue() const
{
    return m_backRestValue;
}

int SeatControlModel::seatHardnessValue() const
{
    return m_seatHardnessValue;
}

int SeatControlModel::headrestValue() const
{
    return m_headrestValue;
}

bool SeatControlModel::isValueEmpty() const
{
    return m_isValueEmpty;
}

void SeatControlModel::setFootRestValue(int value)
{
    if (m_footRestValue != value) {
        m_footRestValue = value;
        emit footRestValueChanged(value);
    }
}

void SeatControlModel::setBackRestValue(int value)
{
    if (m_backRestValue != value) {
        m_backRestValue = value;
        emit backRestValueChanged(value);
    }
}

void SeatControlModel::setSeatHardnessValue(int value)
{
    if (m_seatHardnessValue != value) {
        m_seatHardnessValue = value;
        emit seatHardnessValueChanged(value);
    }
}

void SeatControlModel::setHeadrestValue(int value)
{
    if (m_headrestValue != value) {
        m_headrestValue = value;
        emit headrestValueChanged(value);
    }
}

void SeatControlModel::setIsValueEmpty(bool value)
{
    if (m_isValueEmpty != value) {
        m_isValueEmpty = value;
        emit isValueEmptyChanged(value);
    }
}

void SeatControlModel::saveDataTojson()
{
    bool success = m_jsonObj.saveSeatControlData(m_footRestValue, m_backRestValue, m_seatHardnessValue, m_headrestValue);
    if (success) {
        qDebug() << "Seat control data saved to file:" << endl;
    } else {
        qWarning() << "Failed to save seat control data to file:" << endl;
    }
}

void SeatControlModel::loadDataFromjson()
{
    bool success = m_jsonObj.loadSeatControlData();
    if (success) {
        qDebug() << "Seat control data load from file:" << endl;
    } else {
        qWarning() << "Failed to load seat control data from file:" << endl;
    }
}

void SeatControlModel::setToDefaultSeatPosition()
{
    //Lets assume mid position is the default for all seat Control
    setBackRestValue(45);
    setFootRestValue(45);
    setHeadrestValue(45);
    setSeatHardnessValue(5);
}

void SeatControlModel::loadSeatControlData(const QJsonObject &obj)
{
    if (obj.isEmpty()) {
        setIsValueEmpty(true);
        qWarning() << "JSON data object is empty:" << endl;
    }
    else {
        setIsValueEmpty(false);
        if (obj.contains("footRestValue")) {
            setFootRestValue(obj.value("footRestValue").toInt());
        }
        if (obj.contains("backRestValue")) {
            setBackRestValue(obj.value("backRestValue").toInt());
        }
        if (obj.contains("seatHardnessValue")) {
            setSeatHardnessValue(obj.value("seatHardnessValue").toInt());
        }
        if (obj.contains("headrestValue")) {
            setHeadrestValue(obj.value("headrestValue").toInt());
        }
        qDebug() << "Seat control data loaded from file:";
    }
}
