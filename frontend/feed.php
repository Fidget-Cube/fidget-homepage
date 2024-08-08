<?php

// Compose
require __DIR__ . '/vendor/autoload.php';

// MySQL
// PHP error handling is garbage, might as well not bother
$conn = new mysqli("localhost", "root", $_SERVER['MYSQL_ROOT_PW'], "website");

// Markdown Parsing
$Parsedown = new Parsedown();

$entries = array();

$res = $conn->query("SELECT id, name, title, headliner, content, date FROM posts ORDER BY date DESC;");
$latest_date = "";
while ($row = $res->fetch_assoc()) {
    $date = date_create($row["date"]);
    if ($latest_date == "") {
        $latest_date = $date;
    }
    $categories = $conn->query("SELECT name FROM categories WHERE post_id = " . $row['id'])->fetch_all();
    $entry_xml = "<entry>
        <title>" . $row["title"] . "</title>
        <link href=\"https://fidgetcube.dev/index.php?page=post&amp;name=" . $row["name"] . "\" rel=\"alternate\" type=\"text/html\"/>
        <published>" . date_format($date, "Y-m-d\TH:i:s\Z") . "</published>
        <updated>" . date_format($date, "Y-m-d\TH:i:s\Z") . "</updated>
        <id>https://fidgetcube.dev/index.php?page=post&amp;name=" . $row["name"] . "</id>
        <content type=\"html\">
            " . $Parsedown->text($row["content"]) . "
        </content>
        <summary type=\"html\">
            " . $Parsedown->text($row["headliner"]) . "
        </summary>
        <author>
            <name>Max vonBlankenburg</name>
        </author>";
    foreach($categories as $x => $y) {
        $entry_xml .= "
        <category>" . $y[0] . "</category>";
    }
    $entry_xml .= "
    </entry>";

    $entries[] = $entry_xml;
}

$xmlData = "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<feed xmlns=\"http://www.w3.org/2005/Atom\">
    <title>Fidget-Cube's Security Blog</title>
    <subtitle>Application security research reports and CTF challenge walkthroughs (and maybe some other stuff)</subtitle>
    <link rel=\"self\" href=\"https://fidgetcube.dev/feed.php\" type=\"application/atom+xml\"/>
    <link rel=\"alternate\" href=\"https://fidgetcube.dev\" type=\"text/html\"/>
    <updated>" . date_format($latest_date, "Y-m-d\TH:i:s\Z") . "</updated>
    <author>
        <name>Max vonBlankenburg</name>
    </author>
    <id>https://fidgetcube.dev</id>
    <icon>https://fidgetcube.dev/img/favicon.ico</icon>";

foreach($entries as $x) {
    $xmlData .= "
    " . $x;
}
$xmlData .= "
</feed>";

$xml = simplexml_load_string($xmlData) or die("Error: Cannot load xml object");

header("Cache-Control: public");
header("Content-Description: File Transfer");
header("Content-Disposition: attachment; filename=feed.xml");
header('Content-Type: text/xml');
header("Content-Transfer-Encoding: binary");

print_r($xml->asXML());

?>