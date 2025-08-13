#ifndef JSONPARSER_H
#define JSONPARSER_H
#include"App.h"
#include<QString>
#include<QList>

struct AppData {
    QString appName;
    QString fileName;
    QString icon;
    QString Category;
};

class JsonParser
{
public:
    explicit JsonParser(const QString &directoryPath);
    bool parseFolders();
    QList<App*> getAppDataList();

    QString baseurl() const;
    void setBaseurl(const QString &newBaseurl);

private:
    QString m_baseurl;
    QList<App*> appDataList;
    void parseJson(const QString &filePath);
};



#endif // JSONPARSER_H
