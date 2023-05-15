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
        <div class="header">
            <div class="puzzle">
                <a href="/">
                    <img src="/img/puzzle-alt.png" alt="">
                </a>
            </div>
            <div class="contact_info">
                <a href="mailto:max@fidgetcube.dev">Email</a><br>
                <a href="https://github.com/Fidget-Cube" target="_blank">Github</a><br>
                <a href="https://www.linkedin.com/in/maxvonb" target="_blank">LinkedIn</a><br>
                <a href="https://infosec.exchange/@fidgetcube" target="_blank">Mastodon</a><br>
            </div>
            <div class="links">
                <a href="/posts/directory.html">All Posts</a><br>
                <a href="/about.html">My CV</a><br>
                <a style="color:black;" href="/submit">???</a><br>
            </div>
            <div class="title">
                <p>
                Fidget-Cube's Security Blog<br>
                I like puzzles
                </p>
            </div>
        </div>
        <div>
            <p id="title" style="text-align: center; word-wrap: break-word;">
            <?php
                $message = "770e1a67280de32989eb77511b5fc3e99b955eb9f3406896fb315831b743c84f56296d73a4287f9280dabff500a830823b7da48d8d34a162021a32fa3f7e02056abbd18a333723d5a42b6ce09b0d9abd";
                $key = "4C6574277320616C6C206C6F7665206C61696E2121212121";
                switch (strtolower($_POST["value"])) {
                    case "flcl":
                        echo $message;
                        break;
                    case "all about lily chou-chou":
                        echo $message;
                        break;
                    case "draining love story":
                        echo $message;
                        break;
                    case "omori":
                        echo $message;
                        break;
                    case "outer wilds":
                        echo $message;
                        break;
                    case "oldboy":
                        echo $message;
                        break;
                    case "milk inside a bag of milk inside a bag of milk":
                        echo $message;
                        break;
                    case "blade runner":
                        echo $message;
                        break;
                    case "house of leaves":
                        echo $message;
                        break;
                    case "chicory: a colorful tale":
                        echo $message;
                        break;
                    case "bee and puppycat":
                        echo $message;
                        break;
                    case "serial experiments lain":
                        echo $key;
                        break;
                    default:
                        echo "";
                        break;
                }
            ?>
            </p>
        </div>
    </body>
</html>