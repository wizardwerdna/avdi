# Use Cases

* NewBlog.new

	Create a new blog.  Response(blog: `<blog>`)

* NewPost.new(blog: `<blog>`, title: `<title>`, body: `<body>`)

	  Create an unpublished blog post for `<blog>`, having `<title>` and `<body>`. Response(blog: `<blog>`, post: `<post>`)

	  **Alternative 1:** If `<title>` or `<body>` are null or not given, they will be treated as empty strings.
			
    **Alternative 2:** If `<blog>` is null, not given or not a Blog object, an error condition is raised and nothing else is done.

* PublishPost.new(blog: `<blog>`, title: `<title>`, body: `body`)

	  Publish a post, having `<title>` and `<body>` in `<blog>`.  Response(post: `<post>`)

	  **Alternative 1:** If post parameters are not valid, share errors.  Response(post: `<post>`, errors: `<errors>`)

    **Alternative 2:** If `<blog>` is null, not given or not a Blog object, an error condition is raised and nothing else is done.

