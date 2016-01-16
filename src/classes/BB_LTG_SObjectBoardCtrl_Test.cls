/** *****************************************************************************
 * BB_LTG_SObjectBoardCtrl_Test
 *
 * Description: 
 *
 * Test class for the apex controller for the board anything lightning application
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
@isTest 
private class BB_LTG_SObjectBoardCtrl_Test 
{
	@isTest
    static void TestController()
    {
        List<Case> cases=new List<Case>();
        
        // insert a test case that will be included
        cases.add(new Case(Subject='Unit Test',
                           Status='New',
                           Description='Test'));
        
        // insert a test case that will be excluded
        cases.add(new Case(Subject='Unit Test',
                         Status='Closed',
                         Description='Test'));
		insert cases;
        
		List<BB_LTG_BoardStage> stages=
            	BB_LTG_SObjectBoardCtrl.GetStages('Case', 'Status', null, 
                        				       'Closed', 'Subject,Description');

        System.assert(stages.size()>0);
        
        BB_LTG_BoardStage stage=stages[0];
        System.assertEquals(stage.sobjects.size(), 1);
        System.assertEquals('Subject', stage.sobjects[0].titleField.fieldName);
    }
}