function receiver(event) {  
    console.log(event);
    if (location.href.startsWith(event.origin)) {  
        // Cada vez que se hace una foto recibe el valor.
        console.log(JSON.parse(event.data));
        if (JSON.parse(event.data).result !== "1") {
            alert('Error al identificar!!');
        } else {
            location.href = 'question.jsp';
        }
    }  
}  
window.addEventListener('message', receiver, false);

var faceUrl = 'https://faceidentity.adrformacion.com/?';
document.addEventListener('click', function (event) {
    // If the clicked element doesn't have the right selector, bail
    if (!event.target.matches('#startButton')) return;
    // Don't follow the link
    event.preventDefault();
    var ifrm = window.open(faceUrl,'_blank');
}, false);

function getToken() {
    if (document.getElementById("startButton")) {
        var request = new XMLHttpRequest();
        request.open('GET', 'token.jsp', true);
        request.onload = function() {
            if (request.status >= 200 && request.status < 400) {
                // Success!
                var data = JSON.parse(request.responseText);
                //console.log(data);
                faceUrl = 'https://faceidentity.adrformacion.com/?'+data.jwttoken;
                document.getElementById("startButton").disabled = false;
            } else {
                // We reached our target server, but it returned an error
                console.log('Error!!!');
            }
        };
        request.onerror = function(err) {
            // There was a connection error of some sort
            console.log(err);
        };
        request.send();
    } else {
        setTimeout(getToken,100);
    }
}

getToken();