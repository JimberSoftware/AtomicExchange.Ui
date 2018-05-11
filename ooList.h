#ifndef OOLIST_H
#define OOLIST_H

#include <QObject>
#include <QVector>

struct OoItem
{
    bool done;
    QString description;
};

class OoList : public QObject
{
    Q_OBJECT
public:
    explicit OoList(QObject *parent = nullptr);

    QVector<OoItem> items() const;

    bool setItemAt(int index, const OoItem &item);

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();

public slots:
    void appendItem();
    void removeCompletedItems();

private:
    QVector<OoItem> mItems;
};

#endif // OOLIST_H
