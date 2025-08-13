#include "JsonParser.h"
#include<QDir>
#include<QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
JsonParser::JsonParser(const QString &directoryPath) : m_baseurl(directoryPath)
{
    qDebug()<<Q_FUNC_INFO;
}

bool JsonParser::parseFolders()
{
    QDir dir(m_baseurl);
    if (!dir.exists()) {
        qWarning() << "Directory does not exist:" << m_baseurl;
        return false;
    }
    QStringList folderList = dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
    for (const QString &folder : folderList) {
        QString jsonFilePath = m_baseurl + "/" + folder + "/info.yaml";
        parseJson(jsonFilePath);
    }
    return true;
}

QList<App*> JsonParser::getAppDataList()
{
    return appDataList;
}

QString JsonParser::baseurl() const
{
    return m_baseurl;
}

void JsonParser::setBaseurl(const QString &newBaseurl)
{
    m_baseurl = newBaseurl;
}

void JsonParser::parseJson(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Could not open file:" << filePath;
        return;
    }
    QByteArray jsonData = file.readAll();
    file.close();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData);
    if (!jsonDoc.isObject()) {
        qWarning() << "Invalid JSON format in file:" << filePath;
        return;
    }
    QJsonObject jsonObj = jsonDoc.object();
    App* app = new App;
    app->setAppName(jsonObj.value("AppName").toString());
    app->setQmlFile(jsonObj.value("PluginName").toString());
    app->setIcon(jsonObj.value("AppIcon").toString());
    app->setPluginPath(jsonObj.value("MainFileQml").toString());
    app->setCategories(jsonObj.value("Category").toString());
    appDataList.append(app);
}
