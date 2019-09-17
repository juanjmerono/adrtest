function receiver(event) {  
    if (event.origin == 'https://faceidentity.adrformacion.com') {  
      // Cada vez que se hace una foto recibe el valor.
      console.log(event.data);
      var msg = JSON.parse(event.data);
      if (msg.error) {
          alert(msg.error);
      }
    }  
  }  
  window.addEventListener('message', receiver, false);

  var request = new XMLHttpRequest();
  request.open('GET', 'tokenm.jsp', true);
  request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
          // Success!
          var data = JSON.parse(request.responseText);
          console.log(data);
          // Monitor IFrame
          var ifrm = document.createElement('iframe');
          ifrm.setAttribute('id', 'ifrm'); // assign an id
          ifrm.setAttribute('allow', 'camera'); // allow camera
          ifrm.setAttribute('scrolling', 'no'); // align
          ifrm.setAttribute('style', 'height: 0px; border: 0px none; width: 0px; margin-bottom: 0px; margin-left: 24px;'); // align
          document.body.appendChild(ifrm); // to place at end of document
          // assign url
          ifrm.setAttribute('src', 'https://faceidentity.adrformacion.com/validarSesionFormativa.php?'+data.jwttoken);    
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
