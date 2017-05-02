package test;
import java.io.UnsupportedEncodingException;
import java.sql.*;
public class accessMySql {
		public static void main(String[] args) throws SQLException, UnsupportedEncodingException {
			//声明Connection对象
			Connection con = null;
			//驱动程序名
			String driver = "com.mysql.jdbc.Driver";
			//URL指向要访问的数据库名mydata
			String url = "jdbc:mysql://localhost:3306/xmupaimai_db";
			//MySQL配置时的用户名
			String user = "root";
			//MySQL配置时的密码
			String password = "123456";
			//遍历查询结果集
			ResultSet rs = null;
			try {
				//加载驱动程序
				Class.forName(driver);
				//1.getConnection()方法，连接MySQL数据库！！
				con = DriverManager.getConnection(url,user,password);
				if(!con.isClosed())
					System.out.println("Succeeded connecting to the Database!");
				//2.创建statement类对象，用来执行SQL语句！！
				Statement statement = con.createStatement();
				//要执行的SQL语句
				String sql = "select * from t_catelog";
				//3.ResultSet类，用来存放获取的结果集！！
				rs = statement.executeQuery(sql);
				String catelog_id = null;
				String catelog_name = null;
				while(rs.next()){
					//获取stuname这列数据
					catelog_id = rs.getString("catelog_id");
					//获取stuid这列数据
					catelog_name = rs.getString("catelog_name");
					//首先使用ISO-8859-1字符集将name解码为字节序列并将结果存储新的字节数组中。
					//然后使用GB2312字符集解码指定的字节数组。
					//输出结果
					System.out.println(catelog_id + "\t" + catelog_name);
				}
			} catch(ClassNotFoundException e) {   
				System.out.println("error");
				e.printStackTrace();
			}finally{
				System.out.println("数据库数据成功获取！！");
				rs.close();
				con.close();
			}
		}
}
