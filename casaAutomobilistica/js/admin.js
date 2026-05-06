const { jsx } = require("react/jsx-runtime");

document.addEventListener("DOMContentLoaded", controllaAccesso);
async function controllaAccesso() {
    try {
        const response = await fetch("api/check_session.php");
        const data = await response.json();

        if (data.logged === false) {
            window.location.replace("login.html"); 
        } 
        else if (data.ruolo !== "admin") {
            alert("Accesso negato: Solo gli amministratori possono vedere questa pagina.");
            window.location.replace("index.html"); 
        }
    } catch (errore) {
        console.error("Errore sessione:", errore);
    }
}

let btnAggiungi = document.getElementById("btnAggiungi");
btnAggiungi.addEventListener("click", aggiungiElemento);

async function aggiungiElemento() {
    let tipo = document.getElementById("tipoElemento").value;
    let codice = document.getElementById("codiceElemento").value;
    let descrizione = document.getElementById("descrizioneElemento").value;
    let costo = document.getElementById("costoElemento").value;

    if(codice === "" || descrizione === "" || costo === "") {
        alert("compila tutti i campi");
        return;
    }

    // chiamata all'api
    const response = await fetch("api/aggiungi_elemento.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            tipo: tipo,
            codice: codice,
            descrizione: descrizione,
            costo: costo
        })
    });

    const bodyJson = await response.json();

    if (bodyJson.success) {
        alert("elemento aggiunto");
    } else {
        alert("errore: " + bodyJson.msg);
    }
}


let btnRimuovi = document.getElementById("btnRimuovi");
btnAggiungi.addEventListener("click", rimuoviElemento);

async function aggiungiElemento() {
    let tipo = document.getElementById("tipoElemento").value;
    let codice = document.getElementById("codiceElemento").value;

    if(codice === "" || descrizione === "" || costo === "") {
        alert("compila tutti i campi");
        return;
    }
    
    // chiamata all'api
    const response = await fetch("api/rimuovi_elemento.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            tipo: tipo,
            codice: codice,

        })
    });

    const bodyJson = await response.json();

    if (bodyJson.success) {
        alert("elemento rimosso");
    } else {
        alert("errore: " + bodyJson.msg);
    }
}

let btnAssocia = document.getElementById("btnAssocia");

if(btnAssocia){
    btnAssocia.addEventListener("click", associaElemento);
}


async function associaElemento() {
    let tipo = document.getElementById("tipoAssociazione").value;
    let codiceOfficina = document.getElementById("codiceOff").value;
    let codiceElemento = document.getElementById("codiceElemAssocia").value;
    let quantita = document.getElementById("quantitaElem").value;

    if (codiceOfficina === "" || codiceElemento === "") {
        alert("Inserisci il codice officina e il codice elemento");
        return;
    }

    if (tipo !== "servizio" && quantita === "") {
        alert("Per accessori e ricambi devi inserire la quantità");
        return;
    }

    const response = await fetch("api/associa_elemento.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            tipo: tipo,
            codiceOfficina: codiceOfficina,
            codiceElemento: codiceElemento,
            quantita: quantita
        })
    });

    const bodyJson = await response.json();

    if (bodyJson.success) {
        alert("Associazione creata con successo!");
        document.getElementById("codiceOff").value = "";
        document.getElementById("codiceElemAssocia").value = "";
        document.getElementById("quantitaElem").value = "";
    } else {
        alert("Errore: " + bodyJson.msg);
    }
}