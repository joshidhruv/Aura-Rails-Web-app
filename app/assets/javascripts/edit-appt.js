function populateCostFromService(){
    //console.log('populating cost from service');
    var cost = $('#appointment_service_id').find(':selected').attr('data-price');
    $('#appointment_cost').val(cost);
    $('#cost_display').text("$"+Math.round(cost));
}

$(document).ready(function(){
    $('#newGuestCheck').on('click',function(){
        if($(this).is(':checked')){
            // show new guest subform, disable dropdown
            $('#appointment_guest_id').attr('disabled','disabled');
            $('#showNewGuest').removeClass('hide').find('input').removeAttr('disabled');
        } else {
            // hide new guest subform, enable dropdown
            $('#appointment_guest_id').removeAttr('disabled');
            $('#showNewGuest').addClass('hide').find('input').attr('disabled','disabled');

        }
    });

    $('.datepicker-new-appointment').datetimepicker();

    // populate cost at page load if service is set
    if($('#appointment_service_id').val() != ""){
        populateCostFromService();
    }
    // populate cost when service changes
    $('#appointment_service_id').on('change',function(){
        console.log('service changed');
        populateCostFromService();
    });

});
