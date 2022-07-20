import QtQuick 2.0
import Qt5Compat.GraphicalEffects
import QtQuick.Window 2.15

//огни для Widget
Item {
    ListModel{
        id: lights
        ListElement{_x: 156; _y: 150; _opacity: 0.0}
        ListElement{_x: 132; _y: 163; _opacity: 0.0}
        ListElement{_x: 99; _y: 171; _opacity: 0.0}
        ListElement{_x: 61; _y: 164; _opacity: 1.0}
        ListElement{_x: 40; _y: 150; _opacity: 0.0}
        ListElement{_x: 20; _y: 54; _opacity: 0.0}
        ListElement{_x: 37; _y: 30; _opacity: 0.0}
        ListElement{_x: 62; _y: 15; _opacity: 1.0}
        ListElement{_x: 96; _y: 10; _opacity: 0.0}
        ListElement{_x: 124; _y: 13; _opacity: 0.0}
        ListElement{_x: 155; _y: 34; _opacity: 0.0}
        ListElement{_x: 168; _y: 54; _opacity: 1.0}
    }
    Repeater{
        id: repeater
        model: lights
        Image{
            x: _x
            y: _y
            opacity: _opacity
            source: "images/widget/light.png"
            Behavior on opacity{
                OpacityAnimator{ duration: 100}
            }
        }

    }

    Timer{
        id: timer
        interval: 200
        repeat: true
        onTriggered:{
            for(var i=0; i<12; i++){
                if(repeater.itemAt(i).opacity===1.0){
                    repeater.itemAt(i).opacity=0.0
                    if(i<11){
                        repeater.itemAt(i+1).opacity=1.0
                        i++;
                    }
                    else{
                        repeater.itemAt(0).opacity=1.0
                    }
                }
            }
        }
    }

    function animate_lights(){
        timer.start()
    }
}
