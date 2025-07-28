<?php
	$title = '';
	$artist = '';
	$backup_artist = '';
	$link = '';
	$filename = '';
	if (sizeof($_POST) > 0 && array_key_exists("index", $_POST)) {
		$modifier = (int) $_POST["index"];
	    $conn = new mysqli("localhost", "root", "", "website");
	    $rowcount = $conn->query("SELECT COUNT(id) as count FROM songs;")->fetch_assoc()["count"];
	    $index = ((((int) (time() / 86400)) + $modifier) % $rowcount) + 1;
	    $query = "SELECT songs.title as title, songs.artist as artist, albums.artist as backup_artist, songs.link as link, songs.filename as fname FROM songs LEFT JOIN albums ON songs.album_id=albums.id WHERE songs.id=" . $index;
		$res = $conn->query($query);
	    $songdata = $res->fetch_assoc();
	    $title = $songdata['title'];
	    $artist = $songdata['artist'];
	    $backup_artist = $songdata['backup_artist'];
	    $link = $songdata['link'];
	    $filename = $songdata['fname'];
	}
?>
<p>
	<?php
	    if (!$artist) {
	        echo $title . " -- " . $backup_artist;
	    } else {
	        echo $title . " -- " . $artist;
	    }
	?>
</p>
<p>
    <a href="<?php echo $link; ?>" target="_blank">
        <?php
            if (str_contains($link, "youtu")) {
                echo "Listen on YouTube";
            } else {
                echo "Listen Elsewhere";
            }
        ?>
    </a>
</p>
<p>
	<?php echo $filename; ?>
</p>
