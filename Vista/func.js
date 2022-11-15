function login(){
    var user = document.getElementById('usuario').value;
    var pass = document.getElementById('pass').value;
    
    if(user == "Facu@gmail.com" && pass == "1234")
    {
        window.location = "bienvenido.html";
    }

    else
    {
        alert("Datos incorrectos");
    }

    }