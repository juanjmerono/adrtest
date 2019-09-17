<html>
<head>
    <script>
        var urlParams = new URLSearchParams(location.search);
        if (urlParams.has('faceIdentity')) {
            var request = new XMLHttpRequest();
            request.open('GET', 'token.jsp?jwt='+urlParams.get('faceIdentity'), true);
            request.onload = function() {
                if (request.status >= 200 && request.status < 400) {
                    // Success!
                    var data = JSON.parse(request.responseText);
                    window.opener.postMessage(JSON.stringify(data),location.href);
                    top.close();
                } else {
                    // We reached our target server, but it returned an error
                    console.log('Error!!!');
                    window.opener.postMessage(JSON.stringify({result:"2"}),location.href);
                    top.close();
            }
            };
            request.onerror = function(err) {
                // There was a connection error of some sort
                console.log(err);
                window.opener.postMessage(JSON.stringify({result:"2"}),location.href);
                top.close();
            };
            request.send();
        } else {
            // Send Error !!
            window.opener.postMessage(JSON.stringify({result:"2"}),location.href);
            top.close();
        }
    </script>
</head>
<body>
</body>
</html>
