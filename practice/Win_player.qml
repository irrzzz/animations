import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt5Compat.GraphicalEffects
import QtQuick.Window 2.15

Item {
    id: player
    property string name: "Username"
    property var money: "1000.00"
    width: 84
    height: 79
    //свечение
    Image{
        id: spark
        anchors.fill: avatar
        anchors.margins: -10
        source: "images/win_player/sparks.png"
        opacity: 0.0
    }
    Image{
        id: light
        source: "images/win_player/light.png"
        anchors.fill: avatar
    }
    //Аватар
    Image{
        id: avatar
        source: "images/win_player/avatar.png"
        height: 46
        width: 46
        anchors.centerIn: parent
    }
    //панель под аватаром
    Rectangle{
        id: panel
        anchors{
            top: avatar.bottom
            topMargin: -4
            horizontalCenter: avatar.horizontalCenter
        }
        width: 64
        height: 29
        radius: 5
        border.color: "black"
        border.width: 1
        clip: true
        gradient: Gradient {
            GradientStop { position: 0.6; color: "black"}
            GradientStop { position: 1.0; color: "transparent"}
        }
        //имя пользователя
        Text{
            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            text: name
            font.family: "Arial"
            color: "#dbd4d4"
        }
        //сумма
        Text{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            text: money
            font.family: "Arial"
            color: "white"
        }
    }
    //флаг страны пользователя
    Image{
        id: flag
        source: "images/win_player/flag.png"
        anchors{
            right: panel.left
            rightMargin: -4
            top: panel.top
            topMargin: 3
        }
    }

    //звезды
    Row{
        anchors.verticalCenter: panel.top
        anchors.horizontalCenter: panel.horizontalCenter
        spacing: -5
        width: 5*5
        height: 7
        Repeater{
            id: stars
            model: 5
            Image{
                source: "images/win_player/star.png"
            }
        }
    }

    //добавленная сумма
    Text{
        id: added_m
        text: "+"+0+"$"
        color:"lightgreen"
        opacity: 0.0
        x: panel.x-6
        y: panel.y-10
    }


    ParallelAnimation{
        id: anim
        //появление и движение добавленной суммы
        OpacityAnimator{target: added_m; from: 0.0; to: 1.0; duration: 800}
        NumberAnimation{target: added_m; property: "x"; from: panel.x-6; to: panel.x+40; duration: 800}
        NumberAnimation{target: added_m; property: "y"; from: panel.y-10; to: panel.y-40; duration: 800}
        //свечение
        SequentialAnimation{
            //увеличение размеров
            PropertyAnimation{target: light; property: "anchors.margins"; to: -5; duration: 400}
            PropertyAnimation{target: light; property: "anchors.margins"; to: 0; duration: 400}
        }
        SequentialAnimation{
            //появление и исчезновение блика
            OpacityAnimator{target: spark; to: 1.0; duration: 400}
            OpacityAnimator{target: spark; to: 0.0; duration: 400}
        }
        SequentialAnimation{
            //поворот блика
            RotationAnimation{target: spark; to: 20; duration: 300}
            RotationAnimation{target: spark; to: 0; duration: 300}
            RotationAnimation{target: spark; to: 10; duration: 200}
        }
    }


    //функция для вызова анимации с заданной суммой для добавления
    function add_money(amount){
        added_m.text = "+"+amount+"$"
        anim.running=true
    }

    //заполнить звезды
    function color_stars(amount){
        for(var i=0; i<amount; i++){
            stars.itemAt(i).source = "images/win_player/full_star.png"
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: add_money(100)
    }

    Component.onCompleted: color_stars(3)
}
