var t;
t=outlookbar.addtitle('系统属性')
outlookbar.additem('系统属性',t,'/xmupaimai/auser/index/sysPro.jsp')


t=outlookbar.addtitle('我发布的商品')
outlookbar.additem('发布商品',t,'/xmupaimai/auser/goods/goodsAddByMe.jsp')
outlookbar.additem('我发布的商品',t,'/xmupaimai/goodsManaByMe.action')


t=outlookbar.addtitle('我参与竞拍的商品')
outlookbar.additem('我参与竞拍的商品',t,'/xmupaimai/jingpaiByMe.action')

t=outlookbar.addtitle('安全退出系统') 
outlookbar.additem('安全退出',t,'/xmupaimai/userLogout.action')