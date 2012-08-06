require_relative '../z_repositories/post_repo'
Repository.configure({
  Entry => EntriesRepo.new,
  Post => PostsRepo.new
})
THE_BLOG = Interactors::NewBlog[].blog
THE_BLOG.post_source = Repository.for(Post).public_method(:new)


