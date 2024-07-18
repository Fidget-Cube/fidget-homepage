<?php
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", $_SERVER['MYSQL_ROOT_PW'], "website");
?>
<div class="header">
    <link rel="stylesheet" href="/css/header.css" type="text/css" media="all">
    <div id="fact">
        <h3>
            Fact Of The Day
        </h3>
        <p>
            If you have medical expenses that you can't pay, you can appeal to the US Department of Health and Human Services for financial aid.
        </p>
        <p>
            - <a href="https://www.benefits.gov/benefit-finder" target="_blank">benefits.gov</a>
        </p>
    </div>
    <div id="puzzle">
        <a href="/"><img src="/img/puzzle-alt.png" alt=""></a>
    </div>
    <div id="music">
        <?php
            // Each day we should pull a new song from the "songs" table, looping back around when finished.
            $rowcount = $conn->query("SELECT COUNT(id) as count FROM songs;")->fetch_assoc()["count"];
            $index = (((int) (time() / 8640)) % $rowcount) + 1;
            // The id corresponding to this day will be used to query the song
            $query = "SELECT songs.title as title, songs.artist as artist, albums.artist as backup_artist, songs.link as link, songs.filename as fname FROM songs LEFT JOIN albums ON songs.album_id=albums.id WHERE songs.id=" . $index;
            $res = $conn->query($query);
            $songdata = $res->fetch_assoc();
        ?>
        <h3>
            Today's Music
        </h3>
        <p>
        <?php
            if (!$songdata["artist"]) {
                echo $songdata["title"] . " -- " . $songdata["backup_artist"];
            } else {
                echo $songdata["title"] . " -- " . $songdata["artist"];
            }
        ?>
        </p>
        <p>
            <a href="<?php echo $songdata['link']; ?>" target="_blank">
                <?php
                    if (str_contains($songdata["link"], "youtu")) {
                        echo "Listen on YouTube";
                    } else {
                        echo "Listen Elsewhere";
                    }
                ?>
            </a>
        </p>
        <div id="audioplayer-container">
            <link rel="stylesheet" href="/css/audio-slider.css" type="text/css" media="all">
            <div id="audioplayer-top-row">
                <audio src="/audio/<?php echo $songdata['fname']; ?>" preload="metadata"></audio>
                <button id="play-icon" class="audio"></button>
                <span id="current-time" class="time p">0:00</span>
                <input type="range" id="seek-slider" max="100" value="0">
                <span id="duration" class="time p">0:00</span>
            </div>
            <div id="audioplayer-bottom-row">
                <output id="volume-output" class="p">100</output>
                <input type="range" id="volume-slider" max="100" value="100">
                <button id="mute-icon" class="audio"></button>
            </div>
        </div>
        <script type="text/javascript" src="/js/playbutton.js"></script>
    </div>
    <div id="navline">
        <p><a class="hidden" href="/index.php?page=submit">???</a></p>
        <p><a href="mailto:max@fidgetcube.dev">Email</a></p>
        <p class="divider">|</p>
        <p><a href="/index.php?page=about">About</a></p>
        <p class="divider">|</p>
        <p><a href="/index.php?page=posts">Posts</a></p>
        <p class="divider">|</p>
        <p><a href="/index.php?page=portfolio">Portfolio</a></p>
        <p><a class="hidden" href="/index.php?page=submit">???</a></p>
        </p>
    </div>
    <div id="boxes">
        <div id="webring">
            <iframe src="https://ring.koek.club/site/5/button.html" title="Absurdism Webring"></iframe>
        </div>
        <div class="box-container popup">
            <a href="https://github.com/Fidget-Cube" target="_blank"><img class="box" src="/img/github.gif" alt="github"></a>
        </div>
        <div class="box-container popup">
            <a href="/feed"><img class="box" src="/img/feed.gif" alt="feed"></a>
        </div>
        <div class="box-container popup">
            <a href="http://www.mabsland.com/Adoption.html" target="_blank"><img class="box" src="/img/Censor_14c.gif" alt="Fa Teen"></a>
        </div>
        <div class="box-container popup">
            <a href="https://infosec.exchange/@fidgetcube" target="_blank"><img class="box" src="/img/mastodon_button_3.gif" alt="mastodon"></a>
        </div>
        <div class="box-container popup">
            <a href="https://discord.gg/invite/stYvsEBKju/" target="_blank"><img class="box" src="/img/discord2.gif" alt="discord"></a>
        </div>
        <div class="box-container popup">
            <a href="https://absurdswrld.online/" target="_blank"><img class="box" src="/img/absurd.gif" alt="absurd"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/php_powered.gif" alt="php">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/y2kid.gif" alt="y2kid">
        </div>
        <div class="box-container popup">
            <a href="https://darkot.neocities.org/" target="_blank"><img class="box" src="/img/8831.png" alt="darkotapproved"></a>
        </div>
        <div class="box-container popup">
            <a href="https://absurdswrld.online/radio/" target="_blank"><img class="box" src="/img/absurdradio.gif" alt="absurdradio"></a>
        </div>
        <div class="box-container popup">
            <a href="https://uranohead.neocities.org/" target="_blank"><img class="box" src="/img/28.gif" alt="uranohead"></a>
        </div>
        <div class="box-container popup">
            <a href="https://ophanimkei.com/you/RPGmaker" target="_blank"><img class="box" src="/img/starbage_button_3.gif" alt="starbage"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/ab-yr.gif" alt="Online Friendship">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/mysqla.gif" alt="mysql">
        </div>
        <div class="box-container popup">
            <a href="https://flashpointarchive.org/" target="_blank"><img class="box" src="/img/adobe_getflashp.gif" alt="flashpoint"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/angelfire.gif" alt="angelfire">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/gc.gif" alt="geocities">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/anydamn.gif" alt="bestviewed">
        </div>
        <div class="box-container popup">
            <a href="https://ynoproject.net/" target="_blank"><img class="box" src="/img/beyes.gif" alt="yumenikki"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/bloodcovered.gif" alt="blood">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/cssdif.gif" alt="css">
        </div>
        <div class="box-container popup">
            <a href="https://www.blankbanshee.com/" target="_blank"><img class="box" src="/img/banshee.gif" alt="blankbanshee"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/zanarkand.gif" alt="zanarkand">
        </div>
        <!-- <div class="box-container popup">
            <img class="box" src="/img/cyberrot.gif" alt="cyberrot">
        </div> -->
        <div class="box-container popup">
            <img class="box" src="/img/eightyeight.gif" alt="88x31">
        </div>
        <!-- <div class="box-container popup">
            <img class="box" src="/img/femboy.gif" alt="femboy">
        </div> -->
        <div class="box-container popup">
            <img class="box" src="/img/nekojiru2.gif" alt="nekojiru">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/upallnight.gif" alt="upallnight">
        </div>
        <!-- <div class="box-container popup">
            <img class="box" src="/img/volta.gif" alt="volta">
        </div> -->
        <div class="box-container popup">
            <img class="box" src="/img/webpassion.gif" alt="badwebdesign">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/neocities-2.gif" alt="neocities">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/gnu-linux.gif" alt="linux">
        </div>
        <div class="box-container popup">
            <a href="https://blackfogzine.org/" target="_blank"><img class="box" src="/img/blackfog.png" alt="blackfog"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/88x31amenbreak.png" alt="amenbreak">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/iblis9.gif" alt="iblis">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/nocookie.gif" alt="nocookies">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/nowebp.png" alt="nowebp">
        </div>
    </div>
</div>