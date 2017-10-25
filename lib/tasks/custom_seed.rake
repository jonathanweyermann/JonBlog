# lib/tasks/custom_seed.rake
# rake db:seed:dump MODELS=Category,Comment,Post FILE=db/seeds/posts.rb
# rake db:seed:posts
# production - RAILS_ENV=production rake db:seed:dump MODELS=Category,Comment,Post FILE=db/posts.rb
namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/*.rb`"
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
