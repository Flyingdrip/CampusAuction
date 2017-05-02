package com.action;

/**
 * Action在MVC模式中扮演的是Controller
 * 用户请求和业务逻辑之间的桥梁
 * 充当客户的业务代理：
 */
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.dao.TAdminDAO;
import com.model.TAdmin;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class adminAction extends ActionSupport {
	/**
	 * 理论上Struts2.0的Action无须实现任何接口或继承任何类型
	 * 但是，我们为了方便实现Action，大多数情况下都会继承com.opensymphony.xwork2.ActionSupport类
	 * 并重载（Override）此类里的String execute()方法。
	 */	
	private int userId;//用户ID
	private String userName;//用户名
	private String userPw;//密码
	private String message;//根据处理结果返回的字符串
	private String path;//路径？？
	private int index = 1;//？？
	private TAdminDAO adminDAO;//Data Access Object数据访问对象，是一个面向对象的数据库接口，夹在业务逻辑和数据库资源中间

	public String adminAdd() {
		/**
		 * 增加一个管理员，对应处理adminAdd.action
		 */
		TAdmin admin = new TAdmin();//”管理员“的对象模型
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		adminDAO.save(admin);
		this.setMessage("操作成功");
		this.setPath("adminManage.action");
		return "succeed";
	}

	public String adminManage() {
		List adminList = adminDAO.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);
		return ActionSupport.SUCCESS;
	}

	public String adminManageFenye() {
		List adminList = adminDAO.findAll();
		int pageSize = 3;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();// 创建 分页对象
		p.setIndex(index);// 设置页数
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());// 设置总共的条数
		p.setData(adminListFenye);// 设置数据
		p.setPath("adminManageFenye.action?");// 跳转的路径

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String adminDel() {
		adminDAO.delete(adminDAO.findById(userId));
		this.setMessage("删除成功");
		this.setPath("adminManage.action");
		return "succeed";
	}

	public TAdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(TAdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public String getMessage() {
		return message;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
}
