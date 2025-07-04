<?php
    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", "", "website");
    $CHAR_ALLOWLIST = "\n\r 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.?;:!@#$%^&*()-_=+[]{}`~\/";

    if (sizeof($_POST) > 0) {
        $comment = (string) $_POST["comment"];
        $poster = (string) $_POST["poster"];
        $canary = false;
        foreach (str_split($comment.$poster) as $x) {
            if (!str_contains($CHAR_ALLOWLIST,$x)) {
                $message = "Think you're slick eh? :/ I told you arrow brackets <> and single and double quotes aren't allowed >:|. Burp Suite wont help you.";
                $canary = true;
                break;
            }
        }
        if (!$canary) {
            # I'm currently setting an arbitrary limit of 50 signatures to prevent spam
            $rowcount = $conn->query("SELECT COUNT(id) as count FROM guestbook;")->fetch_assoc()["count"];
            if ($rowcount >= 50) {
                $message = "Sorry, the guestbook is all filled up! Email me at max@fidgetcube.dev and I'll increase the limit as soon as I can!";
            } else {
                $stmt = $conn->prepare("INSERT INTO guestbook (content, name) VALUES (?, ?)");
                $stmt->bind_param("ss", $comment, $poster);
                $stmt->execute();
                $stmt->close();
                # $message = "Updated database successfully";
            }
        }
    } else {
        $message = "";
    }
?>
<div id="bio">
    <p>My name is <em style="font-style: normal; color: cyan;">Fidget-Cube</em>. Welcome to my <em style="font-style: normal; color: deeppink;">headspace</em>, fellow onieronaut :)</p>
    <p>I'm a computer and internet nerd that loves all things <em>abstract</em> and <em style="font-style: normal; color: darkgray;">dark</em>. I'm based out of the west coast of the United States, and am an active member of Pacific Hackers, a grassroots hacker community focused on education. We love building and breaking things together.</p>
    <p>This site is a repository for my portfolio, thoughts, interests, puzzles and ideas. Take what you like and leave the rest</p>
    <p>In case you couldn't tell, I'm a big fan of cyberpunk media, heavily sampled music, trippy indie games, mental health and freedom of expression. I was partially inspired to make this website by the <em style="font-style: normal; color: #d2738a;">Absurdism World</em> peeps, be sure to check out their websites as well!</p>
    <p>Still here? I'm flattered. If you want you can sign my guestbook below, I'd love to see if people actually visit my webpage. If not, that's okay too. I'm just glad that my digital <em style="font-style: normal; color: midnightblue;">ghost</em> has been able to form a nook within your consciousness, if briefly, so I might be able to exist a bit longer...</p>
    <div class="submit_form">
        <!-- <label class="p" for="comment">Leave a comment!</label><br> -->
        <textarea id="comment" class="p" type="text" name="comment"></textarea><br>
        <label class="p" for="poster">Who are you?</label><br>
        <input id="poster" class="p" type="text" name="poster"><br>
        <input class="p" type="submit" value="Submit" onclick="postComment()">
    </div>
    <p id="server_response"><?php echo htmlentities($message); ?></p>
    <p>The guestbook is currently a work in progress. You can leave a note here and it will be saved, but only the latest note will be shown in a gross debug statement below</p>
    <p>Oh yeah, feel free to try and break this. Teach me a lesson for trying to roll my own message board.</p> I've been a baaaad developer and need to be punished
    <p><?php
        $query = "SELECT guestbook.content as comment, guestbook.name as poster, guestbook.timestamp as timestamp FROM guestbook ORDER BY timestamp DESC;";
        $res = $conn->query($query);
        $signatures = $res->fetch_assoc();
        echo $signatures['comment'];
        echo $signatures['poster'];
        echo $signatures['timestamp'];
    ?></p>
</div>