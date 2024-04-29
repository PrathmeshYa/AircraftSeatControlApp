#ifndef JSONDATAHANDLER_H
#define JSONDATAHANDLER_H


#include <QObject>
#include <QJsonObject>
#include <QDir>

class jsonDataHandler : public QObject
{
    Q_OBJECT
public:
    explicit jsonDataHandler(QObject *parent = nullptr);

    ///
    /// \brief saveSeatControlData
    /// \param footRestValue
    /// \param backRestValue
    /// \param seatHardnessValue
    /// \param headrestValue
    /// \return
    ///
    bool saveSeatControlData(int footRestValue, int backRestValue, int seatHardnessValue, int headrestValue);

    ///
    /// \brief loadSeatControlData
    /// \return
    ///
    bool loadSeatControlData();

signals:
    ///
    /// \brief loadControlDataToModel
    /// \param obj
    ///
    void loadControlDataToModel(const QJsonObject &obj);

private:
    ///
    /// \brief seatControlDataToJson
    /// \param footRestValue
    /// \param backRestValue
    /// \param seatHardnessValue
    /// \param headrestValue
    /// \return
    ///
    QJsonObject seatControlDataToJson(int footRestValue, int backRestValue, int seatHardnessValue, int headrestValue);

    ///
    /// \brief cDatasetDir
    ///
    const QDir cDatasetDir;
    ///
    /// \brief cDataFilePath
    ///
    QString cDataFilePath;

};


#endif // JSONDATAHANDLER_H
