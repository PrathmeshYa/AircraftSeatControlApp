#ifndef SEATCONTROLMODEL_H
#define SEATCONTROLMODEL_H

#include <QObject>

#include "jsondatahandler.h"

class SeatControlModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int footRestValue READ footRestValue WRITE setFootRestValue NOTIFY footRestValueChanged)
    Q_PROPERTY(int backRestValue READ backRestValue WRITE setBackRestValue NOTIFY backRestValueChanged)
    Q_PROPERTY(int seatHardnessValue READ seatHardnessValue WRITE setSeatHardnessValue NOTIFY seatHardnessValueChanged)
    Q_PROPERTY(int headrestValue READ headrestValue WRITE setHeadrestValue NOTIFY headrestValueChanged)
    Q_PROPERTY(bool isValueEmpty READ isValueEmpty WRITE setIsValueEmpty NOTIFY isValueEmptyChanged)



public:
    ///
    /// \brief SeatControlModel
    /// \param parent
    ///
    explicit SeatControlModel(QObject *parent = nullptr);

    ///
    /// \brief @Getters Methods
    ///
    int footRestValue() const;
    int backRestValue() const;
    int seatHardnessValue() const;
    int headrestValue() const;
    bool isValueEmpty() const;

    ///
    /// \brief @Setters Methods

    ///
    void setFootRestValue(int value);
    void setBackRestValue(int value);
    void setSeatHardnessValue(int value);
    void setHeadrestValue(int value);
    void setIsValueEmpty(bool value);

    ///
    /// \brief @ Invok from qmls
    ///
    Q_INVOKABLE void saveDataTojson();
    Q_INVOKABLE void loadDataFromjson();
    Q_INVOKABLE void setToDefaultSeatPosition();

signals:
    ///
    /// \brief @Signals
    ///
    void footRestValueChanged(int value);
    void backRestValueChanged(int value);
    void seatHardnessValueChanged(int value);
    void headrestValueChanged(int value);
    void isValueEmptyChanged(int value);

private:

    ///
    /// \brief loadSeatControlData
    /// \param obj
    ///
    void loadSeatControlData(const QJsonObject &obj);
    ///
    /// \brief m_jsonObj
    ///
    jsonDataHandler m_jsonObj;

    int m_footRestValue;
    int m_backRestValue;
    int m_seatHardnessValue;
    int m_headrestValue;
    bool m_isValueEmpty;
};

#endif // SEATCONTROLMODEL_H
