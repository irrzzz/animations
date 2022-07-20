import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import Qt5Compat.GraphicalEffects

Rectangle {
    property var moneyAmount: "4,000.00"
    property  int buyIn
    property int entryFee
    property int bounty
    anchors.fill: parent
    color: "transparent"
    //фон
    Rectangle{
        anchors.fill:parent
        color: "black"
        opacity: 0.5
    }
    //лента
    Image{
        id: ribbon
        source: "images/winner/ribbon.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 28
    }
    Text{
        id: congratulations
        color: "white"
        anchors.horizontalCenter: ribbon.horizontalCenter
        y: ribbon.y+45
        text: "CONGRATULATIONS"
        font.family: "Cambria"
        font.bold: true
        font.pointSize: 14
    }
    //кубок
    Image{
        id: tourney
        source: "images/winner/tourney_color.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 110
    }
    Image{
        id: light
        source: "images/winner/light.png"
        x: tourney.x+8
        y: tourney.y+6
    }
    //вы победитель
    Text{
        id: you_are_the
        text: "You are the"
        anchors.horizontalCenter: parent.horizontalCenter
        color:"goldenrod"
        font.family: "Aria"
        font.pointSize: 12
        y:250
    }
    Text{
        id: text_winner
        text: "WINNER!"
        font.pointSize: 20
        font.family: "Arial Rounded MT Bold"
        anchors.horizontalCenter: parent.horizontalCenter
        y: you_are_the.y+you_are_the.height
        visible: false
    }
    LinearGradient{
        id: grad_winner
        anchors.fill: text_winner
        source: text_winner
        gradient: Gradient {
            GradientStop { position: 0; color: "yellow" }
            GradientStop { position: 1; color: "brown" }
        }
    }
    //выигранная сумма
    Text{
        id: money
        text: "+"+moneyAmount+"$"
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 28
        color: "#f9f99c"
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Aria"
        y: text_winner.y+text_winner.height
    }
    //Кнопка ОК и надпись над ней
    Item{
        id: button_group
        anchors.horizontalCenter: parent.horizontalCenter
        y: 400
        width: 170
        height: 70
        Text{
            text: "Buy in: "+buyIn+"  Entry fee: "+entryFee+"  Bounty: "+bounty
            color: "white"
            anchors.horizontalCenter: parent.center
            anchors.top: parent.top
        }
        Button{
            id: ok_button
            anchors{
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 10
                bottom: parent.bottom
            }
            flat: true
            text: qsTr("OK")
            background: Rectangle{
                implicitHeight: 40
                radius: 10
                color: ok_button.pressed ? "darkgreen" : "green"
            }
            contentItem: Text{
                text: ok_button.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    SequentialAnimation{
        id: anim
        ParallelAnimation{
            //скрытие выигранной суммы и блика на кубке
            OpacityAnimator{target: money; to: 0.0; duration: 0}
            OpacityAnimator{target: light; to: 0.0; duration: 0}
            //появление ленты с надписью
            OpacityAnimator{target: ribbon; from: 0.0; to: 1.0; duration: 400}
            PropertyAnimation{target: congratulations; property: "font.pointSize"; from: 48; to: 14; duration: 400}
            //кубка
            NumberAnimation{target: tourney; property: "y"; from: ribbon.y; to:tourney.y; duration: 400}
            OpacityAnimator{target: tourney; from: 0.0; to: 1.0; duration: 400}
            //надписи "вы победитель"
            NumberAnimation{target: you_are_the; property: "y"; from: ribbon.y+45; to:you_are_the.y; duration: 400}
            OpacityAnimator{target: you_are_the; from: 0.0; to: 1.0; duration: 400}
            OpacityAnimator{target: grad_winner; from: 0.0; to: 1.0; duration: 400}
            //кнопки и надписи над ней
            NumberAnimation{target: button_group; property: "y"; from: 800; to:400; duration: 400}
        }
        ParallelAnimation{
            //движение блика на кубке
            SequentialAnimation{
                OpacityAnimator{target: light; to: 1.0; duration: 300}
                OpacityAnimator{target: light; to: 0.0; duration: 450}
            }
            SequentialAnimation{
                RotationAnimation{target: light; to: -30; duration: 300}
                RotationAnimation{target: light; to: 30; duration: 300}
                RotationAnimation{target: light; to: 0; duration: 150}
            }
            //появление выигранной суммы
            PropertyAnimation{target: money; property: "font.pointSize"; from: 60; to: 28; duration: 400}
            OpacityAnimator{target: money; to: 1.0; duration: 400}
        }
        running: true
    }
}
