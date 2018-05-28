import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

import ToDo 1.0

ColumnLayout {
    Layout.fillWidth: true
    Text {
        text: "New order"
        font.pixelSize: 20
        font.bold: true
    }
    Frame {

        Layout.fillWidth: true
        ColumnLayout{
            RowLayout {


                Label {
                    text: "Role"
                    Layout.preferredWidth: 100
                }
                ComboBox {
                        id: role
                        objectName: "role"
                        width: 200
                        model: [ "Initiator", "Acceptor" ]

                        onActivated: ooList.initiatorAcceptorActivated(editText)
                        
                }
                Text {
                    text: ooList.getIp();
                }

            }
            RowLayout {
                width: parent.width

                Label {
                    text: "Ip acceptor"
                    Layout.preferredWidth: 100
                }
                TextField {
                    id: ipAcceptor
                    objectName: "ipAcceptor"
                    Layout.fillWidth: true
                    validator: RegExpValidator { regExp: /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/ }
                }
            }
            RowLayout {
                width: parent.width

                Label {
                    text: "Amount"
                    Layout.preferredWidth: 100
                }
                TextField {
                    id: amount
                    objectName: "amount"
                    //text: model.description
                    //onEditingFinished: model.description = text
                    Layout.fillWidth: true
                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                    validator: RegExpValidator { regExp: /\d{1,9}(?:,\d{1,9})+$/ }
                }
                ComboBox {
                        id: coin
                        objectName: "coin"
                        width: 200
                        model: [  "BTC", "TFT"]
                }

            }
            RowLayout {
                width: parent.width

                Label {
                    text: "Value"
                    Layout.preferredWidth: 100
                }
                TextField {
                    id: value
                    objectName: "value"
                    Layout.fillWidth: true
                    validator: RegExpValidator { regExp: /\d{1,9}(?:,\d{1,9})+$/ }
                }
                ComboBox {
                        id: destinationCoin
                        objectName: "destinationCoin"
                        width: 200
                        model: [ "TFT", "BTC"]
                }
            }
        }
    }

    RowLayout {
        Button {
            text: qsTr("Confirm")
            onClicked: ooList.confirmNewOrder()
            Layout.fillWidth: true
        }
    }
}
