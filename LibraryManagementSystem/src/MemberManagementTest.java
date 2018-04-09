
import junit.framework.TestCase;

import java.util.List;

import com.zensar.lms.dao.UserDAOimpl;
import com.zensar.lms.entity.UserManagementEntity;

import junit.framework.Assert;

public class MemberManagementTest {
	UserDAOimpl userProcessor;
	UserManagementEntity um= new UserManagementEntity();
	
@Before
	public void beforeSearchMember()
	{
		System.out.println("Run before SearchMember");
		userProcessor=new UserDAOimpl();
	}
	@Test
	public void searchMember() throws Exception
	{
		List<List<String>> UserList=userProcessor.getMemberData("Neha");
	Assert.assertEquals("Neha", UserList);
		/*if(UserList.size()==1)
		{
			System.out.println("No data found");
		}
		else
		{
			System.out.println("Data Fetched");
		}
	}*/
	}
	public void insetTestCase() throws Exception
	{
		List<List<String>> UserList=userProcessor.insertInDatabase("um");
		if(UserList.size()==1)
		{
			System.out.println("No data found");
		}
		else
		{
			System.out.println("Data Fetched");
		}
	}

	@After
	public void afterSearchMember()
	{
		System.out.println("After test method of SearchMember");
	}
}
