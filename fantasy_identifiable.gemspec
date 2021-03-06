# lib = File.expand_path("../lib", __dir__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/fantasy_identifiable/version"

Gem::Specification.new do |spec|
  spec.name          = "fantasy_identifiable"
  spec.version       = FantasyIdentifiable::VERSION
  spec.authors       = ["Alexander Rusa"]
  spec.email         = ["alex@rusa.at"]
  spec.summary       = "Create unique fantasy names as identifier for your activerecord objects"
  spec.description   = "This gem allows you to create unique readable fantasy names as identifiers for your active record objects. You can also define multiple identifier columns and alternatively use a UUID or Devise.friendly_token as identifier."
  spec.homepage      = "https://github.com/arusa/fantasy_identifiable"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/arusa/fantasy_identifiable"
    spec.metadata["changelog_uri"] = "https://github.com/arusa/fantasy_identifiable/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["lib/**/*", "LICENSE.txt", "Rakefile", "README.md"]

  spec.add_dependency 'activerecord', '>= 6.0.0'
  spec.add_dependency 'activesupport', '>= 6.0.0'
  spec.add_dependency 'faker'
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'sqlite3'
end
