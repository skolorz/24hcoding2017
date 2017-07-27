$(document).ready(function(){
	
  $('#view-edit-advanced-options').click(function(){
    var thisButton = $(this)
	var showButtonText = "Show advanced options"

	$('.advanced-option').toggle();

	if(thisButton.text() === showButtonText) {
      thisButton.text("Hide advanced options");
	} else {
      thisButton.text(showButtonText);
	}
  })

  $('#view-add').click(function(){
    var el = $('#add-view-form')
    if (el.is(":visible")) {
      el.hide()
    } else {
      el.css("display", "inline-block")
      $('#add-view-form form input:first-of-type').focus()
    }
  })

  $('#account-edit-label').click(function(){
    var el = $('#account-edit-label-form')
    if (el.is(":visible")) {
      el.hide()
    } else {
      el.css("display", "inline-block")
      $('#account-edit-label-form form input:first-of-type').focus()
    }
  })

  /* clicking on edit: change view to edit mode for selected view */
  $(".edit").on("click", function(){
    var viewId = $(this).attr("data-id")
    
    $(this).addClass("active");

    /* permissions and is public checkboxes get activated */
    $(".permission_value_cb").each(function(i){
      if($(this).attr("data-viewid") === viewId){
        $(this).removeAttr("disabled")
      }
    })

    $(".is_public_cb").each(function(i){
      if($(this).attr("data-viewid") === viewId){
        $(this).removeAttr("disabled")
      }
    })

    /* make Save / Cancel / Delete unclickable for not selected columns */
    var $actionButtons = $(".action");
    for(i=0; i<$actionButtons.length; i++){
        var $action = $($actionButtons[i]);
        if($action.attr("data-id") !== viewId)
            $action.attr("disabled", "disabled");
    }

    /* edit button disappears, save and cancel button appear */
    $(".edit_head").hide();
    $(".cancel_head, .save_head").show();

    var descriptionText = "";
    /* viewId become editable */
    $(".desc").each(function(i){
      var $desc = $(this);
      if($desc.attr("data-viewid") === viewId){
    	  descriptionText = $desc.text();
    	  $desc.hide();
      }
    })
    
    $(".desc_input").each(function(i){
    	var $descInput = $(this);
        if($descInput.attr("data-viewid") === viewId){
        	$descInput.val(descriptionText)
        	$descInput.show();
        }
    })

    /* alias field will become a select box */
    $(".alias").each(function(i){
      var $alias = $(this)
      if($alias.attr("data-viewid") === viewId){
        var content = $alias.html()
        $alias.html(
          "<select id='selectAlias'>"+getOptions()+"</option></select>"
        )
      }
      $("#selectAlias option[value='"+content+"']").attr('selected',true)
    })

   function getOptions () {
      var aliasOptions = new Array("public", "private", "none (display real names only)")
      var option = ""
      for(a in aliasOptions){
       var alias = aliasOptions[a]
       option += "<option value='"+alias+"'>"+alias+"</option>"
      }
      return option
   };

  });
    /* clicking on cancel: reload the page */
    $(".cancel").on("click", function(){
        window.location.reload();
    });
    
    $(".save").on("click", function(){
    	var $this = $(this);
    	var viewId = $this.attr("data-id")

    	//removes the alias dropdown and replaces it with the text of the previously selected option
    	$(".alias").each(function(i){
    		var $alias = $(this);
    		if($alias.attr("data-viewid") === viewId){
    			var aliasName = $alias.find(":selected").val();
    			$alias.html(aliasName)
    		}
    	});
    	
    	//show the description again and hide the description input
    	$(".description").each(function(i){
    		var $description = $(this);
    		if($description.attr("data-viewid") === viewId){
    			var $descInput = $description.find(".desc_input")
    			var newDescription = $descInput.val();
    			$descInput.hide();
    			
    			var $desc = $description.find(".desc");
    			$desc.text(newDescription);
    			$desc.show();
    		}
    	});
    	
    	/* permissions and is public checkboxes get deactivated */
        $(".permission_value_cb").each(function(i){
          if($(this).attr("data-viewid") === viewId){
            $(this).attr("disabled", "disabled")
          }
        })

        $(".is_public_cb").each(function(i){
          if($(this).attr("data-viewid") === viewId){
        	  $(this).attr("disabled", "disabled")
          }
        })

        /* make Save / Cancel / Delete clickable for not selected columns */
        var $actionButtons = $(".action");
        for(i=0; i<$actionButtons.length; i++){
            var $action = $($actionButtons[i]);
            $action.removeAttr("disabled");
        }
    	
    	/* edit button appears, save and cancel button disappear */
        $(".edit_head").show();
        $(".cancel_head, .save_head").hide();
    });
})

    var collectData = function(viewId){
        var saveJson = new Object();
        saveJson.viewId = viewId;
        var viewData = new Object();
        viewData.description = $(".desc_input[data-viewId=" + viewId + "]").val();
        viewData.which_alias_to_use = $(".alias[data-viewId=" + viewId + "] select").val();
        viewData.is_public = $(".is_public_cb[data-viewId=" + viewId + "]").is(':checked');
        viewData.hide_metadata_if_alias_used = $(".hide_metadata_if_alias_used[data-viewId=" + viewId + "]").is(':checked');

        var $permissions = $("input.permission_value_cb");
        var allowedActions = new Array();
        for(i=0; i < $permissions.length; i++){
            var $permission = $($permissions[i])
            if($permission.attr("data-viewid") == viewId && $permission.is(':checked')){
               allowedActions.push($permission.attr("name"));
            }
        }
        viewData.allowed_actions = allowedActions;
        saveJson.updateJson = viewData;
        return JSON.stringify(saveJson);
    //  console.log("Then reload the page.")
    };

