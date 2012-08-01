THE_BLOG = Blog.new

THE_BLOG.post_source = Post.public_method(:new)

THE_BLOG.new_post({
  title: "Paint just applied",
  body: "Paint just applied.  Its a lovely orangey-purple!"
}).publish
THE_BLOG.new_post({
  title: "Still wet", 
  body: "Paint is still quite wet.  No bubbling yet!"
}).publish
