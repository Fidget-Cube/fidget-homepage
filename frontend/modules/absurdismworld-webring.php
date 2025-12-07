<?php 
    $webringIds = array(
        "Absurd",
        "Radio",
        "Fidget-Cube",
        "U.A.",
        "Sata",
        "Ramtoi",
        "Darkot",
        "sbeve",
    );
    $webringLinks = array(
        "https://absurdismworld.nekoweb.org/",
        "https://absurdismworld.nekoweb.org/radio/",
        "https://fidgetcube.dev/",
        "https://unfortunateaccident.neocities.org/",
        "https://sata.neocities.org/",
        "https://orangeryzone.neocities.org/",
        "https://darkot.neocities.org/",
        "https://denno.life/",
    );

    $index = 0;
    if (array_key_exists("member", $_REQUEST)) {
        if (array_search($_REQUEST["member"], $webringIds)) {
            $index = array_search($_REQUEST["member"], $webringIds);
        }
    }
    // Ahh why is PHP so mean about modulus
    if ($index == 0) {
        $prevName = $webringIds[count($webringIds) - 1];
        $prevSite = $webringLinks[count($webringLinks) - 1];
    } else {
        $prevName = $webringIds[($index - 1) % count($webringIds)];
        $prevSite = $webringLinks[($index - 1) % count($webringLinks)];
    }
    $nextName = $webringIds[($index + 1) % count($webringIds)];
    $nextSite = $webringLinks[($index + 1) % count($webringLinks)];
?>
<!DOCTYPE html>
<html lang="en" style="--wm-toolbar-height: 109px;">
    <head>
        <meta charset="UTF-8">
        <title>Webring Button</title>
        <link rel="stylesheet" href="http://fidgetcube.dev/css/absurdismworld-webring.css">
        <base target="_parent">
    </head>
    <body>
        <div id="main">
            <div class="site-btn">
                <a href=<?php echo $prevSite ?>>
                    <img class="prev-arrow" src="https://fidgetcube.dev/img/absurdismworld-webring-arrow.png">
                    <?php echo $prevName ?>
                </a>
            </div>
            <div id="infotext">
                <p>Part of the <a id="absurd" href="https://absurdismworld.nekoweb.org/">ABSURDISMWORLD</a> webring</p>
            </div>
            <div class="site-btn">
                <a href=<?php echo $nextSite ?>>
                    <img class="next-arrow" src="https://fidgetcube.dev/img/absurdismworld-webring-arrow.png">
                    <?php echo $nextName ?>
                </a>
            </div>
        </div>
    </body>
</html>
