Rake::Task["assets:precompile"].clear
namespace :assets do
  task 'precompile' do
      puts "Skipping pre-compiling assets..."
  end
end

Rake::Task["assets:clean"].clear
namespace :assets do
  task 'clean' do
      puts "Skipping cleaning precompiled assets..."
  end
end
