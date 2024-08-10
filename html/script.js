window.addEventListener('message', function(event) {
    if (event.data.action === 'openMenu') {
        document.getElementById('teleportMenu').style.display = 'block';
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
        body: JSON.stringify({location: 'valentine'})
    });
});

document.getElementById('rhodesBtn').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/teleport`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({location: 'rhodes'})
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
