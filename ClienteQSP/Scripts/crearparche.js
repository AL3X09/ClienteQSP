$(document).ready(function () {

    // Initialize collapse button
    $("#button-collapse").sideNav();

    //inicializo modals en cascada
    $("#modalCarga").modal();
    $('#modalPreloader').modal();
    $('#modalFaltanArchivosaCargar').modal();
    $('#modalResidenciaUsuarios').modal();

    //inicializo selects
    $("select").material_select();
    $("select[required]").css({
        display: "block",
        height: 0,
        padding: 0,
        width: 0
    });

    
    //FUNCIONES ANONIMAS 

   
    //ESCUCHO SUBMIT DE FORMULARIO

    $('#formulariocargaarchivo').ajaxForm({
        type: "POST",
        url: "/Home/SubirRIPS",
        beforeSend: function () {
            swal({
                title: 'Validando',
                text: 'Espere por favor no cierre la ventana',
                //v.type,
                timer: 5000,
                onOpen: function () {
                    swal.showLoading()
                }
            })

        },
        success: function (data) {
            $.each(data, function (i, v) {

                swal(
                    'Titulo',
                    v.value,
                    v.type,
                )
            });

        },
        error: function (xhr, textStatus, errorThrown) {
            alert('error en carga-' + xhr);
            errorThrown.preventDefault();
            return false;
        }
    });

});

