var t;
t=outlookbar.addtitle('系统属性')
outlookbar.additem('系统属性',t,'/xmupaimai/admin/index/sysPro.jsp')


t=outlookbar.addtitle('基本操作')
outlookbar.additem('密码修改',t,'/xmupaimai/admin/userinfo/userPw.jsp')
outlookbar.additem('管理员维护',t,'/xmupaimai/adminManage.action')


t=outlookbar.addtitle('注册用户管理')
outlookbar.additem('注册用户',t,'/xmupaimai/userMana.action')


t=outlookbar.addtitle('商品类别管理')
outlookbar.additem('商品类别管理',t,'/xmupaimai/catelogMana.action')


t=outlookbar.addtitle('商品管理')
outlookbar.additem('商品管理',t,'/xmupaimai/goodsManaByAd.action')


t=outlookbar.addtitle('留言管理')
outlookbar.additem('留言管理',t,'/xmupaimai/liuyanMana.action')


t=outlookbar.addtitle('公告管理')
outlookbar.additem('公告管理',t,'/xmupaimai/gonggaoMana.action')




t=outlookbar.addtitle('安全退出系统') 
outlookbar.additem('安全退出',t,'/xmupaimai/login.jsp')