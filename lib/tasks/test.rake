VERSIONS = FileList["gemfiles/*.gemfile"].exclude("*.lock").collect do |version|
  File.basename(version, File.extname(version))
end

namespace :test do
  VERSIONS.each do |rails|
    desc "Run tests against Rails #{rails}"
    task :"rails-#{rails}" do
      sh "BUNDLE_GEMFILE='gemfiles/#{rails}.gemfile' bundle --quiet"
      sh "BUNDLE_GEMFILE='gemfiles/#{rails}.gemfile' bundle exec rake test"
    end
  end

  desc "Run tests against all Rails"
  task :"rails-all" do
    VERSIONS.each do |rails|
      Rake::Task["test:rails-#{rails}"].invoke
    end
  end
end
