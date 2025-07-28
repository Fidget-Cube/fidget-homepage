// Page loading logic

const pageLookup = {
    'home': '/modules/homepage.php',
    'about': '/modules/about.php',
    'posts': '/modules/directory.php',
    'portfolio': '/modules/portfolio.html',
    'submit': '/modules/submit/submit.html',
    'result': '/modules/submit/result.php',
    'post': '/modules/post.php',
    'category': '/modules/category.php',
    'friends': '/modules/friends.html'
}
const char_allowlist = "\n\r 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.?;:!@#$%^&*()-_=+[]{}`~\/😄😖😵😤🤨🤮🥺🤔🤩"

// Experimental, need some kind of cached data
var factIndex = 0;
var musicIndex = 0;

function loadPage(page, subpage=null, postContent=null) {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = () => {
        document.getElementById("body").innerHTML = xhttp.responseText;
    }
    
    path = '/index.php?page=' + page;
    endpoint = page in pageLookup ? pageLookup[page] : '/';
    if (subpage) {
        path += '&name=' + subpage;
        endpoint += '?name=' + subpage;
    }

    // Hey you! Yes you! This line giving you errors? Email me and say so, please! I don't know if it works for every browser.
    window.history.replaceState({}, '', path);
    if (postContent) {
        xhttp.open("POST", endpoint, true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send(postContent)
    } else {
        xhttp.open("GET", endpoint, true);
        xhttp.send();
    }
}

function loadFact() {
	const xhttp = new XMLHttpRequest();
    xhttp.onload = () => {
        document.getElementById("fact-inner").innerHTML = xhttp.responseText;
    }
    
    xhttp.open("POST", "/modules/rest/facts.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("index=" + String(factIndex))
}

function loadMusic() {
	const xhttp = new XMLHttpRequest();
    xhttp.onload = () => {
    	const response = new DOMParser().parseFromString(xhttp.responseText, "text/html");
    	// We have to be a little more careful with the audio player since its so complex
    	const body = response.getElementsByTagName("p")[0].innerHTML;
    	const link = response.getElementsByTagName("p")[1].innerHTML;
    	const filename = response.getElementsByTagName("p")[2].innerHTML.trim();
    	document.getElementById("music-inner").getElementsByTagName("p")[0].innerHTML = body;
    	document.getElementById("music-inner").getElementsByTagName("p")[1].innerHTML = link;
    	document.getElementById("audioplayer-container").getElementsByTagName("audio")[0].setAttribute("src", "/audio/" + filename);
    }
    
    xhttp.open("POST", "/modules/rest/music.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("index=" + String(musicIndex))
}

function submitButton() {
    const submitText = document.getElementById('submit-text');
    loadPage('result', null, 'value=' + submitText.value);
}

function postComment() {
    const commentText = String(document.getElementById('comment').value);
    const poster = String(document.getElementById('poster').value);
    const full = commentText + poster
    for (x in full) {
        if (!char_allowlist.includes(full[x])) {
            document.getElementById("server_response").innerHTML = "Nice try :). The <>'\" characters are not allowed, and if you want a new emoji added, email me!";
            return 0;
        }
    }
    // document.getElementById("server_response").innerHTML = full;
    loadPage('about', null, 'comment=' + commentText + '&poster=' + poster);
}

function incrementFact() {
	factIndex += 1;
	loadFact();
}

function decrementFact() {
	factIndex -= 1;
	loadFact();
}

function incrementMusic() {
	musicIndex += 1;
	loadMusic();
}

function decrementMusic() {
	musicIndex -= 1;
	loadMusic();
}
