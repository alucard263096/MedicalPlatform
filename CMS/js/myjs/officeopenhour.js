var myjs_detailPageLoad = function () {

   hideMeetingDays();
   $("#content_office_id").parent().parent().parent().append("<div class=\"form-group col-md-12\"><div class=\"col-md-2\"></div><div class=\"col-md-10\"><div id='calendar'></div></div></div>");
   $('#calendar').fullCalendar({
       header:false,
       defaultView: "agendaWeek",
       allDaySlot: false,
       selectable: true,
       selectHelper: true,
       select: function(start, end, jsEvent, view) {
       },
       year: 2015,
       month: 4,
       date: 3,
       columnFormat: { week: 'ddd', },
       editable:true
   });
};

var hideMeetingDays = function () {
    $(".flist_all").parent().parent().hide();
};
