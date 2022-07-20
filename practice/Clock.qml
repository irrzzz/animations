import QtQuick 2.0

Item {
    width: 40
    height: 40
    property int seconds
    //звоночки
    Image{
       id: bells
       source: "images/clock/bells.png"
       x: 6
       y: 5
       width: 21.47
       height: 9.86
    }
    //тело часов
    Image{
        id: body
        source: "images/clock/body.png"
        x: 3
        y: 8
        width: 28
        height: 28
    }
    //количество оставшихся секунд
    Text{
        id: sec
        text: seconds>9 ? seconds+"s" : "0"+seconds+"s"
        x: body.x + body.width/4
        y: body.y + body.height/5
        font.pointSize: 7
    }

    SequentialAnimation{
        id: clock_moves
        loops: 4
        ParallelAnimation{
            //сдвиг вправо
            NumberAnimation{target: bells; property:"x"; to: 8; duration: 70}
            NumberAnimation{target: bells; property:"y"; to: 5.5; duration: 70}
            RotationAnimation{ target: bells; to: 20; duration: 70}
       }
        ParallelAnimation{
            //влево
            NumberAnimation{target: bells; property:"x"; to: 4; duration: 70}
            NumberAnimation{target: bells; property:"y"; to: 5.5; duration: 70}
            RotationAnimation{target: bells; to: -20; duration: 70}
        }
        ParallelAnimation{
            //в центр
            NumberAnimation{target: bells; property:"x"; to: 6; duration: 70}
            NumberAnimation{ target: bells; property:"y"; to: 5; duration: 70}
            RotationAnimation{target: bells; to: 0; duration: 70}
        }
    }

    Timer{
        id: timer
        interval: 1000
        repeat: true
       //каждую секунду уменьшает оставшееся время на секунду
        onTriggered:{
            seconds-=1
            sec.text = seconds>9 ? seconds+"s" : "0"+seconds+"s"
            if(seconds==0){
                //если времени не осталось, запускает анимацию звоночков
                timer.stop();
                clock_moves.running=true;
            }
        }
    }

    //для начала работы часов
    function set_time(amount){
        seconds = amount;
        timer.running = true;
    }

    MouseArea{
        anchors.fill: parent
        onClicked: set_time(5)
    }
}
