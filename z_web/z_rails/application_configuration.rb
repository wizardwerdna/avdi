require_relative '../../z_repositories/in_memory_repos.rb'

THE_BLOG = Interactors::NewBlog[].blog

Repository.configure({
  Entry => InMemoryRepos::EntriesRepo.new,
  Post =>  InMemoryRepos::PostsRepo.new
})