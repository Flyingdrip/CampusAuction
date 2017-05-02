package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGoodsDAO;
import com.dao.TJingpaiDAO;
import com.model.TGoods;
import com.model.TJingpai;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class jingpaiAction extends ActionSupport
{
	private int jingpaiId;
	private int jingpaiJiage;
	private int jingpaiGoodsId;
	
	private String message;
	private String path;
	private TJingpaiDAO jingpaiDAO;
	private TGoodsDAO goodsDAO;
	
	public String jingpaiAdd()
	{
	List l=	jingpaiDAO.findByJingpaiGoodsId(jingpaiGoodsId);
	Map session= ServletActionContext.getContext().getSession();
	TUser user=(TUser)session.get("user");
		for (int i = 0; i < l.size(); i++) {
			TJingpai jingpais=(TJingpai)l.get(i);
			if(user.getUserId().toString().equals(jingpais.getJingpaiUserId())){
				//如果有以前他拍卖的 删掉拍卖信息
				jingpaiDAO.delete(jingpais);
			}
		}
		TJingpai jingpai=new TJingpai();
		jingpai.setJingpaiGoodsId(jingpaiGoodsId);
		jingpai.setJingpaiJiage(jingpaiJiage);
		jingpai.setJingpaiShijian(new Date().toLocaleString());
		
		
		jingpai.setJingpaiUserId(user.getUserId());
		
		jingpai.setDel("no");
		jingpaiDAO.save(jingpai);
		//更新竞拍最新价格
		TGoods t=goodsDAO.findById(jingpaiGoodsId);
		t.setPaijia(jingpaiJiage+"");
		goodsDAO.save(t);
		//删除以前自己的拍卖信息
		
		
		
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "竞拍成功");
		return ActionSupport.SUCCESS;
	}
	
	public String jingpaiByMe()
	{
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		String sql="from TJingpai where jingpaiUserId="+user.getUserId();
		List jingpaiList=jingpaiDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<jingpaiList.size();i++)
		{
			TJingpai jingpai=(TJingpai)jingpaiList.get(i);
			TGoods t=goodsDAO.findById(jingpai.getJingpaiGoodsId());
			String a=t.getPaijia();
			
			if(Integer.valueOf(a)>=jingpai.getJingpaiJiage()){
				//已经超出你的拍卖价格了！
				jingpai.setDel(jingpai.getJingpaiGoodsId()+"");
			}
			jingpai.setJingpaiGoodsName(t.getGoodsName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jingpaiList", jingpaiList);
		return ActionSupport.SUCCESS;
	}
	
	public String jingpaikan()
	{
		
		String sql="from TJingpai where jingpaiGoodsId="+jingpaiGoodsId;
		List jingpaiList=jingpaiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jingpaiList", jingpaiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public TJingpaiDAO getJingpaiDAO()
	{
		return jingpaiDAO;
	}
	public void setJingpaiDAO(TJingpaiDAO jingpaiDAO)
	{
		this.jingpaiDAO = jingpaiDAO;
	}
	public int getJingpaiGoodsId()
	{
		return jingpaiGoodsId;
	}
	public void setJingpaiGoodsId(int jingpaiGoodsId)
	{
		this.jingpaiGoodsId = jingpaiGoodsId;
	}
	public int getJingpaiId()
	{
		return jingpaiId;
	}
	public void setJingpaiId(int jingpaiId)
	{
		this.jingpaiId = jingpaiId;
	}
	public int getJingpaiJiage()
	{
		return jingpaiJiage;
	}
	public void setJingpaiJiage(int jingpaiJiage)
	{
		this.jingpaiJiage = jingpaiJiage;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}

	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}
	
}
