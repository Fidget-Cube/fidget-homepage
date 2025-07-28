<?php
	$content = '';
	$link = '';
	$source = '';
	if (sizeof($_POST) > 0 && array_key_exists("index", $_POST)) {
		$modifier = (int) $_POST["index"];
	    $conn = new mysqli("localhost", "root", "", "website");
	    $rowcount = $conn->query("SELECT COUNT(id) as count FROM facts;")->fetch_assoc()["count"];
	    $index = ((((int) (time() / 86400)) + $modifier) % $rowcount) + 1;
	    $query = "SELECT facts.content as content, facts.source as source, facts.link as link FROM facts WHERE facts.id=" . $index;
	    $res = $conn->query($query);
	    $factdata = $res->fetch_assoc();
	    $content = $factdata['content'];
	    $link = $factdata['link'];
	    $source = $factdata['source'];
	}
?>
<h3>
    Fact Of The Day
</h3>
<p>
    <?php echo $content; ?>
</p>
<p>
    - <a href="<?php echo $link; ?>" target="_blank"><?php echo $source; ?></a>
</p>
