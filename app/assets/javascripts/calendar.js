$(document).ready(function() {

    var calendar, d, date, m, y;

    $("#datepicker").datepicker();

//    $('#datepicker').datepicker({
//        dateFormat: 'DD, d MM, yy',
//        onSelect: function(dateText,dp){
//            switchView('agendaDay');
//            $j('#calendar').fullCalendar('gotoDate',new Date(Date.parse(dateText)));
//            $j('#calendar').fullCalendar('changeView','agendaDay');
//        }
//    });
//
//    function switchView(view) {
//        $('#calendar').fullCalendar('changeView', view);
//        loadEvents();
//    };


  //    date store today date.
  //    d store today date.
  //    m store current month.
  //    y store current year.

    date = new Date();
    d = date.getDate();
    m = date.getMonth();
    y = date.getFullYear();

//  Initialize fullCalendar and store into variable.
    calendar = $("#calendar").fullCalendar({
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

    //  when user select timeslot this option code will execute.
    //  It has three arguments. Start,end and allDay.
    //  Start means starting time of event.
    //  End means ending time of event.
//    //  allDay means if events is for entire day or not.
//        select: function(start, end, allDay) {
//            var title;
//            title = prompt("Event Title:");
//            if (title) {
//                calendar.fullCalendar("renderEvent", {
//                    title: title,
//                    start: start,
//                    end: end,
//                    allDay: allDay
//                }, true);
//            }
//            calendar.fullCalendar("unselect");
//        },

//
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
            $('#createEventModal').modal('show');
        },

        editable: true

//  sample json events
//        events: [
//            {
//                title: "All Day Event",
//                start: new Date(y, m, 1)
//            }, {
//                title: "Long Event",
//                start: new Date(y, m, d - 5),
//                end: new Date(y, m, d - 2)
//            }, {
//                id: 999,
//                title: "Repeating Event",
//                start: new Date(y, m, d - 3, 16, 0),
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
        $("#createEventModal").modal('hide');
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