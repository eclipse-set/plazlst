 var SideBAR = (function () {
        function SideBAR() {}
        
        SideBAR.prototype.moveMyMenuOut = function () {
            return $("nav.sidebar").css({right: 380});
        };
        
        SideBAR.prototype.moveMyMenuIn = function () {
            return $("nav.sidebar").css({right:"0px"});
        };
        
        SideBAR.prototype.expandMyMenu = function (node) {
            return node.removeClass("sidebar-menu-collapsed").addClass("sidebar-menu-expanded");
        };

        SideBAR.prototype.collapseMyMenu = function (node) {
            return node.removeClass("sidebar-menu-expanded").addClass("sidebar-menu-collapsed");
        };

        SideBAR.prototype.showDiv = function (node) {
        $("nav.sidebar ul a span.expanded-element").show();
            return node.show();
        };

        SideBAR.prototype.hideDiv = function (node) {
            $("nav.sidebar ul a span.expanded-element").hide();
            return node.hide();
        };

        SideBAR.prototype.showActiveSubMenu = function () {
            $("li.active ul.level2").show();
            return $("li.active a.expandable").css({
                width: "100%"
            });
        };

        SideBAR.prototype.hideActiveSubMenu = function () {
            return $("li.active ul.level2").hide();
        };

        SideBAR.prototype.adjustPaddingOnExpand = function () {
            $("ul.level1 li a.expandable").css({
                padding: "1px 4px 4px 0px"
            });
            return $("ul.level1 li.active a.expandable").css({
                padding: "1px 4px 4px 4px"
            });
        };

        SideBAR.prototype.resetOriginalPaddingOnCollapse = function () {
            $("ul.nbs-level1 li a.expandable").css({
                padding: "4px 4px 4px 0px"
            });
            return $("ul.level1 li.active a.expandable").css({
                padding: "4px"
            });
        };

        SideBAR.prototype.ignite = function () {
            return (function (instance) {
                return $(".expandable").on( "click", function (e) {
                var sidebarClose=$(this).hasClass('sidebarClose');
                var divID=$('div#'+$(this).attr('id'));
                if (sidebarClose){ 
                    divID=$('div.sidebar-menu-expanded');
                }
                    if (divID.hasClass("sidebar-menu-collapsed")) {
                       var divExpanded = $('div.sidebar-menu-expanded');
                       if (divExpanded.length>0){
                           instance.collapseMyMenu(divExpanded);
                           instance.hideDiv(divExpanded);
                           $('a#'+divExpanded.attr('id')).css({
                            color: "#FFF"
                        });
                       }
                        instance.adjustPaddingOnExpand();                            
                        instance.expandMyMenu($("nav.sidebar"));
                        instance.moveMyMenuOut();
                        instance.expandMyMenu(divID);
                        instance.showDiv($('#sidebarClose'));
                        instance.showDiv(divID);
                        instance.showActiveSubMenu();
                        $(this).css({
                            color: "#D0D0D0"
                        });
                    } else if (divID.hasClass("sidebar-menu-expanded")) {
                        instance.resetOriginalPaddingOnCollapse();                
                        instance.collapseMyMenu($("nav.sidebar"));
                        instance.moveMyMenuIn();
                        instance.collapseMyMenu(divID);
                        instance.hideDiv($('#sidebarClose'));
                        instance.hideDiv(divID);
                        instance.hideActiveSubMenu();
                        $('a#'+divID.attr('id')).css({color: "#FFF"});
                    }
                    return false;
                });
            })(this);
        };

        return SideBAR;

    })();

