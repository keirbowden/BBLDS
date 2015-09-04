({
	doInit : function(cmp, ev) {
        var accountId=this.getURLParameter('accountId');
		var action = cmp.get("c.GetAccountAndContacts");
        var params={"accountIdStr":accountId};
        action.setParams(params);
        
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.gotAccount);
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
    gotAccount : function(cmp, helper, acc) {
        cmp.set('v.account', acc);
        cmp.set('v.contacts', acc.Contacts);
    },
    getURLParameter : function(param) {
		var result=decodeURIComponent((new RegExp('[?|&]' + param + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
        return result;
    },
    appEvent : function(cmp, ev) {
        var action=ev.getParam("action");
        if (action=="save") {
            this.save(cmp);
        }
    },
    save : function(cmp) {
		var action = cmp.get("c.SaveAccountAndContacts");
        var account=cmp.get('v.account');
        var contacts=cmp.get('v.contacts');
        var params={"acc":account,
                    "contacts":contacts};
        action.setParams(params);
        
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.saved);
            }
            catch (e) {
                alert('Exception ' + e);
            }
        });
    	$A.enqueueAction(action);
    },
    saved : function(cmp, helper, acc) {
        alert('Saved records');
    },
})