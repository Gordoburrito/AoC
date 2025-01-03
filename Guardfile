# Configure Guard for Ruby/RSpec testing
# More info at https://github.com/guard/guard#readme

# Watch all day-* directories automatically
# directories Dir['day_*']

guard :rspec, cmd: "bundle exec rspec" do
  # Watch the spec directory
  watch(/spec\/.+_spec\.rb/)

  # Watch Ruby files in day-* directories and run corresponding specs
  watch(%r{^day-(\d+)/(.+)\.rb$}) { |m| "spec/day-#{m[1]}_spec.rb" }

  # Watch spec helper
  watch('spec/spec_helper.rb') { "spec" }
end
