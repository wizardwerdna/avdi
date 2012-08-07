require_relative '../z_repositories/active_record_repos'

THE_BLOG = Interactors::NewBlog[].blog

Repository.configure({
  Entry => ActiveRecordRepos::EntriesRepo.new(THE_BLOG),
  Post =>  ActiveRecordRepos::PostsRepo.new
})

THE_BLOG.post_source = Repository.for(Post).public_method(:new)

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  encoding: 'unicode',
  database: 'z_rails_development',
  pool: 5,
  username: 'werdna'
})

