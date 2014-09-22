var TableEditable = function () {

    return {

        //main function to initiate the module
        init: function () {
        	//alert("222");
            // function restoreRow(oTable, nRow) {
                // var aData = oTable.fnGetData(nRow);
                // var jqTds = $('>td', nRow);
// 
                // for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    // oTable.fnUpdate(aData[i], nRow, i, false);
                // }
				// //alert("222");
                // oTable.fnDraw();
            // }

            function editRow(oTable, nRow) {
            	// alert("editrow");
            	// alert(oTable);
            	// alert("nRow"+nRow);
            	nRow.cells[9].innerHTML = '<select id="sectRole" class="m-wrap small" > <option value="Admin">Admin</option> <option value="Recruiter">Recruiter</option> <option value="HiringMgr">Hiring Manager</option> <option value="Interviewer">Interviewer</option> <option value="Employee">Employee</option> </select>';
            	nRow.cells[10].innerHTML = '<a class="edit" href="">Save</a>';
            	nRow.cells[11].innerHTML = '<a class="cancel" href="">Cancel</a>';
            
            }

            function saveRow(oTable, nRow) {
            	
            	nRow.cells[9].innerHTML = nRoleValue;
            	
            	nRow.cells[10].innerHTML = '<a class="edit" href="javascript:;">Edit</a>';
            	nRow.cells[11].innerHTML = '<a class="cancel" href="">Destroy</a>';
            	
            }

            function cancelEditRow(oTable, nRow) {
            	
            	nRow.cells[9].innerHTML = nOriRoleValue;
            	// nRow.cells[9].value = nRoleValue;
            	nRow.cells[10].innerHTML = '<a class="edit" href="javascript:;">Edit</a>';
            	nRow.cells[11].innerHTML = '<a class="cancel" href="">Destroy</a>';
            	
            }
			// alert("333");
			
			

            var oTable = $('#sample_editable_1');//.dataTable();//{
              
            var nEditing = null;
            var nOriRoleValue = null;
            var nRoleValue = null;

            // $('#sample_editable_1_new').click(function (e) {
                // e.preventDefault();
                // var aiNew = oTable.fnAddData(['', '', '', '',
                        // '<a class="edit" href="">Edit</a>', '<a class="cancel" data-mode="new" href="">Cancel</a>'
                // ]);
                // var nRow = oTable.fnGetNodes(aiNew[0]);
                // editRow(oTable, nRow);
                // nEditing = nRow;
            // });

            

            $('#sample_editable_1 a.cancel').live('click', function (e) {
                e.preventDefault();
                if (this.innerHTML == "Cancel"){
	                var nRow = $(this).parents('tr')[0];
					//alert(nRow);alert(nEditing);
	                cancelEditRow(oTable, nRow);
	                nEditing = null;
                }
            });
            

            $('#sample_editable_1 a.edit').live('click', function (e) {
                //alert("editclick");
                e.preventDefault();
				
                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];
				//alert(nRow);alert(nEditing);
				nOriRoleValue = nRow.cells[9].innerHTML;
				// var nRole = nRow.cells[9];
				//alert("Ori Role Value -- "+nOriRoleValue);
										
				
                // if (nEditing !== null && nEditing != nRow) {
                    // /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    // restoreRow(oTable, nEditing);
                    // editRow(oTable, nRow);
                    // nEditing = nRow;
                // } else 
                if (nEditing == nRow && this.innerHTML == "Save") {
                	//alert("editclick2");
                    /* Editing this row and want to save it */
                    nRoleValue = document.getElementById("sectRole").value;
                    //alert("Select Role Value -- "+nRoleValue);
                    saveRow(oTable, nEditing);
                    nEditing = null;
                    alert("Updated! Do not forget to do some ajax to sync with backend :)");
                } else {
                    /* No edit in progress - let's start one */
                    editRow(oTable, nRow);
                    nEditing = nRow;
                }
            });
        
        }

    };

}();