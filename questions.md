###1.Proc与lanbda的区别
      return对两者的定义不同，proc的return是从proc的作用域内return，
      而lambda的return仅从这个lambda中return；lambda对参数检查比Proc严格
      
      
###2.n+1查询问题及解决
     在rails的模型中，一对多模型的查询里，查询次数会比数据条数多一次；
     Post.includes(:comments).map{|post| post.comments}
     用includes的方式可以解决
     gem Goldiloader默认自动加载所有关联数据，用auto_include: false可以方便地关闭自动加载。
  
###3.string与symbol区别
		object_id的区别
		
###4.class与module的区别
		class可以实例化，但是module不行
		class是使用<作为继承的关键字，只支持单继承
		module是使用include来做实例继承（实例化的时候动态功能插入），
		extend做类继承（可以理解为static继承）  
		
###5.ruby中method的调用过程
		先找到这个对象的类，查找方法，若没有则顺着继承链查找，直至object类

###6.include与extend的区别
		include会将类加在继承链中被include module的后面，extend不会对继承链产生影响	
		module A
		  def a
		  end
		end
		
		class B
		  include A
		end
		B.new.a
		
		module A
		  def a
		  end
		end
		
		class B
		   extend A
		end
		B.a
		
###7.a||=b
		a存在则为a，不存在则为b
		
###8.set
		set是无序的集合，array是有序的，且set的存储是使用hash结构的存储，
		所以在元素查找的时间上会优于array，但需要牺牲存储空间
		set合并时无重复元素，数组会有重复元素
						     
		  
		  
		