if(document.cookie){
    var cookie_password = document.cookie.split("=");
    console.log(cookie_password);
    document.getElementById("password").value = cookie_password[1];
}

function savePassword(){
    console.log("savePassword");
    if(document.getElementById("exampleCheck1").checked){
        var password = document.getElementById("password").value;
        document.cookie = "password=" + password;
        console.log(document.cookie);
    }
    return true;
}

