if (typeof metanoia === "undefined") {
  var metanoia = {};
}

if (typeof metanoia.data_tables === "undefined") {
  metanoia.data_tables = (function() {
    "use strict";
    return {

      setupTable: function(divId, columns_array) {
        var resultDiv = $(divId);
        var table = resultDiv.dataTable( {
          "columns": columns_array || [],
            "dom": "T<'clear'>lfrtip"
        });

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
        $( tableTools.fnContainer() ).insertAfter("div.info");
      },

      updateData: function(divId, results) {
          var resultDiv = $(divId);
          if (typeof results === "string") {
            console.log("error");
          } else {
            var oTable = resultDiv.dataTable();
            oTable.fnClearTable();
            if (results.length > 0) {
              oTable.fnAddData(results);
            }
          }

      }
    };
  })();
}
