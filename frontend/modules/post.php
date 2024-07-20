<?php
    // Compose
    require __DIR__ . '/../vendor/autoload.php';

    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", $_SERVER['MYSQL_ROOT_PW'], "website");

    // Markdown Parsing
    $Parsedown = new Parsedown();
?>
<div class="blog_post">
    <?php
        if (array_key_exists("name", $_REQUEST)) {
            $post_name = $_REQUEST["name"];
        } else {
            $post_name = "";
        }

        $query = $conn->prepare("SELECT content FROM posts WHERE name = ?;");
        $query->bind_param('s', $post_name);
        $query->execute();
        $query->store_result();
        if ($query->num_rows == 0) {
            $post_content = "# ???\n\nEr... run that by me again. What post did you want exactly?";
        } else {
            $query->bind_result($post_content);
            $query->fetch();
        }

        echo $Parsedown->text($post_content);
    ?>
</div>