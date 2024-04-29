#include "jsondatahandler.h"
#include <QTextStream>
#include <QJsonDocument>
#include <QStandardPaths>
#include <QDebug>

jsonDataHandler::jsonDataHandler(QObject *parent) : QObject(parent)
{
  cDatasetDir.mkpath(QDir::homePath() + "/controldataset/");
  cDataFilePath = cDatasetDir.filePath(QDir::homePath() + "/controldataset/" +"seat_control_data.json");
}

bool jsonDataHandler::saveSeatControlData(int footRestValue, int backRestValue, int seatHardnessValue, int headrestValue)
{
    QJsonObject jsonData = seatControlDataToJson(footRestValue, backRestValue, seatHardnessValue, headrestValue);
    QJsonDocument jsonDoc(jsonData);

//    QFileInfo fileInfo(cDataFilePath);

    QFile file(cDataFilePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file for writing:" << cDataFilePath;
        return false; // Failed to save file
    }

    QTextStream out(&file);
    out << jsonDoc.toJson();
    file.close();

    qDebug() << "Seat control data updated in file:" << cDataFilePath;
    return true; // File updated successfully
}

bool jsonDataHandler::loadSeatControlData()
{
    QFile file(cDataFilePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file for reading:" << cDataFilePath;
        return false; // Failed to open file
    }

    QByteArray jsonData = file.readAll();
    file.close();

    QJsonParseError parseError;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData, &parseError);
    if (parseError.error != QJsonParseError::NoError) {
        qWarning() << "Failed to parse JSON:" << parseError.errorString();
        return false; // Failed to parse JSON
    }

    QJsonObject jsonObject = jsonDoc.object();
    emit loadControlDataToModel(jsonObject);

    qDebug() << "Seat control data loaded from file:" << cDataFilePath;
    return true; // Data loaded successfully
}


QJsonObject jsonDataHandler::seatControlDataToJson(int footRestValue, int backRestValue, int seatHardnessValue, int headrestValue)
{
    QJsonObject jsonData;
    jsonData["footRestValue"] = footRestValue;
    jsonData["backRestValue"] = backRestValue;
    jsonData["seatHardnessValue"] = seatHardnessValue;
    jsonData["headrestValue"] = headrestValue;
    return jsonData;
}
