<?php
    // MySQL
    // PHP error handling is garbage, might as well not bother
    $conn = new mysqli("localhost", "root", "", "website");
?>
<div class="sidebar">
    <div class="sidebar-section">
        <p>Put my button on your own website!</p>
        <div class="tooltip" onclick='copyText("<img src=\"https\:\/\/fidgetcube.dev/img/fidgetbutton.gif\">"); inCopy()' onmouseout='outCopy()'>
            <span class="tooltiptext" id="tooltiptext">Copy to Clipboard</span>
            <img src="/img/fidgetbutton.gif" alt="Fidget-Cube Button">
        </div>
    </div>
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
                    echo "              <a onclick=\"loadPage('category', '" . $row["name"] . "')\">" . $row["name"] . "</a>\n";
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
            	<h3 class="linked"><a id="astronaut" href="http://astronaut.io/">View the Life of a Random Individual</a></h3>
            </li>
		   	<li>
	       		<h3 class="linked"><a id="seek" href="https://seekwebserial.wordpress.com/">Enter an Anti-Human Universe</a></h3>
	      	</li>
	      	<li>
                <h3 class="linked"><a id="youtube" href="https://youtuube.neocities.org/">Watch and Share Videos Online, for "Free" (Flashing Lights)</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="corru" href="https://corru.observer/">Investigate Corru Artifacts</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="gandalf" href="https://gandalf.lakera.ai/">Beat Gandalf in a Battle of Wits!</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="ynoproject" href="https://ynoproject.net/">Play Yume Nikki Online!</a></h3>
            </li>
            <li>
                <h3 class="linked"><a id="fauux" href="https://fauux.neocities.org/">Listen to ⌈ Wired Sound For Wired People ⌋ !</a></h3>
            </li>
        </ul>
    </div>
</div>
