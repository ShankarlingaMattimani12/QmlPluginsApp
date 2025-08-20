#include "Wrapper.h"
#include "AppListModel.h"

Wrapper::Wrapper(QObject *parent)
    : QObject{parent}
{
    m_appModel = new AppListModel();
    m_categoriesModel = new CategoriesModel(this);

    m_filterModel = new QSortFilterProxyModel(this);
    m_filterModel->setSourceModel(m_appModel);
    m_filterModel->setFilterRole(AppListModel::Category);
    m_filterModel->setFilterCaseSensitivity(Qt::CaseInsensitive);
}

void Wrapper::setCategoryFilter(const QString &category)
{
    m_filterModel->setFilterFixedString(category);
}

AppListModel *Wrapper::appModel() const
{
    return m_appModel;
}

CategoriesModel *Wrapper::categoriesModel() const
{
    return m_categoriesModel;
}

QSortFilterProxyModel *Wrapper::filteredAppModel() const
{
    return m_filterModel;
}
