/* global metanoia */
if (typeof metanoia.clientsearch === "undefined") {
  metanoia.clientsearch = (function() {
    "use strict";
    var resultsDivId = "#results";

    var showTable = function() {
      $("#error").hide();
      $("#tablediv").show();
      $("#processing").hide();
    };

    var showError = function() {
      $("#error").show();
      $("#tablediv").hide();
      $("#processing").hide();
    };

    var showProcessing = function() {
      $("#error").hide();
      $("#tablediv").hide();
      $("#processing").show();
    };

    var ready = function() {

      if (!$("#tablediv").length) {
        return;
      }

      metanoia.data_tables.setupTable(resultsDivId, [
        { data: "first_name" },
        { data: "last_name" },
        { data: "city" },
        { data: "state" },
        { data: "facility_name" }
        ]
        );

      showTable();

      $("#submitSearch").on("click", function(e){
        e.preventDefault();

        showProcessing();
        var first_name = $("#client_search_first_name").val();
        var last_name = $("#client_search_last_name").val();
        var city = $("#client_search_city").val();
        var state = $("#client_search_state").val();
        var facility_name = $("#client_search_facility_name").val();
        var accepts = $("#as_csv").prop("checked") ? "csv" : "json";
        if (accepts === "csv") {
         window.location.href = "./find.csv?first=" + first_name + "&last=" + last_name + "&city=" + city + "&state=" + state + "&facility=" + facility;
         showTable();
        } else {
        $.ajax({
          type: "GET",
          url: "/client_search/find.json",
          dataType: accepts,
          data: { first_name: first_name, last_name: last_name, city: city, state: state, facility_name: facility_name },
          success: function(data) {
            metanoia.data_tables.updateData(resultsDivId, data.results);
            showTable();
          },
          error: function(){
            showError();
          }
        });
        }

      });

    };

    $(document).ready(ready);

    return {};
  })();
}
