if (typeof baseapp === "undefined") {
  var baseapp = {};
}

if (typeof baseapp.data_tables === "undefined") {
  baseapp.data_tables = (function() {
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
            oTable.fnAddData(results);
          }

      }
    };
  })();
}
