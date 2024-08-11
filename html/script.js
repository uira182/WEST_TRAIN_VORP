var player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
        height: '100%',
        width: '100%',
        videoId: '',  // O VideoId será definido dinamicamente
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

function onPlayerReady(event) {
    // O player está pronto para uso
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.ENDED) {
        document.getElementById('videoContainer').style.display = 'none';
    }
}

window.addEventListener('message', function(event) {
    if (event.data.action === 'playYouTubeVideo') {
        player.loadVideoById(event.data.videoUrl);
        document.getElementById('videoContainer').style.display = 'flex';
    } else if (event.data.action === 'hideVideo') {
        player.stopVideo();
        document.getElementById('videoContainer').style.display = 'none';
    } else if (event.data.action === 'openMenu') {
        document.getElementById('teleportMenu').style.display = 'block';
        if (event.data.location === 'valentine') {
            document.getElementById('valentineBtn').style.display = 'none';
            document.getElementById('rhodesBtn').style.display = 'block';
        } else if (event.data.location === 'rhodes') {
            document.getElementById('valentineBtn').style.display = 'block';
            document.getElementById('rhodesBtn').style.display = 'none';
        }
    } else if (event.data.action === 'closeMenu') {
        document.getElementById('teleportMenu').style.display = 'none';
    }
});

document.getElementById('valentineBtn').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/teleport`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ location: 'valentine' })
    });
});

document.getElementById('rhodesBtn').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/teleport`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ location: 'rhodes' })
    });
});

document.getElementById('closeBtn').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    });
});