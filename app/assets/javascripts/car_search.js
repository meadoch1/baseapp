'use strict';
var setupTable = function() {
  var resultDiv = $('#results');
  var table = resultDiv.dataTable( {
    "columns": [
  { data: 'year' },
      { data: 'make' },
      { data: 'model' }
  ],
      "dom": 'T<"clear">lfrtip'
  } );
  var tableTools = new $.fn.dataTable.TableTools( table, {
    "buttons": [
    "copy",
      "csv",
      "xls",
      "pdf",
      { "type": "print", "buttonText": "Print me!" }
  ],
      "sSwfPath": "/copy_csv_xls_pdf.swf"
  } );
  $( tableTools.fnContainer() ).insertAfter('div.info');
};

var showTable = function() {
  $('#error').hide();
  $('#tablediv').show();
  $('#processing').hide();
};

var showError = function() {
  $('#error').show();
  $('#tablediv').hide();
  $('#processing').hide();
};

var showProcessing = function() {
  $('#error').hide();
  $('#tablediv').hide();
  $('#processing').show();
};

var ready = function() {

  if (!$('#tablediv').length) { return };

  setupTable();

  showTable();

  var updateResults = function(results) {
      var resultDiv = $('#results');
      if (typeof results === 'string') {
        console.log('error');
      } else {
        var oTable = resultDiv.dataTable();
        oTable.fnClearTable();
        oTable.fnAddData(results);

      }

  };


  $('#submitSearch').on('click', function(e){
    e.preventDefault();
    showProcessing();
    var year = $('#car_point_year').val();
    var make = $('#car_point_make').val();
    var model = $('#car_point_model').val();
    var accepts = $('#as_csv').prop('checked') ? 'csv' : 'json';
    $.ajax({
      type: 'GET',
      url: "/car_search/find",
      dataType: accepts,
      //accepts: accepts,
      data: { year: year, make: make, model: model },
      success: function(data) {
        updateResults(data.results);
        showTable();
      },
      error: function(data){
        showError();
      }
    });

  });

};

$(document).ready(ready);
