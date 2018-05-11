#ifndef OOMODEL_H
#define OOMODEL_H

#include <QAbstractListModel>

class OoList;

class OoModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(OoList *list READ list WRITE setList)

public:
    explicit OoModel(QObject *parent = nullptr);

    enum {
        DoneRole = Qt::UserRole,
        DescriptionRole
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    OoList *list() const;
    void setList(OoList *list);

private:
    OoList *mList;
};

#endif // OOMODEL_H
