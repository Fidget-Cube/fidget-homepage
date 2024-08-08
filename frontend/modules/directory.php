<?php
    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", $_SERVER['MYSQL_ROOT_PW'], "website");
?>
<div class="all_posts">
    <ul class="h3">
        <?php
            $res = $conn->query("SELECT name, title, date FROM posts ORDER BY date DESC;");
            while ($row = $res->fetch_assoc()) {
                $date = date_create($row["date"]);
                echo "<li>\n";
                echo "          <h3>\n";
                echo "              <time datetime=\"" . date_format($date, "Y-m-d\TH:i:s\Z") . "\">" . date_format($date, "M d Y") . " -- </time>\n";
                echo "              <a onclick=\"loadPage('post', '" . $row["name"] . "')\">" . $row["title"] . "</a>";
                echo "          </h3>\n";
                echo "      </li>\n";
            }
        ?>
    </ul>
</div>
