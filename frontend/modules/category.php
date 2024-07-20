<?php
    // Compose
    require __DIR__ . '/../vendor/autoload.php';

    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", $_SERVER['MYSQL_ROOT_PW'], "website");

    // Markdown Parsing
    $Parsedown = new Parsedown();
?>
<div class="feed">
    <?php
        if (array_key_exists("name", $_REQUEST)) {
            $category_name = $_REQUEST["name"];
        } else {
            $category_name = "";
        }

        $query = $conn->prepare("SELECT posts.name, posts.title, posts.headliner, posts.date FROM posts LEFT JOIN categories ON posts.id = categories.post_id WHERE categories.name = ? ORDER BY date DESC;");
        $query->bind_param('s', $category_name);
        $query->execute();
        $query->store_result();
        if ($query->num_rows == 0) {
            $category_name = "???";
        }
    ?>
    <br>
    <h1>
        Category: <?php echo $category_name; ?>
    </h1>
    <ul class="h2">
        <?php
            $query->bind_result($post_name, $post_title, $post_headliner, $post_date);
            $i = 1;
            while ($row = $query->fetch()) {
                if ($i > 5) {
                    break;
                }
                $date = date_create($post_date);
                echo "<li>\n";
                echo "          <h2 class=\"linked\">\n";
                echo "              <a onclick=\"loadPage('post', '" . $post_name . "')\">" . $post_title . "</a>\n";
                echo "          </h2>\n";
                echo "          <p>" . $Parsedown->text($post_headliner) . "</p>\n";
                echo "          <p class=\"metadata\">\n";
                echo "              <time datetime=\"" . date_format($date, "DATE_ATOM") . "\">" . date_format($date, "M d Y") . " -- </time>\n";
                echo "              <a onclick=\"loadPage('category', '" . $category_name . "')\">" . $category_name . "</a>\n";
                echo "          </p>\n";
                echo "      </li>\n";
                $i++;
            }
        ?>
    </ul>
</div>
<?php include __DIR__ . "/sidebar.php"?>
