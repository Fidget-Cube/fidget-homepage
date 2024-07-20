# JavaScript is a Joke

He did it! He said the line!

(this is not a serious blog post if you couldn't tell, adult language ahead)

So anyway, it's a month in at my new job at Semgrep. Really fun so far. I get to research new CVEs that come out in open source software, which means I get to see all the new major disasters firsthand. On rare occasions you get to see the sophisticated new hacks against major libraries or whatever, but most of it is just access mismanagement, "isadmin" cookies, awful vuln descriptions and, as you may have guessed, JavaScript acting as the one thing standing between humanity and a prosperous world society. I'm not here to write a cool, detailed description of a CTF challenge solution or sophisticated hack. No, today is all just complaints.

At some point I will do a post outlining some of the most god-awful CVE disclosures I have had the privilege to discover, but we'll save that for later. I have faith in the security research community bringing us quality content to laugh at in the coming months.

So I have three things to bring up. The first is a popular weakness that was discovered in the way JavaScript handles objects: Prototype Pollution. The first of these was disclosed in 2019, and since then researchers have been variant hunting the shit out of it. It's a very fickle vuln, just as likely to be harmless as it is to allow code execution privileges. I'll do my best to explain how it works.

First thing to know is that every JavaScript object `{}` has a prototype `{}.__proto__`. This defines the attributes (member functions and variables) the object is created with. Prototypes are inheritable, so if you define a "child" object based off a "parent" object, the child prototype contains all the attributes of the parent prototype as well. Also, every object is inherited from the default object `{}`. You can probably see where this is going.

If we modify the prototype of the default object and add our own attributes (for example: `{}.__proto__.something = "foobar"`), those attributes will **automatically be added to any existing objects *and* any new objects!** Of course JavaScript lets you do this, this is totally fine! Except that this means, of course, **anyone with access to the default object prototype can add whatever they want to every single object in the code**.

Of course, if you code doesn't make assumptions about what attributes are in what objects, you should be fine. But if it does, congratulations, you've given code editing rights to Anonymous.

The second thing I have to bring up is more of a cool fact! A cool fact that could totally crash your Javascript code without you even knowing it existed.

`{ toString: '' }` is impossible to automatically convert to a primitive! Why is this? [Type coercion](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#type_coercion).

In order to automatically convert an object (like `{}`) to a primitive value (like `3` or `"foobar"`), JavaScript tries 3 things:

1. calling the object's `[@@toPrimitive]()` function, which `{ toString: '' }` does not have.
2. calling `{ toString: '' }.valueOf()`, which returns {} itself, which is not a primitive so it's ignored.
3. calling `{ toString: '' }.toString()`, which *would* return `"[object Object]"`, but we overwrote the `toString` method with an empty string instead, so it's no longer a function.

If all 3 attempts fail, a TypeError is thrown! This can lead to some cute lil [DoS vulns](https://github.com/advisories/GHSA-hhr9-rh25-hvf9).

Now for the final thing, and this one takes the cake. Have any of y'all used [vm2](https://github.com/patriksimek/vm2) before? It's a project attempting to take Node.js' built-in `vm` module and make it secure! Mainly by attempting to patch every single hole imaginable, and there were a lot. Admittedly, their tenacity and determination was commendable, but ultimately, JavaScript won. I didn't work on the project, so I don't know all the details, but from a little bit of research it appears that Node was intercepting calls inside the vm before they could be proxied or overwritten. That sounds to me like patching every hole in a bucket only for the bucket to tip over.

So vm2 hit a dead end, what's the big deal? Well, the big deal is that *everyone uses vm2*. If you're looking to easily secure user-run code, vm2 is the go-to solution. Now that it's gone, there is only *one* project *in existence* focused on secure virtualization of JavaScript. If isolated-vm goes under, we're fucking toast.

There's also a more in-depth description of that story over on the Semgrep blog, if you want to learn more. I would link it, but that would be a little masturbatory, plus no one reads this blog anyway.

Oh, I got one more as a bonus for reading this far. Friendly reminder for how much garbage there is on npm: https://www.npmjs.com/package/npm-ghost-726?activeTab=code

Some goobers wrote a script that literally uploads thousands of copies of the same package to npm. Apparently the goal was to inflate the dependent count on their main node packages, so they would have more credibility and "clout". It's not really harmful, just false advertising I guess. npm is a minefield when it comes to broken, malicous, or downright weird packages.

Anyway, that's all I have for today. Maybe now is a good time to admit that I've been writing it Javascript my entire life up until now. I feel like that should be correct. If the language isn't strongly typed, why should its name be?

<!-- Categories:JavaScript -->
