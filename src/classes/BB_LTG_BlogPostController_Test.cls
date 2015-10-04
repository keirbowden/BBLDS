@isTest
private class BB_LTG_BlogPostController_Test {
    @TestSetup
    static void Setup() {
        Blog_Post__c post=new Blog_Post__c(Name='Test',
                                           Content__c='Test',
                                           Status__c='Published');
        insert post;
    }
        
	@isTest
    static void TestGetBlogs() {
        List<BB_LTG_BlogPostController.BlogWrapper> wrappers=BB_LTG_BlogPostController.GetBlogs();
        System.assertEquals(1, wrappers.size());
        System.assertEquals('Test', wrappers[0].blog.Name);
        System.assertEquals(0, wrappers[0].CommentCount);
        System.assertEquals('Show', wrappers[0].showHideText);
    }

	@isTest
    static void TestSearchBlogsFail() {
        List<BB_LTG_BlogPostController.BlogWrapper> wrappers=BB_LTG_BlogPostController.SearchBlogs('Spim');
        System.assertEquals(0, wrappers.size());
    }

	@isTest
    static void TestAddComment() {
        List<BB_LTG_BlogPostController.BlogWrapper> wrappers=BB_LTG_BlogPostController.GetBlogs();
		BB_LTG_BlogPostController.NewComment(wrappers[0].blog.Id, 'Name', 'Body');
        wrappers=BB_LTG_BlogPostController.GetBlogs();
        System.assertEquals(1, wrappers[0].CommentCount);
    }
}