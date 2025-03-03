<?php
    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", "", "website");

    if (sizeof($_POST) > 0) {
        $message = "Ok... I have a confession to make... there is no guestbook >:)";
    } else {
        $message = "";
    }
?>
<div class="bio">
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
    <p><?php echo $message; ?></p>
</div>