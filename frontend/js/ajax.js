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