var tableIndex=0;
var showAllRows = true;
		 
    $(document).ready(function() {
    
        var status = $('.status').hide();

        var table = $('table.display').DataTable( { 
			layout: {
				topStart: 'info',
				topEnd: 'paging',
				bottomStart: 'pageLength',
				bottomEnd: 'paging'
					},		
            "language": { 
                        select: {
                            rows: {
                                _: "Sie haben %d Zeilen ausgewählt.",
                                0: "",
                                1: "Sie haben 1 Zeile ausgewählt."
                            }
                        },
						"sEmptyTable":   	"Keine Daten in der Tabelle vorhanden",
						"sInfo":         	"_START_ bis _END_ von _TOTAL_ Einträgen",
						"sInfoEmpty":    	"0 bis 0 von 0 Einträgen",
						"sInfoFiltered": 	"(gefiltert von _MAX_ Einträgen)",
						"sInfoPostFix":  	"",
						"sInfoThousands":  	".",
						"sLengthMenu":   	"_MENU_ Einträge anzeigen",
						"sLoadingRecords": 	"Wird geladen...",
						"sProcessing":   	"Bitte warten...",
						"sSearch":       	"In allen Feldern suchen",
						"sZeroRecords":  	"Keine Einträge vorhanden.",
						"oPaginate": {
							"sFirst":    	"Erste",
							"sPrevious": 	"Zurück",
							"sNext":     	"Nächste",
							"sLast":     	"Letzte"
						},
						"oAria": {
							"sSortAscending":  ": aktivieren, um Spalte aufsteigend zu sortieren",
							"sSortDescending": ": aktivieren, um Spalte absteigend zu sortieren"
						}
                     },
            "fixedHeader": true,
			"processing": true,
            "colReorder": true,
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "Alle"] ],
            "columnDefs": [{
                 orderable: false,
                  className: 'select-checkbox',
                  targets:   0,
                  visible: true,
				  width: "2em"
                },
                {
                  targets:   4,
                  visible: false
                },
                {
                  targets:   5,
                  visible: false
                }],                        
            "select": {
                style: 'm',
                selector: 'td:first-child'
            },
            order: [[ 1, 'asc' ]],
            "initComplete": function () {                         
                $('#searchInput').on( 'keyup', function () {
                      table.search( this.value ).draw();
                  } );

                var i=0;
                this.api().columns().every( function () {
                if (i>0){
                    var column = this;
				
                    var select = $('#filterButton'+i)
                    .on( 'click', function (e) {
                         e.preventDefault();
                         // Get the column API object
                         var column = table.column( $(this).attr('data-column') );
                         if (column.visible())                              
                           this.classList.add("dt-button-active");
                          else    
                           this.classList.remove("dt-button-active");
                         // Toggle the visibility
                         column.visible( ! column.visible() );
                    } );   
					if (column.visible())                              
					   select[0].classList.remove("dt-button-active");
					console.log(select);
					
                     var select = $('#demonstration'+ i)
                    .on( 'change', function () {
                        var result=$(this).val();
                        var val ="";
                        if (result!=null) {
                            for (var i = 0; i < result.length; i++) {
                                entry=result[i];
                                if (val!="")
                                val=val+"|";
                                val = val + $.fn.dataTable.util.escapeRegex(entry);
                            };
                        };
						val = val.replaceAll("<i>", "");
						val = val.replaceAll("<\\/i>", "");
                        column
                        .search( val ? '^'+val+'$' : '', true, false )
                        .draw();
                    } );
                
                    column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                    } );
                
                
                    $('#demonstration'+i).searchableOptionList({ maxHeight: '300px', showSelectAll: true, 
                    scrollTarget: $('#expandablediv2')    // change the scrollTarget if neccessary
                    });
                     }
                    i=i+1;
                });
            }
        } );
         
         $.fn.dataTableExt.afnFiltering.push(
             function( oSettings, aData, iDataIndex ) {
                     var filterSelectedSelect = table.rows( { selected: true } );
                     if (filterSelectedSelect.count() == 0)
                         return true;
                     if (showAllRows)
                         return true;
                     var oTable = $('#' + oSettings.sTableId).DataTable();
					 var row = oTable.row(iDataIndex).node();
                     var isSelected = $(row).hasClass("selected");
                     return isSelected;
             }
         );
      
       $('table.display tbody tr').on('mouseover', function () {
      var nTds = table.row( this ).data();
      var textstring = '<div> ' + nTds[1] + ' | ' + nTds[2] + ' | ' + nTds[3] + ' | ' + nTds[6] + ' | ' + nTds[7] + ' | ' + nTds[8] + '</div>';
        var status = $('.status');
        status.empty();
        $(textstring).appendTo(status)
      } );
      
      $('table.display tbody tr').on('mouseenter ', function () {
        var status = $('.status');
        $(status).show();
      } );
      
      $('table.display tbody tr').on('mouseleave ', function () {
        var status = $('.status');
        $(status).hide();
     } );
     
        registerButtons(table, showAllRows);
        buildExportButtons(table);
		
		table.on('column-reorder', function(e, settings, details){
			var oldText=$('#filterButton'+details.from + ' span').text();
			$('#filterButton'+details.from + ' span').text($('#filterButton'+details.to + ' span').text());
			$('#filterButton'+details.to + ' span').text(oldText);
		});
		
        return (new SideBAR).ignite();
    });
                            
     function buildExportButtons(table){
                         new $.fn.dataTable.Buttons( table, {
    buttons: [
        {
            text: 'Zwischenablage für Filter',
            extend: 'copy',
            className: 'margin btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-copy ttip',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: false,
                        search: 'applied'
                    }
                }
        }]} );
 
      table.buttons( 0, null ).container().appendTo( '#button1' );

