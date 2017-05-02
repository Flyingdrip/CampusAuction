package com.action;

/**
 * Action��MVCģʽ�а��ݵ���Controller
 * �û������ҵ���߼�֮�������
 * �䵱�ͻ���ҵ�����
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
	 * ������Struts2.0��Action����ʵ���κνӿڻ�̳��κ�����
	 * ���ǣ�����Ϊ�˷���ʵ��Action�����������¶���̳�com.opensymphony.xwork2.ActionSupport��
	 * �����أ�Override���������String execute()������
	 */	
	private int userId;//�û�ID
	private String userName;//�û���
	private String userPw;//����
	private String message;//���ݴ��������ص��ַ���
	private String path;//·������
	private int index = 1;//����
	private TAdminDAO adminDAO;//Data Access Object���ݷ��ʶ�����һ�������������ݿ�ӿڣ�����ҵ���߼������ݿ���Դ�м�

	public String adminAdd() {
		/**
		 * ����һ������Ա����Ӧ����adminAdd.action
		 */
		TAdmin admin = new TAdmin();//������Ա���Ķ���ģ��
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		adminDAO.save(admin);
		this.setMessage("�����ɹ�");
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

		Pagination p = new Pagination();// ���� ��ҳ����
		p.setIndex(index);// ����ҳ��
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());// �����ܹ�������
		p.setData(adminListFenye);// ��������
		p.setPath("adminManageFenye.action?");// ��ת��·��

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String adminDel() {
		adminDAO.delete(adminDAO.findById(userId));
		this.setMessage("ɾ���ɹ�");
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
