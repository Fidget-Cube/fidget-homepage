<?php 
    // Page Navigation
    $pageLookup = array(
        "home" => "/modules/homepage.php",
        "about" => "/modules/about.php",
        "posts" => "/modules/directory.php",
        "portfolio" => "/modules/portfolio.html",
        "submit" => "/modules/submit/submit.html",
        "result" => "/modules/submit/result.php",
        "post" => "/modules/post.php",
        "category" => "/modules/category.php",
        "404" => "/modules/error_pages/404.html",
        "403" => "/modules/error_pages/403.html",
        "500" => "/modules/error_pages/500.html",
        "503" => "/modules/error_pages/503.html",
    );

    if (array_key_exists("page", $_REQUEST)) {
        if (array_key_exists($_REQUEST["page"], $pageLookup)) {
            $page = $pageLookup[$_REQUEST["page"]];
        }
        else {
            $page = $pageLookup["home"];
        }
    } else {
        $page = $pageLookup["home"];
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <title>&#387;u&#7433;&#670;&#596;&#592;H &#477;qn&#390;-&#647;&#477;&#387;p&#7433;&#8498;</title>
        <meta name="description" content="Fidget-Cube Hacking">
        <?php include __DIR__ . "/modules/head.html"?>
    </head>
    <body>
        <?php include __DIR__ . "/modules/header.php"?>
        <div class="body" id="body">
            <?php 
                include __DIR__ . $page;
            ?>
        </div>
        <?php include __DIR__ . "/modules/footer.html"?>
    </body>
</html>