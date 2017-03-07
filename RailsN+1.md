##Rails N+1查询及解决方式

Rails在module层建立关联后，进行关联查询时会出现N+1查询的情况

```ruby
class Post < ApplicationRecord
  has_many :comments
end

class Comment < ApplicationRecord
  belongs_to :post
end

> Post.count
(0.1ms)  SELECT COUNT(*) FROM "posts"
=> 4

> Post.all.map{|post| post.comments}
  Post Load (0.3ms)  SELECT "posts".* FROM "posts"
  Comment Load (0.2ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ?  [["post_id", 1]]
  Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ?  [["post_id", 2]]
  Comment Load (0.6ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ?  [["post_id", 3]]
  Comment Load (0.6ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ?  [["post_id", 4]]
```
`一共有4个查询结果，但是却查询了5次，这个就出现了N+1查询`

##解决方式

ActiveRecord提供了对module层预加载的功能

分别为

* `includes`
* `preload`
* `eager_load`

```ruby
> Post.includes(:comments).map{|post| post.comments}
  Post Load (0.2ms)  SELECT "posts".* FROM "posts"
  Comment Load (0.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" IN (1, 2, 3, 4)
```
`更优雅的方式参见gem goldiloader`

