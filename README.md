# Bob Buzzard's Lightning Design System Samples

## Getting Started
Install the unmanaged package via the following link :

https://login.salesforce.com/packaging/installPackage.apexp?p0=04t24000000Aibe

(If you've installed an earlier version, you'll need to uninstall that before installing the latest, as unmanaged packages can't be upgraded.

## Sample 1 - Account and Contacts Edit
See the blog post at : http://bobbuzzard.blogspot.co.uk/2015/09/lightning-design-system-edit-parent-and.html

Access the page via a URL similar to the following - note that if you do not supply an accountId parameter you will receive an internal server error!

https://_domain_.lightning.force.com/bblightning/BBAccountContactEdit.app?accountId=_id_

e.g.

https://bblds-test-dev-ed.lightning.force.com/bblightning/BBAccountContactEdit.app?accountId=001o000000GXMt3

## Sample 2 - Responsive Design
See the blog post at : http://bobbuzzard.blogspot.co.uk/2015/10/responsive-design-with-lightning-design.html

Create a tab for the 'Blog Post' custom object and create a few blog posts. I usually add the images as attachments to the record and copy the ID from there. Your mileage may vary with other options.

Access the page via a URL similar to the following:

https://_domain_.lightning.force.com/bblightning/BBBlogHome.app

e.g.

https://bblds-test-dev-ed.lightning.force.com/bblightning/BBBlogHome.app

## Sample 3 - LDS Activity Timeline, Lightning Components and Visualforce
See the blog post at : http://bobbuzzard.blogspot.co.uk/2015/10/lds-activity-timeline-lightning.html

Access the page via a URL similar to the following:

https://_domain_._instance_.visual.force.com/apex/AccountOppTimeline?id=_accountId_

e.g.

https://bblds-dev-ed--c.eu5.visual.force.com/apex/AccountOppTimeline?id=00124000005U5ox

## Sample 4 - Board Anything with SLDS and Lightning Components

See the blog post at : http://bobbuzzard.blogspot.co.uk/2016/01/board-anything-with-slds-and-lightning.html

Access the Lead Board Visualforce page via a URL similar to the following:

https://_domain_._instance_.visual.force.com/apex/BBLeadBoard

e.g.

https://bblds-dev-ed--c.eu5.visual.force.com/apex/BBLeadBoard

Access the default case view app board via a URL similar to the following:

https://_domain_.lightning.force.com/c/BBSObjectBoardApp.app

e.g.

https://bblds-dev-ed.lightning.force.com/c/BBSObjectBoardApp.app

## Sample 5 - Lightning Design System in Visualforce Part 1 - Getting Started

See the blog post at : http://bobbuzzard.blogspot.co.uk/2016/12/lightning-design-system-in-visualforce.html

Access the page through a URL similar to the following : 

https://_domain_._instance_.visual.force.com/apex/BBLDS_VF_Record?id=_AccountId_

e.g.

https://bblds-test-dev-ed--bblightning.na17.visual.force.com/apex/BBLDS_VF_Record?id=001o000000Bb0km
