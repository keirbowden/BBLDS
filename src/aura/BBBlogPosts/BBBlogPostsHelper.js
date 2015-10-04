({
    doneRendering : function(cmp, ev) {
        var blogWrappers=cmp.get('v.blogWrappers');
        if (blogWrappers) {
            try {
                window.picturefill();
            }
            catch (exc) {
                alert('Picturefill exception ' + exc);
            }
        }
    },
    toggleComments : function(cmp, ev) {
        var eleId=ev.target.id;
        var blogId=eleId.split('-')[1];
        var toggleId='comments-' + blogId;
        var commentsEle=document.getElementById(toggleId);
        var showHideText='Hide';
        
        if (commentsEle.classList.contains('slds-medium-show'))
        {
            commentsEle.classList.remove('slds-medium-show');
        }
        else
        {
            commentsEle.classList.add('slds-medium-show');
            showHideText='Show';
        }
        
        var blogWrappers=cmp.get('v.blogWrappers');
        for (var idx=0; idx<blogWrappers.length; idx++) {
            if (blogWrappers[idx].blog.Id==blogId) {
                blogWrappers[idx].showHideText=showHideText;
            }
        }
            
        cmp.set('v.blogWrappers', blogWrappers);
    },
    saveComment : function(cmp, ev) {
        var eleId=ev.target.id;
        var blogId=eleId.split('-')[1];
        var nameId='newcomname-' + blogId;
        var name=document.getElementById(nameId).value;
        var bodyId='newcombody-' + blogId;
        var body=document.getElementById(bodyId).value;

		cmp.getEvent("AddCommentEvent").
						setParams({"BlogId" : blogId,
                                   "Name" : name,
                                   "Body" : body}).fire();         
    }
 })