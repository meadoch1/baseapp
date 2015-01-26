/* global baseapp */
if (typeof baseapp.carsearch === "undefined") {
  baseapp.carsearch = (function() {
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

      baseapp.data_tables.setupTable(resultsDivId, [
        { data: "year" },
        { data: "make" },
        { data: "model" }
        ]
        );

      showTable();

      $("#submitSearch").on("click", function(e){
        e.preventDefault();

        showProcessing();
        var year = $("#car_point_year").val();
        var make = $("#car_point_make").val();
        var model = $("#car_point_model").val();
        var accepts = $("#as_csv").prop("checked") ? "csv" : "json";
        if (accepts === "csv") {
         window.location.href = "./find.csv?year=" + year + "&make=" + make + "&model=" + model;
         showTable();
        } else {
        $.ajax({
          type: "GET",
          url: "/car_search/find",
          dataType: accepts,
          data: { year: year, make: make, model: model },
          success: function(data) {
            baseapp.data_tables.updateData(resultsDivId, data.results);
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
