/** *****************************************************************************
 * BB_LTG_BoardStage
 *
 * Description: 
 *
 * Wrapper class for a stage on a board anything board - contains the stage name
 * and the list of sobjects in that stage. Each sobject contains a list of field 
 * names and values.
 *
 * Test Method Class: BB_LTG_SObjectBoardCtrl_Test
 *
 * Interested in a career writing code on the Salesforce platform? BrightGen
 * are always looking for consultants - check out http://www.brightgen.com or
 * email recruitment@brightgen.com
 *
 * Author kbowden
 * Date 10 Jan 2016
 *
 * Changes:
 ********************************************************************************/
public class BB_LTG_BoardStage
{
    @AuraEnabled
    public String stageName {get; set;}
        
    @AuraEnabled
    public List<StageSObject> sobjects {get; set;}
        
    public BB_LTG_BoardStage()
    {
        sobjects=new List<StageSObject>();
    }
    
    public class StageSObject
    {
        @AuraEnabled
        public StageSObjectField titleField {get; set;}
        
        @AuraEnabled
        public List<StageSObjectField> fields {get; set;}
        
        public StageSObject()
        {
			fields=new List<StageSObjectField>();
        }
    }
    
    public class StageSObjectField
    {
        @AuraEnabled
        public String fieldName {get; set;}
        
        @AuraEnabled
        public String fieldValue {get; set;}
        
        public StageSObjectField(String fName, Object fValue)
        {
            fieldName=fName;
            fieldValue=String.valueOf(fValue);
        }
	}
}