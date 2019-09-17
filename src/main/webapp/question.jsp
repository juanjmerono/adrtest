<html>
<head>
  <link type="text/css" rel="stylesheet" media="all" href="../dist/styles/h5p.css" />
  <meta charset="utf-8" />
  <script type="text/javascript" src="dist/js/h5p-standalone-main.min.js"></script>

  <script type="text/javascript">
    (function($) {
      $(function() {
        $('.h5p-container1').h5p({
          frameJs: 'dist/js/h5p-standalone-frame.min.js',
          frameCss: 'dist/styles/h5p.css',
          h5pContent: 'workspace/question1',
          displayOptions: { // OPTIONAL hide the frame or download, export etc. buttons they are visible by default
            frame: true,
            copyright: true,
            embed: false,
            download: false,
            icon: true,
            export: false
          }          
        });
      });
    })(H5P.jQuery);
  </script>
  <script src="audit.js"></script>
</head>
  <body>
    <h1>Cuestionario a completar</h1>
    <div class="h5p-container1"></div>
  </body>
</html>