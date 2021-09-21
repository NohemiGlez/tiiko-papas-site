$(document).ready(function(){
    $('#search-link').click(function(){
        $('#search-autocomplete-input').focus();
    });

    $('.dropdown-trigger').dropdown();

    $('.select-lang').click(function(e){
        const selectedOption = e.target.getAttribute("id");
        window.location.replace('?lang=' + selectedOption);
    });

    $('.sidenav').sidenav();

});