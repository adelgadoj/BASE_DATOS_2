<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>LABORATORIO 4</title>    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>

    <link rel="stylesheet" href="estilos.css" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet"/>
    <script>
         function limpiar_contenido() {
             document.getElementById("nombre").value = "vacio";
             document.getElementById("apellidos").value = "vacio";
             document.getElementById("btn_masculino").checked = false;
             document.getElementById("btn_femenino").checked = false;
             document.getElementById("email").value = "vacio";
             document.getElementById("direccion").value = "vacio";
             document.getElementById("lista_ciudades").value = 0;
             document.getElementById("requerimiento").value = "vacio";
             return false;
         }

         function validar_contenido() {
             let nombre = document.getElementById("nombre").value;
             if (nombre.length == 0 || !/^[a-zA-Z]+$/.test(nombre)) {
                 alert("Error en nombre");
                 return false;
             }
             let apellidos = document.getElementById("apellidos").value;
             if (apellidos.length == 0 || !/^[a-zA-Z]+\s[a-zA-Z]+$/.test(apellidos)) {
                 alert("Error en apellidos");
                 return false;
             }
             let btn_masculino = document.getElementById("btn_masculino").checked;
             let btn_femenino = document.getElementById("btn_femenino").checked;
             if (btn_masculino == false && btn_femenino == false) {
                 alert("Sexo no indicado");
                 return false;
             }

             let email = document.getElementById("email").value;
             if (email.length == 0 || !/^[a-zA-Z0-9]+@unsa.edu.pe$/.test(email)) {
                 alert("Email Incorrecto");
                 return false;
             }

             let ciudad = document.getElementById("lista_ciudades").value;
             if (ciudad == 0) {
                 alert("Seleccionar una ciudad");
                 return false;
             }
             let fecha = document.getElementById("form1").innerHTML = Date();
             alert("Registrado a las: " + fecha);
             window.location.href = "index.aspx";
         }
    </script>
    
</head>
<body>
    <h1>Registro de Alumnos:</h1>
    <div class="cont_form">
        <form id="form1" runat="server" method="post"> 
            <div class="input-group mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" id="nombre"  class="form-control rounded"/><br/>
            </div>
            
            <div class="input-group mb-3">
                <label for="apellidos" class="form-label">Apellidos:</label>
                <input type="text" id="apellidos"  class="form-control rounded"/><br/>
            </div>
        
            <div class="input-group mb-3 ">
            <label for="sexo" class="form-label">Sexo:</label>
            <input type="radio" id="btn_masculino"/>
            <label for="btn_masculino" class="form-check-label" >&nbspMasculino</label>
            <input type="radio" id="btn_femenino"/>
            <label for="btn_femenino" class="form-check-label" >&nbspFemenino</label>
            </div>

            <div class="input-group mb-3">
                <label for="email" class="form-label">Email:</label>
                <span class="input-group-text rounded" id="basic-addon1">@</span>
                <input type="text" id="email" class="form-control rounded"  /><br/>
            </div>
            <div class="input-group mb-3">
                <label for="direccion" class="form-label">Direccion:</label>
                <input type="text" id="direccion"  class="form-control rounded"/> 

                <label for="lista_ciudades" class="form-label">&nbspCiudad:</label>
                <select id="lista_ciudades" class="form-select" aria-label="Default select example">
                    <option selected="">Selecciona Opcion</option>
                    <option value="Apurimac">Apurimac</option>
                    <option value="Arequipa">Arequipa</option>
                    <option value="Lima">Lima</option>
                    <option value="Cusco">Cusco</option>
                </select>
            </div>
            <div class="input-group mb-3"> 
               <textarea id="requerimiento" cols="60" rows="8" placeholder="Requerimiento" class="form-control rounded"></textarea><br/>
            </div>
            <div class="btn_pie">
                <asp:Button ID="Button1" class="btn btn-warning" runat="server" Text="Limpiar" OnClientClick="return limpiar_contenido();" />
                <asp:Button ID="Button2" class="btn btn-success" runat="server" OnClientClick="return validar_contenido();" text="Enviar"/>
            </div>
        </form>
    </div>
</body>
</html>
