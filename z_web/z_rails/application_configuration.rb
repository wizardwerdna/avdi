require_relative '../../z_repositories/in_memory_repos.rb'

Repository.configure({
  Entry => InMemoryRepos::EntriesRepo.new,
  Post =>  InMemoryRepos::PostsRepo.new
})

THE_BLOG = Interactors::NewBlog[].blog
