require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = 'test/**/test_*.rb'
  t.warning = true
  t.verbose = true
end

task :default => 'test:all'

namespace :test do
  %w(sprockets_37 sprockets_40).each do |gemfile|
    desc "Run Tests against #{gemfile}"
    task gemfile do
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle exec rake -t test"
    end
  end

  desc 'Run Tests against sprockets 3.7 and 4.0'
  task :all do
    %w(sprockets_37 sprockets_40).each do |gemfile|
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle exec rake -t test"
    end
  end
end
