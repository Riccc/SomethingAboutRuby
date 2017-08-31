##Heroku使用

这是一个可以实现自动部署的平台，将个人的应用推到heroku就可以实现应用的部署

操作步骤（Rails应用）

###1.

注册heroku

###2.

gem install heroku

###3.

创建heroku远程仓库 => heroku create "仓库名"

###4.

仓库创建后会自动添加好远程仓库，推代码到对应仓库，会看到他安装gem的过程

###5.

执行migration => heroku run rake db:migrate

###6.

上述没问题的话就执行heroku open,会自动打开你部署的应用网页

###注意事项

heroku是用pg的，数据库得对应好