/* global baseapp */
if (typeof baseapp.timeEntrySearch === "undefined") {
  baseapp.timeEntrySearch = (function() {

    var moveDate = function(value) {
      var curDate = new Date($("#title-date").data("date"));
      curDate.setDate(curDate.getDate() + value);
      return curDate;
    };

    var updatePage = function(date) {
      window.location.href = "./time_entries?performed_at=" + date.toISOString(); //date.getFullYear() + date.getMonth() + date.getDay();
    };
    var ready = function() {
      if (!$("#title-date").length) {
      return;
      }

      $("#btn-prev").click( function() {
        var newDate = moveDate(-1);
        updatePage(newDate);
      });

      $("#btn-next").click( function() {
        var newDate = moveDate(1);
        updatePage(newDate);
      });

      $("#btn-today").click( function() {
        var newDate = new Date();
        updatePage(newDate);
      });



    };



    $(document).ready(ready);

    return {};

  })();
}
