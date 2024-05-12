# frozen_string_literal: true

require_relative "lib/wallhavened/version"

Gem::Specification.new do |spec|
  spec.name = "wallhavened"
  spec.version = Wallhavened::VERSION
  spec.authors = ["Remigiusz Micielski"]
  spec.email = ["rmicielski@purelymail.com"]
  spec.summary = "Scrapes wallhaven"

  # spec.description = "TODO: Write a longer description or delete this line."
  # spec.homepage = "TODO: Put your gem's website or public repo "
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "wallhavaned", "~> 1.0"
  spec.add_runtime_dependency "rake", "~> 13.0"
  spec.add_runtime_dependency "minitest", "~> 5.16"
  spec.add_runtime_dependency "open-uri"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "rdoc"
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "cli-ui"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
