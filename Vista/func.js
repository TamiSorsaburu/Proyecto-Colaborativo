function login(){
    let user = document.getElementById('usuario').value;
    let pass = document.getElementById('contraseña').value;
    
    if(user == "Facu@gmail.com" && pass == "1234")
    {
        window.location = "des.html";
    }

    else
    {
        alert("Datos incorrectos");
    }

    }