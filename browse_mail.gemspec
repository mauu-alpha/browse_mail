# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'browse_mail/version'

Gem::Specification.new do |spec|
  spec.name          = "browse_mail"
  spec.version       = BrowseMail::VERSION
  spec.authors       = ["Mauro Campillo"]
  spec.email         = ["mauro@restorando.com"]

  spec.summary       = "View your emails in the brwoser"
  spec.description   = "Provides a link to open your sent mails in the browser and to be shown correctly"
  spec.homepage      = "https://github.com/mauu-alpha/browse_mail"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ": Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails"
  spec.test_files = Dir["spec/**/*"]
end
