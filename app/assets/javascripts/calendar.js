$(document).ready(function() {

    var calendar, d, date, m, y;

    $('#datepicker').datepicker({
        onSelect: function(dateText,dp) {
            switchView('agendaDay');
            $('#calendar').fullCalendar('gotoDate',new Date(dateText));
        }
    });

    function switchView(view) {
        $('#calendar').fullCalendar('changeView', view);
    }


  //    date store today date.
  //    d store today date.
  //    m store current month.
  //    y store current year.

    date = new Date();
    d = date.getDate();
    m = date.getMonth();
    y = date.getFullYear();

    //updateVisibleStaff();

//  Initialize fullCalendar and store into variable.
    calendar = $("#calendar").fullCalendar({
        eventSources: [
            {
                url: '/account/events',
                data: {
                    // dynamically get staff from show-staff-form
                    staff: function(){
                        return getVisibleStaff();
                    }
                },
                success: function(data, textStatus, jqXHR){
                    //console.log('SUCCESS')
                    //console.log(data)
                },
                //color: 'green',
                textColor: 'white'
            }

            // any other event sources...

        ],


        header: {
            left: "prev,next today",
            center: "title",
            right: "month,agendaWeek,agendaDay"
        },
        defaultView: "agendaWeek",

    //  selectable:true will enable user to select datetime slot
    //  selectHelper will add helpers for selectable.
        selectable: true,
        selectHelper: true,

//        events: {
//            url: 'https://www.google.com/calendar/feeds/aura.planning%40gmail.com/public/basic/'
//        },
//
        select: function(start, end, allDay) {
            endtime = $.fullCalendar.formatDate(end,'h:mm tt');
            starttime = $.fullCalendar.formatDate(start,'ddd, MMM d, h:mm tt');
            var mywhen = starttime + ' - ' + endtime;
            $('#createEventModal #apptStartTime').val(start);
            $('#createEventModal #apptEndTime').val(end);
            $('#createEventModal #apptAllDay').val(allDay);
            $('#createEventModal #when').text(mywhen);
            $('#createEventModal').removeClass('hide').modal('show');
        },

        editable: true//,

//  sample json events
//        events: [
//            {
//                title: "All Day Event",
//                start: new Date(y, m, 14)
//            }, {
//                title: "Long Event",
//                start: new Date(y, m, d +1),
//                end: new Date(y, m, d +3)
//            }, {
//                id: 999,
//                title: "Repeating Event",
//                start: new Date(y, m, d + 1, 16, 0),
//                allDay: false
//            }, {
//                id: 999,
//                title: "Repeating Event",
//                start: new Date(y, m, d + 4, 16, 0),
//                allDay: false
//            }
//        ]
    });

    $('#submitButton').on('click', function(e){
        // We don't want this to act as a link so cancel the link action
        e.preventDefault();

        doSubmit();
    });

    function doSubmit(){
        $("#createEventModal").addClass('hide').modal('hide');
        console.log($('#apptStartTime').val());
        console.log($('#apptEndTime').val());
        console.log($('#apptAllDay').val());
        alert("form submitted");

        $("#calendar").fullCalendar('renderEvent',
            {
                title: $('#patientName').val(),
                start: new Date($('#apptStartTime').val()),
                end: new Date($('#apptEndTime').val()),
                allDay: ($('#apptAllDay').val() == "true")
            },
            true);
    }

    $('.dropdown-toggle').dropdown()
});