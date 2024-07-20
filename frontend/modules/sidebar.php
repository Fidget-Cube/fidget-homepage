<?php
    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", $_SERVER['MYSQL_ROOT_PW'], "website");
?>
<div class="sidebar">
    <div class="sidebar-section">
        <h2>
            Categories
        </h2>
        <ul>
            <?php
                $res = $conn->query("SELECT DISTINCT name FROM categories;");
                while ($row = $res->fetch_assoc()) {
                    echo "<li>\n";
                    echo "          <h3 class=\"linked\">\n";
                    echo "              <a onclick=\"loadPage('category', subpage='" . $row["name"] . "')\">" . $row["name"] . "</a>\n";
                    echo "          </h3>\n";
                    echo "      </li>\n";
                }
            ?>
        </ul>
    </div>
    <div class="sidebar-section">
        <h2>
            Stuff To Do
        </h2>
        <ul>
            <li>
                <h3 class="linked"><a id="w3schools" href="https://www.w3schools.com/">Learn Web Development at W3Schools!</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="fauux" href="https://fauux.neocities.org/">Listen to ⌈ Wired Sound For Wired People ⌋ !</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="ynoproject" href="https://ynoproject.net/">Play Yume Nikki Online!</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="gandalf" href="https://gandalf.lakera.ai/">Beat Gandalf in a Battle of Wits!</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="corru" href="https://corru.observer/">Investigate Corru Artifacts</a></h3>
            </li>
        </ul>
    </div>
</div>