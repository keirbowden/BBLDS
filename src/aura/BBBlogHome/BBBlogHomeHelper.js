({
	doInit : function(cmp, ev) {
		var action = cmp.get("c.GetBlogs");
        
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.gotBlogs);
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
    gotBlogs : function(cmp, helper, blogWraps) {
        cmp.set('v.blogWrappers', blogWraps);
        if (!blogWraps || 0==blogWraps.length) {
            cmp.set('v.empty', true);
        }
        else {
            cmp.set('v.empty', false);
        }
    },
    search : function(cmp, ev) {
        var terms=ev.getParam('SearchTerms');
        alert('Search terms = ' + terms);
		var action = cmp.get("c.SearchBlogs");
        action.setParams({"searchStr" : terms})
        
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.gotBlogs);
            }
            catch (e) {
                alert('Exception ' + e);
            }
        });
    	$A.enqueueAction(action);
    },
    addComment : function(cmp, ev) {
        var blogId=ev.getParam('BlogId');
        var name=ev.getParam('Name');
        var body=ev.getParam('Body');
        var action = cmp.get('c.NewComment');
        action.setParams({'blogIdStr' : ev.getParam('BlogId'),
                          'name' : ev.getParam('Name'),
                          'body' : ev.getParam('Body')});
        var self = this;
        action.setCallback(this, function(response) {
            try {
            	self.actionResponseHandler(response, cmp, self, self.commentSaved);
            }
            catch (e) {
                alert('Exception ' + e);
            }
        });
    	$A.enqueueAction(action);
    },
    commentSaved: function(cmp, helper, result) {
        var blogWraps=cmp.get('v.blogWrappers');
        for (var idx=0; idx<blogWraps.length; idx++) {
            if (blogWraps[idx].blog.Id==result.blog.Id) {
                blogWraps[idx]=result;
            }
        }
        
        cmp.set('v.blogWrappers', blogWraps);
    }
})