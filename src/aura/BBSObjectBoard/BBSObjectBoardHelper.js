({
    // initialisation function - retrieves the board data from the 
    // Apex controller
	doInit : function(cmp, ev) {
        var sobjectType=cmp.get('v.SObjectType');
        var stageValueField=cmp.get('v.StageValueField');
        var stageConfigField=cmp.get('v.StageConfigField');
        var fieldNames=cmp.get('v.FieldNames');
        var excludeValues=cmp.get('v.ExcludeValues');
		var action = cmp.get("c.GetStages");
        var params={"sobjectType":sobjectType,
                    "stageValueField": stageValueField,
                    "stageConfigField": stageConfigField,
                    "excludeValues": excludeValues,
                    "fieldNames": fieldNames};
		console.log('Params = ' + JSON.stringify(params));

        action.setParams(params);
        
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.gotStages);
            }
            catch (e) {
                alert('Exception ' + e);
            }
        });
    	$A.enqueueAction(action);
	},
    // generic action method response handler - carries out error checking
    // and assuming successful invokes the supplied callback, including the
    // callback data
	actionResponseHandler : function (response, component, helper, cb, cbData) {
        try
        {
    	    var state = response.getState();
			if (state === "SUCCESS") {
				var retVal=response.getReturnValue();
        	    cb(component, helper, retVal, cbData);
			}
			else if (state === "ERROR") {
				var errors = response.getError();
				if (errors) {
					if (errors[0] && errors[0].message) {
						alert("Error message: " + errors[0].message);
					}
				} 
				else {
					alert("Unknown error");
				}
			}
        }
        catch (e) {
            alert('Exception in actionResponseHandler: ' + e);
        }
	},
    // callback invoked when the board data is retrieved
    gotStages : function(cmp, helper, stages) {
        console.log('Got stages ' + JSON.stringify(stages));
        cmp.set('v.Stages', stages);
        cmp.set('v.ColumnWidths', stages.length);
    },
    // helper method to extract a parameter from the URL
    getURLParameter : function(param, defaultValue) {
		var result=decodeURIComponent((new RegExp('[?|&]' + param + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
        if ( (null==result) && (defaultValue) )
        {
            result=defaultValue;
        }
        return result;
    }
})