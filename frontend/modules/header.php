<?php
    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", "", "website");
?>
<div class="header">
    <link rel="stylesheet" href="/css/header.css" type="text/css" media="all">
    <div id="fact">
    	<a onclick="decrementFact()"><img src="/img/left_sharp_arrow.png" alt=""></a>
    	<div id="fact-inner">
	        <?php
	            // Each day we should pull a new fact from the "facts" table, looping back around when finished.
	            $rowcount = $conn->query("SELECT COUNT(id) as count FROM facts;")->fetch_assoc()["count"];
	            $index = (((int) (time() / 86400)) % $rowcount) + 1;
	            // The id corresponding to this day will be used to query the fact
	            $query = "SELECT facts.content as content, facts.source as source, facts.link as link FROM facts WHERE facts.id=" . $index;
	            $res = $conn->query($query);
	            $factdata = $res->fetch_assoc();
	        ?>
	        <h3>
	            Fact Of The Day
	        </h3>
	        <p>
	            <?php echo $factdata['content']; ?>
	        </p>
	        <p>
	            - <a href="<?php echo $factdata['link']; ?>" target="_blank"><?php echo $factdata['source']; ?></a>
	        </p>
        </div>
        <a onclick="incrementFact()"><img src="/img/right_sharp_arrow.png" alt=""></a>
    </div>
    <div id="puzzle">
        <a onclick="loadPage('home')"><img src="/img/puzzle-alt.png" alt=""></a>
    </div>
    <div id="music">
    	<a onclick="decrementMusic()"><img src="/img/left_sharp_arrow.png" alt=""></a>
    	<div id="music-inner">
	        <?php
	            // Each day we should pull a new song from the "songs" table, looping back around when finished.
	            $rowcount = $conn->query("SELECT COUNT(id) as count FROM songs;")->fetch_assoc()["count"];
	            $index = (((int) (time() / 86400)) % $rowcount) + 1;
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
	            <script type="text/javascript" src="/js/playbutton.js"></script>
	        </div>
        </div>
        <a onclick="incrementMusic()"><img src="/img/right_sharp_arrow.png" alt=""></a>
    </div>
    <div id="navline">
        <p><a class="hidden" onclick="loadPage('submit')">???</a></p>
        <p><a href="mailto:max@fidgetcube.dev">Email</a></p>
        <p class="divider">|</p>
        <p><a onclick="loadPage('about')">About</a></p>
        <p class="divider">|</p>
        <p><a onclick="loadPage('friends')">Friends</a></p>
        <p class="divider">|</p>
        <p><a onclick="loadPage('posts')">Posts</a></p>
        <p class="divider">|</p>
        <p><a onclick="loadPage('portfolio')">Portfolio</a></p>
        <p><a class="hidden" onclick="loadPage('submit')">???</a></p>
        </p>
    </div>
    <div id="boxes">
        <div id="webring">
            <iframe src="https://ring.koek.club/site/5/button.html" title="Absurdism Webring"></iframe>
        </div>
        <div class="box-container popup">
            <a href="https://discordapp.com/users/228655530007199745" target="_blank"><img class="box" src="/img/discord2.gif" alt="discord"></a>
        </div>
        <div class="box-container popup">
            <a href="https://github.com/Fidget-Cube" target="_blank"><img class="box" src="/img/github.gif" alt="github"></a>
        </div>
        <div class="box-container popup">
            <a href="/feed.php"><img class="box" src="/img/feed.gif" alt="feed"></a>
        </div>
        <div class="box-container popup">
            <a href="http://www.mabsland.com/Adoption.html" target="_blank"><img class="box" src="/img/Censor_14c.gif" alt="Fa Teen"></a>
        </div>
        <div class="box-container popup">
            <a href="https://darkot.neocities.org/" target="_blank"><img class="box" src="/img/8831.png" alt="darkotapproved"></a>
        </div>
        <div class="box-container popup">
            <a href="https://unfortunateaccident.neocities.org/" target="_blank"><img class="box" src="/img/uafast.gif" alt="unfortunateaccident"></a>
        </div>
        <div class="box-container popup">
            <a href="https://sadgirlsclub.wtf" target="_blank"><img class="box" src="/img/sgc.png" alt="sadgirlsclub"></a>
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/gnu-linux.gif" alt="linux">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/mysqla.gif" alt="mysql">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/php_powered.gif" alt="php">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/anydamn.gif" alt="bestviewed">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/nocookie.gif" alt="nocookies">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/nowebp.png" alt="nowebp">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/cssdif.gif" alt="css">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/eightyeight.gif" alt="88x31">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/y2kid.gif" alt="y2kid">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/ab-yr.gif" alt="Online Friendship">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/angelfire.gif" alt="angelfire">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/gc.gif" alt="geocities">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/bloodcovered.gif" alt="blood">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/zanarkand.gif" alt="zanarkand">
        </div>
        <!-- <div class="box-container popup">
            <img class="box" src="/img/cyberrot.gif" alt="cyberrot">
        </div> -->
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
        <!-- <div class="box-container popup">
            <img class="box" src="/img/88x31amenbreak.png" alt="amenbreak">
        </div> -->
        <div class="box-container popup">
            <img class="box" src="/img/iloveamenbreak.gif" alt="ramenbreak">
        </div>
        <div class="box-container popup">
            <img class="box" src="/img/iblis9.gif" alt="iblis">
        </div>
        <div class="box-container popup">
            <a href="https://lucida.to" target="_blank"><img class="box" src="/img/lucida.gif" alt="lucida"></a>
        </div>
    </div>
</div>
