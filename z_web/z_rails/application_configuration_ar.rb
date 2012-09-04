require_relative '../../z_repositories/active_record_repos'


Repository.configure({
  Entry => ActiveRecordRepos::EntriesRepo.new,
  Post =>  ActiveRecordRepos::PostsRepo.new
})

THE_BLOG = Interactors::NewBlog[].blog

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  encoding: 'unicode',
  database: 'z_rails_development',
  pool: 5,
  username: 'werdna'
})

