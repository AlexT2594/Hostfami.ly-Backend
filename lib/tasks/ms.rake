task :ms do
	Rake::Task["db:migrate"].invoke()
	Rake::Task["db:seed"].invoke()
end