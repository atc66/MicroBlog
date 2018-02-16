
var username = document.querySelector(".username");
var password = document.querySelector(".password");
var signup = document.querySelector(".signUp");
var form = document.querySelector(".signupForm");



function validatePassword() {
    console.log("This ran....");
    if(/\d/.test(password.value)){
        form.submit();
    }else {
        password.value = "";
        password.placeholder = "Password"
        var para = document.createElement("p");
        var node = document.createTextNode("Password must include a number.");
        para.appendChild(node);
        document.body.appendChild(para);
    }
    return false;
}