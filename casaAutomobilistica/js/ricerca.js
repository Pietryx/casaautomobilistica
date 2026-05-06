let btnCerca = document.getElementById("btnCerca");
btnCerca.addEventListener("click", cercaOfficine);

async function cercaOfficine() {
    let servizio = document.getElementById("codiceServizio").value;
    let pezzo = document.getElementById("codicePezzo").value;
    let accessorio = document.getElementById("codiceAccessorio").value;

    const response = await fetch("api/cerca_officine.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            servizio: servizio, 
            pezzo: pezzo, 
            accessorio: accessorio
        })
    });

    const bodyJson = await response.json();
    let divRisultati = document.getElementById("risultati");

    if (bodyJson.success) {
        let officine = bodyJson.data; // array che manderà il php
        if(officine.length === 0){
            divRisultati.innerHTML = "<p>Nessuna officina compatibile trovata.</p>";
        } else {
            for(let i = 0; i < officine.length; i++){
                let off = officine[i];
                divRisultati.innerHTML += "<p>" + off.Denominazione + " - indirizzo: " + off.Indirizzo + "</p>";
            }
        }
    } else {
        alert(bodyJson.msg);
    }
}