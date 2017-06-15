##Ruby中scope产生的结果集

###
模型的scope查询的结果集中，使用a.name的方式无法取得不属于该module的属性，即便该字段的的值在scope的查询结果中存在，但使用a[:name]的方式可以取得该值。