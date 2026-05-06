let loginBtn = document.getElementById("loginButton");
loginBtn.addEventListener("click", login);

async function login(){
    let username = document.getElementById("usernameInput").value;
    let password = document.getElementById("passwordInput").value;
    if (username != "" && password != ""){
            const response = await fetch("api/login.php", {
            method: "POST",
            headers: {
                "Content-Type":"application/json"
            },
            body: JSON.stringify({username, password})
        });

        const bodyJson = await response.json();

        if(bodyJson.success){
            alert("Login riuscito");
            window.location.href = "index.html";
        }else{
            alert(bodyJson.msg);
        }
    }
    else{
        alert("inserire i dati");
    }
}