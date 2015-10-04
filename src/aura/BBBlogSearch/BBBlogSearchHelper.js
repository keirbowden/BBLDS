({
	search : function(cmp, ev) {
		var terms=cmp.find('searchTerms').getElement().value;
		cmp.getEvent("SearchEvent").
						setParams({"SearchTerms" : terms}).fire();         
	}
})