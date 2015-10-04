<aura:application controller="BB_LTG_BlogPostController">
    <aura:attribute name="blogWrappers" type="BB_LTG_BlogPostController.BlogWrapper" />
    <aura:attribute name="empty" type="Boolean" default="false" />
<!--    <aura:handler name="SearchTerm" value="{!this}" action="{!c.doInit}"/>-->
    <ltng:require scripts="/resource/Picturefill_1_2_1"
                  styles="/resource/BB_SLDS091/assets/styles/salesforce-lightning-design-system-ltng.css" 
                  afterScriptsLoaded="{!c.doInit}" />
    <div class="slds">
	    <c:BBBlogHeader />
        <div class="slds-grid slds-wrap">
		  <div class="slds-col slds-size--1-of-1 slds-medium-size--3-of-4">
              <aura:if isTrue="{! v.empty}">
				<h2 class="slds-text-heading--small slds-truncate">No blogs found.</h2>
              </aura:if>
              <c:BBBlogPosts AddCommentEvent="{!c.addComment}" blogWrappers="{!v.blogWrappers}" />
          </div>
		  <div class="slds-col slds-size--1-of-1 slds-medium-size--1-of-4">
              <c:BBBlogSearch SearchEvent="{!c.search}" />
              <c:BBBlogAbout />
          </div>
        </div>
    </div>
</aura:application>