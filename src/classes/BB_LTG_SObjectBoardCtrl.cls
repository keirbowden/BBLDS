/** *****************************************************************************
* BB_LTG_SObjectBoardCtrl
*
* Description: 
*
* Apex controller for the board anything lightning application
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
public class BB_LTG_SObjectBoardCtrl {
    @AuraEnabled
    public static List<BB_LTG_BoardStage> GetStages(String sobjectType,
                                                    String stageValueField,
                                                    String stageConfigField,
                                                    String excludeValues,
                                                    String fieldNames)
    {
        List<BB_LTG_BoardStage> stages=new List<BB_LTG_BoardStage>();
        try
        {
            if ( (null==stageConfigField))
            {
                stageConfigField=stageValueField;
            }
            
            Map<String, String> excludeValuesMap=new Map<String, String>();
            if (null!=excludeValues)
            {
                for (String excludeValue : excludeValues.split(','))
                {
                    excludeValuesMap.put(excludeValue, excludeValue);
                }
            }
            Map<String, BB_LTG_BoardStage> stagesByName=new Map<String, BB_LTG_BoardStage>();

			Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(sobjectType).
											            getDescribe().fields.getMap();
            Schema.DescribeFieldResult fieldRes= fieldMap.get(stageConfigField).getDescribe();
            
            List<Schema.PicklistEntry> ples = fieldRes.getPicklistValues();
            for (Schema.PicklistEntry ple : ples)
            {
                String stageName=ple.GetLabel();
                if (null==excludeValuesMap.get(stageName))
                {
                    BB_LTG_BoardStage stg=new BB_LTG_BoardStage();
                    stg.stageName=ple.GetLabel();
                    stagesByName.put(stg.stageName, stg);
                    stages.add(stg);
                }
            }
            
            List<String> fieldNamesList=fieldNames.split(',');
            String queryStr='select Id,' + String.escapeSingleQuotes(stageValueField) + ', ' +
                String.escapeSingleQuotes(fieldNames) + 
                ' from ' + String.escapeSingleQuotes(sobjectType);
            List<SObject> sobjects=Database.query(queryStr);
            for (SObject sobj : sobjects)
            {
                String value=String.valueOf(sobj.get(stageValueField));
                BB_LTG_BoardStage stg=stagesByName.get(value);
                if (null!=stg)
                {
                    BB_LTG_BoardStage.StageSObject sso=new BB_LTG_BoardStage.StageSObject();
                    Integer idx=0;
                    for (String fieldName : fieldNamesList)
                    {
                        fieldName=fieldName.trim();
			            fieldRes= fieldMap.get(fieldName).getDescribe();
                        BB_LTG_BoardStage.StageSObjectField ssoField=
                            new BB_LTG_BoardStage.StageSObjectField(fieldRes.getLabel(), sobj.get(fieldName));
                        if (0==idx)
                        {
                            sso.titleField=ssoField;
                        }
                        else
                        {
                            sso.fields.add(ssoField);
                        }
                        idx++;
                    }
                    stg.sobjects.add(sso);
                }
            }
            
        }
        catch (Exception e)
        {
            System.debug('Exception occurred : ' + e.getStackTraceString());
        }
        return stages;
    }
}