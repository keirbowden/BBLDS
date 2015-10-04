public class BB_LTG_BlogPostController {

    @AuraEnabled
    public static List<BlogWrapper> SearchBlogs(String searchStr)
    {
		List<List<Blog_Post__c>> allObjs=[find :searchStr returning Blog_Post__c(id) limit 5];
		return setupBlogs(allObjs[0]);
    }
    
    @AuraEnabled
    public static List<BlogWrapper> GetBlogs()
    {
		return SetupBlogs(null);    
    }
    
    @AuraEnabled
    public static BlogWrapper NewComment(String blogIdStr, String name, String body)
    {
		Blog_Comment__c bc=new Blog_Comment__c(Blog_Post__c=blogIdStr,
                                               Name__c=name,
                                               Body__c=body,
                                               Posted__c=System.today());
		insert bc;
        List<BlogWrapper> bws=SetupBlogs(new List<Blog_Post__c>{new Blog_Post__c(Id=blogIdStr)});
        
        return bws[0];
    }
    
	private static List<BlogWrapper> SetupBlogs(List<Blog_Post__c> posts)
	{
		List<BlogWrapper> blogWrappers=new List<BlogWrapper>(); 
		
		String query='select id, Name, Content__c, Date_Posted__c, Author__r.Name, Small_Image_Id__c, Medium_Image_Id__c, Large_Image_Id__c, ' +
			   		' 	  (select Name__c, Email__c, Body__c, Posted__c from Blog_Comments__r order by Posted__c desc) ' +  
		   			'				from Blog_Post__c ' +
		   			'				where Status__c=\'Published\' ';
		if (null!=posts)
		{
			query+=' and id IN :posts ';
		}
		
		query+='				order by Date_Posted__c desc limit 5 ';
		
		List<Blog_Post__c> blogs=Database.query(query);

		for (Blog_Post__c blog : blogs)
		{
            System.debug('Record = ' + blog);
			BlogWrapper wrap=new BlogWrapper(blog);
			blogWrappers.add(wrap);
		}
        
        return blogWrappers;
	}
	
	public class BlogWrapper
	{
	    @AuraEnabled
		public Blog_Post__c blog {get; set;}
        
    	@AuraEnabled
		public Integer commentCount {get; set;}
        
        @AuraEnabled
        public String showHideText {get; set;}
		
		public BlogWrapper(Blog_Post__c inBlog)
		{
			blog=inBlog;
			commentCount=blog.Blog_Comments__r.size();
            showHideText='Show';
		}
	}
}