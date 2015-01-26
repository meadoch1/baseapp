/* global baseapp */
if (typeof baseapp.timeEntrySearch === "undefined") {
  baseapp.timeEntrySearch = (function() {

    var moveDate = function(value) {
      var curDate = new Date($("#title-date").data("date"));
      curDate.setDate(curDate.getDate() + value);
      return curDate;
    };

    var updatePage = function(date) {
      window.location.href = "./time_entries?performed_at=" + date.toISOString();
    };

    var updateEntry = function(dialog, id, doStart) {
      var projectId = $("#time_entry_project_id").val();
      var taskId = $("#time_entry_task_id").val();
      var description = $("#time_entry_description").val();
      var accrued = $("#time_entry_accrued_hrs").val();
      var start;
      var url;
      var type;
      var data = {
        time_entry: {
          project_id: projectId,
          task_id: taskId,
          description: description,
          accrued_hrs: accrued,
          set_start: doStart
        }
      };
      if (typeof id === 'undefined'){
        url = "/time_entries";
        type = "POST";

      } else {
        url = "/time_entries/" + id;
        type = "PUT";
      }
      $.ajax({
        url: url,
        type: type,
        success: function() {
          if (typeof dialog !== "undefined") {
            dialog.close();
            window.location.reload();
          };
        },
        data: data
      });
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

      $(".time-entry-start").click( function() {
        var id = $(this).data("time-entry-id");
        updateEntry(undefined, id, true);

      } );

      $(".time-entry-edit").click( function() {
        var id = $(this).data("time-entry-id");
        BootstrapDialog.show({
          title: "Edit Time Entry",
          message: $("<div></div>").load("/time_entries/" + id + "/edit"),
          buttons: [{
            label: "Start Timer",
            cssClass: "btn btn-success",
            action: function(dialog) {
              updateEntry(dialog, id, true);
            }
          }, {
            label: "Save",
            cssClass: "btn btn-default",
            action: function(dialog) {
              updateEntry(dialog, id, false);
            }
          }, {
            label: "Cancel",
            cssClass: "btn btn-default",
            action: function(dialog) {
              dialog.close();
            }

          }]
        });
      });

      $("#btn-new").click( function(e) {
        e.preventDefault();
        BootstrapDialog.show({
          title: "Edit Time Entry",
          message: $("<div></div>").load("/time_entries/new"),
          buttons: [{
            label: "Start Timer",
            cssClass: "btn btn-success",
            action: function(dialog) {
              updateEntry(dialog, undefined, true);
            }
          }, {
            label: "Save",
            cssClass: "btn btn-default",
            action: function(dialog) {
              updateEntry(dialog, id, false);
            }
          }, {
            label: "Cancel",
            cssClass: "btn btn-default",
            action: function(dialog) {
              dialog.close();
            }

          }]
        });
      });



    };



    $(document).ready(ready);

    return {};

  })();
}
