#ifndef WRAPPER_H
#define WRAPPER_H
#include "App.h"
#include "AppListModel.h"
#include "CategoriesModel.h"
#include <QSortFilterProxyModel>
#include <QObject>

class Wrapper : public QObject
{
    Q_OBJECT
public:
    explicit Wrapper(QObject *parent = nullptr);

    Q_PROPERTY(AppListModel* appModel READ appModel CONSTANT)
    Q_PROPERTY(CategoriesModel* categoriesModel READ categoriesModel CONSTANT)
    Q_PROPERTY(QSortFilterProxyModel* filteredAppModel READ filteredAppModel CONSTANT)

public:
    Q_INVOKABLE void setCategoryFilter(const QString &category);

    AppListModel* appModel() const;
    CategoriesModel* categoriesModel() const;
    QSortFilterProxyModel* filteredAppModel() const ;
private:
    AppListModel *m_appModel;
    CategoriesModel *m_categoriesModel;
    QSortFilterProxyModel *m_filterModel;

};

\
#endif // WRAPPER_H
