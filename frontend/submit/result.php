<!DOCTYPE html>
<html>
    <head>
        <title>???</title>
        <meta name="description" content="???">
        <?php include "../modules/head.html"?>
    </head>
    <body>
        <?php include "../modules/header.html"?>
        <div class="body">
            <p>
            <?php
                $message = "<SECRETMESSAGE>";
                $key = "<SECRETKEY>";
                $answers = explode(",", "<ANSWERS>");
                $submission = strtolower($_POST["value"]);
                $special = "<SUPERSECRET>";
                if (in_array($submission, $answers)) {
                    echo $message;
                } elseif ($submission == $special) {
                    echo $key;
                } else {
                    echo "";
                }
            ?>
            </p>
        </div>
    </body>
</html>