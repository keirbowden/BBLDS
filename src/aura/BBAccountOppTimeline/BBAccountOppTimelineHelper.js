({
	doInit : function(cmp, ev) {
		var action = cmp.get("c.GetTimeline");
        action.setParams({'accIdStr' : cmp.get('v.recordId')});
        
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.gotTimeline);
            }
            catch (e) {
                alert('Exception ' + e);
            }
        });
    	$A.enqueueAction(action);
	},
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
    gotTimeline : function(cmp, helper, timeline) {
        cmp.set('v.timeline', timeline);
    }
})