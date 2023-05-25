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
        <?php include "../modules/header.html"?>
        <div class="blog_post">
        <h1 id="provably-secure-2">Provably Secure 2</h1>
            <h2 id="now-with-less-cheese-still-pretty-simple-though-nc-mc-ax-31497-">Now with less cheese! Still pretty simple though. <code>nc mc.ax 31497</code></h2>
            <blockquote>
            <p>category: Crypto<br/>author: jyu<br/>solves: 155<br/>points: 117<br/>challenge file(s): <a href="https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2/server.py">server.py</a><br/>solution file(s): <a href="https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2/client.py">client.py</a><br/>original writeup: <a href="https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2">https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2</a></p>
            </blockquote>
            <p>This server is basically a simulation of the IND-CCA2 game testing a custom cryptographic system. The game is described in detail here <a href="https://en.wikipedia.org/wiki/Ciphertext_indistinguishability">https://en.wikipedia.org/wiki/Ciphertext_indistinguishability</a>.  </p>
            <p>The server makes 128 passes, generating a random bit (0 or 1) each pass. Our goal is to call a &quot;Solve&quot; function, and correctly &quot;guess&quot; the bit 128 times, at which point a flag is printed. In addition, the server also provides &quot;Query Encryption&quot; and &quot;Query Decryption&quot; functions.  </p>
            <p>The &quot;Query Encryption&quot; Function asks for 2 messages to encrypt. If the random bit is 0 it encrypts the first one and returns the ciphertext, and if the bit is 1 it encrypts the second. Unfortunately, we are unable to predict this bit using encryption alone, since this cryptosystem is IND-CPA secured. That is, when the cryptosystem is given the same message multiple times, it will encrypt it differently every time. We cannot simply work backwards by comparing ciphertext with their respective plaintext.  </p>
            <p>The &quot;Query Decryption&quot; Function takes an encrypted message and decrypts it. Unlike in Provably Secure (original), we can&#39;t simply query decryption on ciphertext we just encrypted, which would immediately tell us what message produced the ciphertext. The function checks our input to make sure it doesn&#39;t match past encryption queries.  </p>
            <p>So we can&#39;t cheese this game. We have to prove that this cryptosystem is not IND-CCA2 secured somehow.  </p>
            <p>The encryption process uses 2 RSA public/private keys (r0, r1), and goes something like this:  </p>
            <p><code>ciphertext = r0-public-key(random_data) + r1-public-key(plaintext (+) random_data)</code>  </p>
            <p>And the decryption process (with ciphertext split in half):  </p>
            <p><code>plaintext = r0-private-key(ciphertext0) (+) r1-private-key(ciphertext1)</code>  </p>
            <p>This operation works because of properties of the XOR ((+)) operation. Namely, if a (+) b = c, then c (+) b = a and c (+) a = b. We can actually use this property to our advantage.  </p>
            <p>Let&#39;s make 2 encryption queries. For the first, we&#39;ll make m0 00000000000000000000000000000000 for simplicity, and m1 ffffffffffffffffffffffffffffffff for fun.  </p>
            <p><code>m0 (16 byte hexstring): 00000000000000000000000000000000</code><br/>
            <code>m1 (16 byte hexstring): ffffffffffffffffffffffffffffffff</code><br/>
            <code>298c7e2c...</code>  </p>
            <p>For the second, we&#39;ll make both messages the same (also 00000000000000000000000000000000 for simplicity).  </p>
            <p><code>m0 (16 byte hexstring): 00000000000000000000000000000000</code><br/>
            <code>m1 (16 byte hexstring): 00000000000000000000000000000000</code><br/>
            <code>7f5b2a85...</code></p>
            <p>From what we know about the encryption process, both of these outputs are a combination of 2 ciphertexts, I&#39;ll name them ct0_a and ct1_a from our first query, and ct0_b and ct1_b from our second. For the rest of this proof, &quot;a&quot; will denote data from our first encryption query, and &quot;b&quot; will denote the second.  </p>
            <p>Since these ciphertexts are encrypted and decrypted separately, we can mix them around. What if we were to pair ct0_a with ct1_b, and ct0_b with ct1_a?  </p>
            <p><code>r0-private-key(ct0_a) (+) r1-private-key(ct1_b) = (random_data_a) (+) (plaintext_b (+) random_data_b)</code>  </p>
            <p><code>r0-private-key(ct0_b) (+) r1-private-key(ct1_a) = (random_data_b) (+) (plaintext_a (+) random data_a)</code>  </p>
            <p>When we made the second query before, we made sure that plaintext_b was 00000000000000000000000000000000 for a reason. Any bit XOR-ed with 0 is itself, the identity property. For this reason, we can remove plaintext_b from the expression, as it does not affect the final XOR product.  </p>
            <p><code>random_data_a (+) random_data_b</code>  </p>
            <p><code>random_data_b (+) plaintext_a (+) random data_a</code>  </p>
            <p>Using the other property of XOR we know about, we can simply XOR these two values together, and the result will be plaintext_a.  </p>
            <p><code>random_data_a (+) random_data_b (+) random_data_b (+) plaintext_a (+) random data_a = plaintext_a</code>  </p>
            <p>And we&#39;ve successfully recovered plaintext from a ciphertext message! If plaintext_a is 00000000000000000000000000000000, we know m0 was used to make the ciphertext, meaning the random bit is 0. If plaintext_a is ffffffffffffffffffffffffffffffff, the inverse is true, and the random bit is 1. </p>
        </div>
    </body>
</html>