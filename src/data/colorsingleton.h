#ifndef COLORSINGLETON_H
#define COLORSINGLETON_H

#include <QObject>

class ColorSingleton: public QObject {
    Q_OBJECT

    Q_PROPERTY(QString black READ black NOTIFY blackChanged)
    Q_PROPERTY(QString darkGray READ darkGray NOTIFY darkGrayChanged)
    Q_PROPERTY(QString gray READ gray NOTIFY grayChanged)
    Q_PROPERTY(QString white READ white NOTIFY whiteChanged)
    Q_PROPERTY(QString lightGray READ lightGray NOTIFY lightGrayChanged)
    Q_PROPERTY(QString offWhite READ offWhite NOTIFY offWhiteChanged)
    Q_PROPERTY(QString semiTransWhite READ semiTransWhite NOTIFY semiTransWhiteChanged)
public:
    explicit ColorSingleton();

    inline QString black() { return black_; }
    inline QString darkGray() { return darkGray_; }
    inline QString gray() { return gray_; }
    inline QString white() { return white_; }
    inline QString lightGray() { return lightGray_; }
    inline QString offWhite() { return offWhite_; }
    inline QString semiTransWhite() { return semiTransWhite_; }

signals:
    void blackChanged();
    void darkGrayChanged();
    void grayChanged();
    void whiteChanged();
    void lightGrayChanged();
    void offWhiteChanged();
    void semiTransWhiteChanged();

private:
    QString black_; // color 1
    QString darkGray_; // color 4
    QString gray_; // color 5
    QString white_; // color 6
    QString lightGray_; // color 7
    QString offWhite_; // color 8
    QString semiTransWhite_; // color 9
};

#endif // COLORSINGLETON_H
