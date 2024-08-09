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
    <ul class="h2">
        <?php
            $res = $conn->query("SELECT id, name, title, headliner, date FROM posts ORDER BY date DESC;");
            $i = 1;
            while ($row = $res->fetch_assoc()) {
                if ($i > 5) {
                    break;
                }
                $date = date_create($row["date"]);
                $categories = $conn->query("SELECT name FROM categories WHERE post_id = " . $row['id'])->fetch_all();
                echo "<li>\n";
                echo "          <h2 class=\"linked\">\n";
                echo "              <a onclick=\"loadPage('post', '" . $row["name"] . "')\">" . $row["title"] . "</a>\n";
                echo "          </h2>\n";
                echo "          <p>" . $Parsedown->text($row["headliner"]) . "</p>\n";
                echo "          <p class=\"metadata\">\n";
                echo "              <time datetime=\"" . date_format($date, "Y-m-d\TH:i:s\Z") . "\">" . date_format($date, "M d Y") . " -- </time>\n";
                $count = 0;
                foreach($categories as $x => $y) {
                    if ($count > 0) {
                        echo  "              , ";
                    }
                    echo "              <a onclick=\"loadPage('category', '" . $y[0] . "')\">" . $y[0] . "</a>\n";
                    $count++;
                }
                echo "          </p>\n";
                echo "      </li>\n";
                $i++;
            }
        ?>
    </ul>
    <h3 class="linked"><a onclick="loadPage('posts')">See All Posts --></a></h3>
</div>
<?php include __DIR__ . "/sidebar.php"?>
