({
	contactClicked : function(cmp, ev) {
		var contactId=ev.target.id;
        var contacts=cmp.get('v.contacts');
        var chosenContact;
        for (var idx=0; idx<contacts.length; idx++) {
            if (contacts[idx].Id==contactId) {
                cmp.set("v.selectedContact", contacts[idx]);
                break;
            }
        }
        this.updateAttributes(cmp);
        cmp.set('v.editingContact', true);
	},
    accountClicked : function(cmp, ev) {
        cmp.set('v.editingContact', false);
        this.updateAttributes(cmp);
    },
    updateAttributes : function(cmp) {
        cmp.set('v.account', cmp.get('v.account'));
        cmp.set('v.contacts', cmp.get('v.contacts'));
    }
})