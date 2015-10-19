/** *****************************************************************************
 * BB_LTG_Timeline
 *
 * Description: 
 *
 * Timeline container apex class
 *
 * Interested in a career writing code on the Salesforce platform? Take a look
 * at http://www.brightgen.com/CareersBG
 *
 * Author kbowden
 * Date 17 Oct 2015
 *
 * Changes:
 ********************************************************************************/
public class BB_LTG_Timeline {

    @AuraEnabled
    public String name {get; set;}
        
    @AuraEnabled
    public List<Entry> entries {get; set;}
        
    public BB_LTG_Timeline()
    {
        entries=new List<Entry>();
    }

    public class Entry
    {
        @AuraEnabled
        public Date theDate {get; set;}

        @AuraEnabled
        public String description {get; set;}
    }

}