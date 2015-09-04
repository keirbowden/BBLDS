({
	fireSaveEvent : function(cmp, ev) {
        var appEvent = cmp.getEvent("appEvent");
        appEvent.setParams({"action" : "save"});
        appEvent.fire();  
	}
})