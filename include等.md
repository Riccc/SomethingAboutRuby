##Rails的[include,prepend,extend,<]的一些个人理解

###1. include


module T 
def haha 
puts 'T.instance_method(haha)' 
end 
class A 
end 
end 
class B 
include T 
end 
class C < B 
end 
puts C.ancestors 
=>[C, B, T, Object, PP::ObjectMixin, Kernel, BasicObject] 
####C的继承链，可以看到include将module T放在了B的右边 
C.new.haha 
=>T.instance_method(haha) 
####这里可以看到C的实例方法里有haha方法，C继承于B，所以B的实例方法里也有haha方法，B include T ,可知include将来源类（这里指T，虽然是module，但module也是class哇）的实例方法作为目的类（B）的实例方法。 

###2.prepend


module T 
def haha 
puts 'T.instance_method(haha)' 
end 
class A 
end 
end 
class B 
prepend T 
end 
class C < B 
end 
puts C.ancestors #查看继承链 
=>[C, T, B, Object, PP::ObjectMixin, Kernel, BasicObject] 
####C的继承链，可以看到include将module T放在了B的右边 
C.new.haha 
=>T.instance_method(haha) 
####这里可以看到C的实例方法里有haha方法，C继承与B，所以B的实例方法里也有haha方法，B include T ,可知include将来源类（这里指T，虽然是module，但module也是class哇）的实例方法作为目的类（B）的实例方法。 

###3.extend


module T 
def haha 
puts 'T.instance_method(haha)' 
end 
class A 
end 
end 
class B 
extend T 
end 
class C < B 
end 
puts C.ancestors 
=>[C, B, Object, PP::ObjectMixin, Kernel, BasicObject] 
####从这儿可以看到，extend并不会对继承链产生影响 
C.haha 
=>T.instance_method(haha) 
####这儿跟上面两个例子有点区别，此时的haha方法是C的类方法了 

###4. <

之前学过一点点java，第一次接触到ruby的extend的时候，以为跟java的entend一样，后来才发现完全不同，ruby中真正的继承是用符号 ‘<’ 来实现的，至于ruby中的extend，目前我还不知道该用啥语言来描述，才疏学浅，希望以后能补充。