desc "tasks to help keep the codebase clean"
task :tidy => ['tidy:lint']

namespace :tidy do
  desc "runs SwiftLint"
  task :lint do
    puts "Running SwiftLint..."
    if !system("which swiftlint")
      STDERR.puts "warning: SwiftLint not installed; run `brew install swiftlint`"
      exit 1
    end
    if !system("swiftlint lint --strict")
      STDERR.puts "SwiftLint detected issues."
      exit 2
    end
  end
end
