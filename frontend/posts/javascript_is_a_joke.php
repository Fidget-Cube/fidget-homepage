<!DOCTYPE html>
<html>
    <head>
        <title>&#387;u&#7433;&#670;&#596;&#592;H &#477;qn&#390;-&#647;&#477;&#387;p&#7433;&#8498;</title>
        <meta name="description" content="JavaScript is a Joke">
        <?php include "../modules/head.html"?>
    </head>
    <body>
        <?php include "../modules/header.html"?>
        <div class="body">
        <div class="blog_post">
            <h1 id="javascript-is-a-joke">JavaScript is a Joke</h1>
            <p>He did it! He said the line!</p>
            <p>(this is not a serious blog post if you couldn&#x2019;t tell, adult language ahead)</p>
            <p>So anyway, it&#x2019;s a month in at my new job at Semgrep. Really fun so far. I get to research new CVEs that come out in open source software, which means I get to see all the new major disasters firsthand. On rare occasions you get to see the sophisticated new hacks against major libraries or whatever, but most of it is just access mismanagement, &#x201C;isadmin&#x201D; cookies, awful vuln descriptions and, as you may have guessed, JavaScript acting as the one thing standing between humanity and a prosperous world society. I&#x2019;m not here to write a cool, detailed description of a CTF challenge solution or sophisticated hack. No, today is all just complaints.</p>
            <p>At some point I will do a post outlining some of the most god-awful CVE disclosures I have had the privilege to discover, but we&#x2019;ll save that for later. I have faith in the security research community bringing us quality content to laugh at in the coming months.</p>
            <p>So I have three things to bring up. The first is a popular weakness that was discovered in the way JavaScript handles objects: Prototype Pollution. The first of these was disclosed in 2019, and since then researchers have been variant hunting the shit out of it. It&#x2019;s a very fickle vuln, just as likely to be harmless as it is to allow code execution privileges. I&#x2019;ll do my best to explain how it works.</p>
            <p>First thing to know is that every JavaScript object <code>{}</code> has a prototype <code>{}.__proto__</code>. This defines the attributes (member functions and variables) the object is created with. Prototypes are inheritable, so if you define a &#x201C;child&#x201D; object based off a &#x201C;parent&#x201D; object, the child prototype contains all the attributes of the parent prototype as well. Also, every object is inherited from the default object <code>{}</code>. You can probably see where this is going.</p>
            <p>If we modify the prototype of the default object and add our own attributes (for example: <code>{}.__proto__.something = "foobar"</code>), those attributes will <strong>automatically be added to any existing objects <em>and</em> any new objects!</strong> Of course JavaScript lets you do this, this is totally fine! Except that this means, of course, <strong>anyone with access to the default object prototype can add whatever they want to every single object in the code</strong>.</p>
            <p>Of course, if you code doesn&#x2019;t make assumptions about what attributes are in what objects, you should be fine. But if it does, congratulations, you&#x2019;ve given code editing rights to Anonymous.</p>
            <p>The second thing I have to bring up is more of a cool fact! A cool fact that could totally crash your Javascript code without you even knowing it existed.</p>
            <p><code>{ toString: '' }</code> is impossible to automatically convert to a primitive! Why is this? <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#type_coercion">Type coercion</a>.</p>
            <p>In order to automatically convert an object (like <code>{}</code>) to a primitive value (like <code>3</code> or <code>"foobar"</code>), JavaScript tries 3 things:</p>
            <ol type="1" class="p">
            <li><p>calling the object&#x2019;s <code>[@@toPrimitive]()</code> function, which <code>{ toString: '' }</code> does not have.</p></li>
            <li><p>calling <code>{ toString: '' }.valueOf()</code>, which returns {} itself, which is not a primitive so it&#x2019;s ignored.</p></li>
            <li><p>calling <code>{ toString: '' }.toString()</code>, which <em>would</em> return <code>"[object Object]"</code>, but we overwrote the <code>toString</code> method with an empty string instead, so it&#x2019;s no longer a function.</p></li>
            </ol>
            <p>If all 3 attempts fail, a TypeError is thrown! This can lead to some cute lil <a href="https://github.com/advisories/GHSA-hhr9-rh25-hvf9">DoS vulns</a>.</p>
            <p>Now for the final thing, and this one takes the cake. Have any of y&#x2019;all used <a href="https://github.com/patriksimek/vm2">vm2</a> before? It&#x2019;s a project attempting to take Node.js&#x2019; built-in <code>vm</code> module and make it secure! Mainly by attempting to patch every single hole imaginable, and there were a lot. Admittedly, their tenacity and determination was commendable, but ultimately, JavaScript won. I didn&#x2019;t work on the project, so I don&#x2019;t know all the details, but from a little bit of research it appears that Node was intercepting calls inside the vm before they could be proxied or overwritten. That sounds to me like patching every hole in a bucket only for the bucket to tip over.</p>
            <p>So vm2 hit a dead end, what&#x2019;s the big deal? Well, the big deal is that <em>everyone uses vm2</em>. If you&#x2019;re looking to easily secure user-run code, vm2 is the go-to solution. Now that it&#x2019;s gone, there is only <em>one</em> project <em>in existence</em> focused on secure virtualization of JavaScript. If isolated-vm goes under, we&#x2019;re fucking toast.</p>
            <p>There&#x2019;s also a more in-depth description of that story over on the Semgrep blog, if you want to learn more. I would link it, but that would be a little masturbatory, plus no one reads this blog anyway.</p>
            <p>Oh, I got one more as a bonus for reading this far. Friendly reminder for how much garbage there is on npm: https://www.npmjs.com/package/npm-ghost-726?activeTab=code</p>
            <p>Some goobers wrote a script that literally uploads thousands of copies of the same package to npm. Apparently the goal was to inflate the dependent count on their main node packages, so they would have more credibility and &#x201C;clout&#x201D;. It&#x2019;s not really harmful, just false advertising I guess. npm is a minefield when it comes to broken, malicous, or downright weird packages.</p>
            <p>Anyway, that&#x2019;s all I have for today. Maybe now is a good time to admit that I&#x2019;ve been writing it Javascript my entire life up until now. I feel like that should be correct. If the language isn&#x2019;t strongly typed, why should its name be?</p>
        </div>
        </div>
    </body>
</html>
