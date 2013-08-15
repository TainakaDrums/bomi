import QtQuick 2.0
import CMPlayerCore 1.0 as Core
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Core.Engine {
	id: player
	property real dockZ: 0.0
	property real bottomPadding: 0.0
	Logo { anchors.fill: parent; visible: player.state == Core.Engine.Stopped }
	TextOsd { id: msgosd }
	ProgressOsd { id: timeline; value: player.time/player.duration }
	PlayInfoView { objectName: "playinfo"; player: player }
	Item {
		anchors.fill: parent; z: dockZ
		PlaylistDock {
			id: right
			objectName: "playlist"
			width: Math.min(widthHint, player.width-(left.x+left.width)-20)
			height: parent.height-2*y - bottomPadding
		}
		HistoryDock {
			id: left
			objectName: "history"
			width: Math.min(widthHint, player.width*0.4)
			height: parent.height-2*y - bottomPadding
		}
	}
	onMessageRequested: { msgosd.text = message; msgosd.show(); }
	onSought: {timeline.show();}
}
