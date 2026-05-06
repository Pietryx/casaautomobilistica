let registerBtn = document.getElementById("registerButton");
registerBtn.addEventListener("click", register);


async function register(){
    let username = document.getElementById("usernameRegister").value;
    let email = document.getElementById("emailRegister").value;
    let password = document.getElementById("passwordRegister").value;
    if (username != "" && password != "" && email != ""){
            const response = await fetch("api/register.php", {
            method: "POST",
            headers: {
                "Content-Type":"application/json"
            },
            body: JSON.stringify({username, email, password})
        });

        const bodyJson = await response.json();
        if(bodyJson.success){
            alert("Registrazione completata!");
            window.location.href = "login.html"; 
        }else{
            alert(bodyJson.msg);
        }
    }
    else{
        alert("Inserire tutti i dati");
    }
}