<?php 
    if (!array_key_exists("page", $_REQUEST)) {
        $page = "home";
    } else {
        $page = $_REQUEST["page"];
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <title>&#387;u&#7433;&#670;&#596;&#592;H &#477;qn&#390;-&#647;&#477;&#387;p&#7433;&#8498;</title>
        <meta name="description" content="Fidget-Cube Hacking">
        <?php include "./modules/head.html"?>
    </head>
    <body>
        <?php include "./modules/header.php"?>
        <div class="body">
            <?php 
                switch ($page) {
                    case "about":
                        include "./modules/about.html";
                        break;
                    case "posts":
                        include "./modules/directory.html";
                        break;
                    case "portfolio":
                        include "./modules/portfolio.html";
                        break;
                    case "submit":
                        include "./modules/submit/submit.html";
                        break;
                    case "result":
                        include "./modules/submit/result.php";
                        break;
                    case "cryptography":
                        include "./modules/categories/cryptography.php";
                        break;
                    case "reverse_engineering":
                        include "./modules/categories/reverse_engineering.php";
                        break;
                    case "javascript":
                        include "./modules/categories/javascript.php";
                        break;
                    case "provably_secure_2":
                        include "./modules/posts/provably_secure_2.html";
                        break;
                    case "omgzip":
                        include "./modules/posts/omgzip.html";
                        break;
                    case "javascript_is_a_joke":
                        include "./modules/posts/javascript_is_a_joke.html";
                        break;
                    default:
                        include "./modules/homepage.php";
                }
            ?>
        </div>
        <?php include "./modules/footer.html"?>
    </body>
</html>