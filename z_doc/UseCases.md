# Use Cases

* PublishBlog(title: `<title>`, subtitle: `<subtitle>`)

	Publish a new blog, having the specified parameters. Assign the blog an entity-id.  Response(..., blog_id: `<blog-id>`)

* PublishPost.new(blog_id: `<blog-id>`, title: `<title>`, body: `<body>`, tags: `<tags-list-string>`)

	  Publish a post, having `<title>`, `<body>` and `<taglist>` in `<blog>`.  Assign the post an entity-id.  Response(..., post_id: `<post_id>)

	  **Alternative 1:** If post parameters are not valid, share errors and do nothing else.  Response(..., errors: `<errors>`)

* RetrieveAllPosts.new(blog_id: `<blog_id`, tags: `<tag-list-string>`)

    Obtain a list of all posts for the blog, filtered by any specified tags.  Response(..., posts: `<list-of-posts>`)

    **Alternative 1:** If blog parameter is invalid, raise an error.

* RetrieveAllTags.new(blog_id: `<blog_id>`)  <tags-list-string>`)

    Obtain a list of all tags for all posts.  Response(tags: `<taglist>`)
