// Page loading logic

const pageLookup = {
    'home': '/modules/homepage.php',
    'about': '/modules/about.html',
    'posts': '/modules/directory.php',
    'portfolio': '/modules/portfolio.html',
    'submit': '/modules/submit/submit.html',
    'result': '/modules/submit/result.php',
    'post': '/modules/post.php',
    'category': '/modules/category.php'
}

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
    loadPage('result', 'value=' + submitText.value);
}
