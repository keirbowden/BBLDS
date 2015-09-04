<aura:application controller="BB_LTG_AccountContactEditCtrl">
	<aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    <aura:attribute name="account" type="Account" />
    <aura:attribute name="contacts" type="Contact[]" />
    <aura:attribute name="selectedContact" type="Contact" />
    <aura:attribute name="editingContact" type="Boolean" default="false" />
	
    <ltng:require styles="/resource/BB_SLDS080/assets/styles/salesforce-lightning-design-system-vf.css" />
    <div class="slds">
	    <c:BBAppHeader appEvent="{!c.appEvent}"/>
		<div class="slds-grid slds-wrap slds-p-top--x-small">
 		  <div class="slds-col slds-size--1-of-3 slds-p-around--medium">
               <c:BBAccountContactList account="{!v.account}"
                                        contacts="{!v.contacts}" 
										selectedContact="{!v.selectedContact}" 
                                        editingContact="{!v.editingContact}" />
          </div>	    
          <aura:if isTrue="{!v.editingContact}">
		      <div class="slds-col slds-size--2-of-3 slds-p-around--medium">
                  <c:BBContactEditForm contact="{!v.selectedContact}" />
              </div>
          </aura:if>
          <aura:if isTrue="{! (!v.editingContact)}">
		      <div class="slds-col slds-size--2-of-3 slds-p-around--medium">
                  <c:BBAccountEditForm account="{!v.account}" />
              </div>
          </aura:if>
	    </div>
    </div>
</aura:application>