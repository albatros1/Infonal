	function maskTelephone() {
		$("#telephone0").mask("(999) 999-9999");
		$("#telephone1").mask("(999) 999-9999");
	}

	
	function addUser(count){	   
		var name = $('#name' + count).val();
		var surname = $('#surname' + count).val();
		var telephone = $('#telephone' + count).val();
 		var dataVar = 'name=' + name + '&surname=' + surname + '&telephone=' + telephone;
 		maskTelephone();
		hideValidationFields(count);
		if(validateFields(count)){
			return;
		}
		
	    $.ajax({	        
	        url: 'add', 
	        type: 'post',
	        data: dataVar,
	        success: function(response) {	
	        	$('#userTable').append(response);            
	        }
	    });	  
	}
	
	function hideValidationFields(count){
		$('#nameEmptyValidation' + count).hide();
		$('#surnameEmptyValidation' + count).hide();
		$('#telephoneEmptyValidation' + count).hide();
	}
	
	function validateFields(count){
		var name = $('#name' + count).val();
		var surname = $('#surname' + count).val();
		var telephone = $('#telephone' + count).val();
		var validationResult = false;
		if (name==null || name=="")
		  {
			$('#nameEmptyValidation' + count).show();
			validationResult = true;
		  }
		if (surname==null || surname=="")
		  {
			$('#surnameEmptyValidation' + count).show();
			validationResult = true;
		  }
		if (telephone==null || telephone=="")
		  {
			$('#telephoneEmptyValidation' + count).show();
			validationResult = true;
		  }
		return validationResult;
	}
	
	function deleteUser(id){	
		console.log(id);
 		var dataId = 'id=' + id;
		console.log(dataId);
	    $.ajax({	        
	        url: 'delete',
	        data: dataId,
	        success: function(response) {
	        	$('#userTable' + id).fadeIn(1000).fadeOut(200, function(){
	        		$('#userTable' + id).remove();})
	        	//$('#userTable' + id).remove();            
	        }
	    });	  
	}
	
	function deleteConfirm(id, count){
		$("#deleteDialog").html("Are you sure you want to delete user?");
	    $("#deleteDialog").dialog({
	        resizable: false,
	        modal: true,
	        title: "Confirm Delete Operation",
	        height: 250,
	        width: 400,
	        buttons: {
	            	"Yes": function () {
	                $(this).dialog('close');
	                deleteUser(id);
	            },
	                "No": function () {
	                $(this).dialog('close');
	            }
	        }
	    });
	}
	
	function updateUser(id, count){	
		var name = $('#name' + count).val();
		var surname = $('#surname' +  count).val();
		var telephone = $('#telephone' + count).val();
 		var dataId = 'id=' + id + '&name=' + name + '&surname=' + surname + '&telephone=' + telephone;
 		maskTelephone();
 		hideValidationFields(count);
		if(validateFields(count)){
			return;
		}
	    $.ajax({	        
	        url: 'update',
	        data: dataId,
	        success: function(response) {    
	        	$('#userTable' + id).replaceWith(response);
	        }
	    });	  
	}
	
	function updateConfirm(id){
	    $("#updateDialog").dialog({
	        resizable: false,
	        modal: true,
	        title: "Update user information",
	        height: 350,
	        width: 400,
	        buttons: {
	           	    "Update user": function () {
	           	    updateUser(id, 1);
	                $(this).dialog('close');	                
	            },
	                "Cancel": function () {
	                $(this).dialog('close');
	            }
	        }
	    });
	}