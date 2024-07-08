<p id="response">
    <?php
        $message = $_SERVER["SECRETMESSAGE"];
        $key = $_SERVER["SECRETKEY"];
        $answers = explode(",", $_SERVER["ANSWERS"]);
        $submission = strtolower($_POST["value"]);
        $special = $_SERVER["SUPERSECRET"];
        if (in_array($submission, $answers)) {
            echo $message;
        } elseif ($submission == $special) {
            echo $key;
        } else {
            echo "";
        }
    ?>
</p>