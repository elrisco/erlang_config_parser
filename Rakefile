require "bundler/gem_tasks"
# require "rspec/core/rake_task"
require "rake/testtask"

# RSpec::Core::RakeTask.new(:spec)
# task :default => :spec

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end
desc "Run tests"

desc "Compile parser"
task :compile do
  Bundler.with_clean_env do
    base_dir = File.expand_path("../lib/erlang_config_parser", __FILE__)
    dst_path = File.join(base_dir, "parser.rb")
    src_path = File.join(base_dir, "parser.ry")
    system("bundle exec racc -g -o #{dst_path} #{src_path}")
  end
end
