$(document).ready(function () {
    //alert("login");
    $('#modalLRForm').modal("show");
});

// función usada alertas
function ShowAlert(tipo, msj) {
    
        var toast ="iziToast."+tipo+"({"+
            "timeout: 20000,"+
            "title: '" + tipo.toUpperCase() +"'," +
            "message: '"+msj+"'," +
            "position: 'topCenter'," +
            "})";
        
        eval(toast);
        
        }