new $.fn.dataTable.Buttons( table, {
    buttons: [
        {
            text: 'Zwischenablage für Auswahl',
            extend: 'copy',
            className: 'margin btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-copy ttip',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: true,
                        search: 'applied'
                    }
                }
        }]} );
 
      table.buttons( 1, null ).container().appendTo( '#button1' );
      
      new $.fn.dataTable.Buttons( table, {
    buttons: [
         {
            text: 'CSV für Filter',
            extend: 'csv',
            className: 'margin marginWide btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-csv ttip',
            title: export_filename,
            extension: '.csv',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: false,
                        search: 'applied'
                    }
                }
        }]} );
 
      table.buttons( 2, null ).container().appendTo( '#button2' );
      
            new $.fn.dataTable.Buttons( table, {
    buttons: [
         {
            text: 'CSV für Auswahl',
            extend: 'csv',
            className: 'margin btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-csv ttip',
            title: export_filename,
            extension: '.csv',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: true,
                        search: 'applied'
                    }
                }
        }]} );
 
      table.buttons( 3, null ).container().appendTo( '#button2' );
      
            new $.fn.dataTable.Buttons( table, {
    buttons: [
         {
            text: 'Excel für Filter',
            extend: 'excel',
            className: 'margin marginWide btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-xls ttip',
            title: export_filename,
            extension: '.xls',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: false,
                        search: 'applied'
                    }
                }
        }]} );
 
      table.buttons( 4, null ).container().appendTo( '#button3' );
            
            new $.fn.dataTable.Buttons( table, {
    buttons: [
         {
            text: 'Excel für Auswahl',
            extend: 'excel',
            className: 'margin btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-xls ttip',
            title: export_filename,
            extension: '.xls',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: true,
                        search: 'applied'
                    }
                }
        }]} );
 
      table.buttons( 5, null ).container().appendTo( '#button3' );
      new $.fn.dataTable.Buttons( table, {
    buttons: [
      {
            text: 'PDF für Filter',
            extend: 'pdfHtml5',
            className: 'margin marginWide btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-pdf ttip',
            title: export_filename,
            extension: '.pdf',                
            orientation: 'landscape',
            pageSize: 'A3',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        search: 'applied'
                    }
                },
            customize: function ( doc ) {
                    doc.content.splice( 1, 0, {      
                        margin: [ 0, 0, 0, 12 ],
                        alignment: 'center',
                        text: 'Feststellungsbericht PlaZ LST'
                    } );
                    }
        }]} );

      table.buttons( 6, null ).container().appendTo( '#button4' );
      
    
            new $.fn.dataTable.Buttons( table, {
    buttons: [
      {
            text: 'PDF für Auswahl',
            extend: 'pdfHtml5',
            className: 'margin btn btn-xs btn-primary p-5 m-0 width-35 assets-export-btn export-pdf ttip',
            title: export_filename,
            extension: '.pdf',                
            orientation: 'landscape',
            pageSize: 'A3',
            exportOptions: {
                    columns: ':visible',
                    modifier: {
                        selected: true,
                        search: 'applied'
                    }
                },
            customize: function ( doc ) {
                    doc.content.splice( 1, 0, {      
                        margin: [ 0, 0, 0, 12 ],
                        alignment: 'center',
                        text: 'Feststellungsbericht PlaZ LST'
                    } );
                    }
        }]} );

      table.buttons( 7, null ).container().appendTo( '#button4' );

      setNumberFilter(table);
      setNumberAuswahl(table);

     $('a#expandablediv4').on( 'click', function () {
        setNumberFilter(table);
        setNumberAuswahl(table);
        } );
     table.on( 'click', 'tr', function () {
        setNumberAuswahl(table); } );
 }
        
      function setNumberFilter(table){
      var rowLength= table.rows({ search: 'applied' }).data().length;
      table.buttons( 0, null ).text('Zwischenablage für Filter ('+rowLength+')');
      table.buttons( 2, null ).text('CSV für Filter ('+rowLength+')');
      table.buttons( 4, null ).text('Excel für Filter ('+rowLength+')');
      table.buttons( 6, null ).text('PDF für Filter ('+rowLength+')');     
  }
        
      function setNumberAuswahl(table){
      var rowLength= table.rows('.selected').data().length;
      table.buttons( 1, null ).text('Zwischenablage für Auswahl ('+rowLength+')');
      table.buttons( 3, null ).text('CSV für Auswahl ('+rowLength+')');
      table.buttons( 5, null ).text('Excel für Auswahl ('+rowLength+')');
      table.buttons( 7, null ).text('PDF für Auswahl ('+rowLength+')');   
      }
      
   function show(id)  
   {  
        if (document.getElementById(id).style.display == 'none')  
        {  
             document.getElementById(id).style.display = '';  
        }  
   }  
     
   function hide(id)  
   {  
         document.getElementById(id).style.display = 'none';
   }      
   
   function showOrHide(id)  
   {  
        if (document.getElementById(id).style.display == 'none') show(id); else hide(id); 
   }  

   function registerButtons(table){
      $('#filterRowsOn').on( "click", function() {
          showAllRows = false;
          table.draw();
      } );

     
      $('#filterRowsOff').on( "click", function() {
           showAllRows = true;
           table.draw();
      } );
      
      $('#clearAllFilter').on( "click", function() {
            $('a.sol-deselect-all').each(function() {
            var a = $(this);
            a.trigger( "click" );
      }); });
      
      $('#showAllCols').on( "click", function() {
      $('#filteringButtons div button').each(function() {
            var button = $(this); 
            if (button.hasClass('dt-button-active'))
                button.trigger( "click" );
        });
      } );}