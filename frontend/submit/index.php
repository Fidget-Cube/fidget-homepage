<!DOCTYPE html>
<html>
    <head>
        <title>???</title>
        <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
        <meta name="description" content="???">
        <link rel="stylesheet" href="/css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <?php
            $headerFile = fopen("../modules/header.html", "r") or die("<p>ERROR: Could not display header</p>");
            echo fread($headerFile, filesize("../modules/header.html"));
            fclose($headerFile);
        ?>
        <div class="submit_form">
            <form action="/submit/result.php" method="POST">
                <input type="text" name="value"><br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>