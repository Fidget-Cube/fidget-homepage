<!DOCTYPE html>
<html>
    <head>
        <title>&#387;u&#7433;&#670;&#596;&#592;H &#477;qn&#390;-&#647;&#477;&#387;p&#7433;&#8498;</title>
        <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
        <meta name="description" content="Fidget-Cube Homepage">
        <link rel="stylesheet" href="/css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="module" src="https://md-block.verou.me/md-block.js"></script>
    </head>
    <body>
        <?php
            $headerFile = fopen("../modules/header.html", "r") or die("<p>ERROR: Could not display header</p>");
            echo fread($headerFile, filesize("../modules/header.html"));
            fclose($headerFile);
        ?>
        <span>
            <div class="feed">
                <h2 class="category_title">
                    Category: Cryptography
                </h2>
                <ul>
                    <li>
                        <h2 id="title">
                            <a href="/posts/provably_secure_2.html">DiceCTF 2023 Writeups: Provably Secure 2 (Medium crypto challenge using RSA)</a>
                        </h2>
                        <p id="description">This server is basically a simulation of the IND-CCA2 game testing a custom cryptographic system. The game is described in detail here <a href="https://en.wikipedia.org/wiki/Ciphertext_indistinguishability">https://en.wikipedia.org/wiki/Ciphertext_indistinguishability</a>.</p>
                        <p id="description">The server makes 128 passes, generating a random bit (0 or 1) each pass. Our goal is to call a &quot;Solve&quot; function, and correctly &quot;guess&quot; the bit 128 times, at which point a flag is printed. In addition, the server also provides &quot;Query Encryption&quot; and &quot;Query Decryption&quot; functions.</p>
                        <span id="category">
                            <time datetime="2023-02-08T00:00:00+00:00">Feb 8 2023 -- </time>
                            <a id="category" href="/categories/cryptography.html">Cryptography</a>
                        </span>
                    </li>
                </ul>
            </div>
            <div class="sidebar">
                <h2 id="title">
                    Categories
                </h2>
                <ul id="description">
                    <li>
                        <a href="/categories/cryptography.html">Cryptography</a>
                    </li>
                </ul>
            </div>
        </span>
    </body>
</html>