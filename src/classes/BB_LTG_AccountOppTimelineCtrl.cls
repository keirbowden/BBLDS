/** *****************************************************************************
 * BB_LTG_AccountOppTimelineCtrl
 *
 * Description: 
 *
 * Apex controller for the account opportunities timeline lightning component
 *
 * Test Method Class: BB_LTG_BlogPostController_Test
 *
 * Interested in a career writing code on the Salesforce platform? Take a look
 * at http://www.brightgen.com/CareersBG
 *
 * Author kbowden
 * Date 17 Oct 2015
 *
 * Changes:
 ********************************************************************************/
public class BB_LTG_AccountOppTimelineCtrl
{
    @AuraEnabled 
    public static BB_LTG_Timeline GetTimeline(String accIdStr)
    {
        BB_LTG_Timeline result=new BB_LTG_Timeline();
        try
        {
            Id accId=(Id) accIdStr;
            System.debug('Account id = ' + accId);
            Account acc=[select id, Name from Account where id=:accId];
            result.name=acc.Name + ' closed deals';
            List<Opportunity> opps=[select CloseDate, Amount, Type 
                                    from Opportunity
                                    where AccountId=:accId
                                      and StageName='Closed Won'
                                    order by CloseDate desc];

            for (Opportunity opp : opps)
            {
                BB_LTG_Timeline.Entry entry=new BB_LTG_Timeline.Entry();
                entry.theDate=opp.CloseDate;
                entry.description=opp.type + ' opportunity closed for ' + opp.amount;
                result.entries.add(entry);
            }
        }
        catch (Exception e)
        {
           System.debug('Exception - ' + e);
        }
        
        return result;
    }
}