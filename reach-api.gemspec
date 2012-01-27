# -*- encoding: utf-8 -*-
require File.expand_path '../lib/reach/version', __FILE__

Gem::Specification.new do |gem|
  gem.name        = "reach-api"
  gem.version     = Reach::Version.to_s
  gem.authors     = ["Andrew Stewart"]
  gem.email       = ["andrew@averagestudios.com"]
  gem.homepage    = "https://github.com/stewart/reach-api"
  gem.summary     = %q{A wrapper for the Halo Reach stats API}
  gem.description = %q{A Ruby wrapper for Bungie's Halo Reach
                       stats API. Returns all API responses as
                       Ruby hashes.}

  gem.rubyforge_project = "reach-api"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "httparty", "~> 0.8.1"
  gem.add_dependency "json", "~> 1.6.5"

  gem.add_development_dependency "guard-rspec", "~> 0.6.0"
  gem.add_development_dependency "simplecov", "~> 0.5.4"
  gem.add_development_dependency "webmock", "~> 1.7.10"
  gem.add_development_dependency "rspec", "~> 2.8.0"
  gem.add_development_dependency "guard", "~> 1.0.0"
  gem.add_development_dependency "rake", "~> 0.9.2.2"
  gem.add_development_dependency "vcr", "~> 1.11.3"

end
