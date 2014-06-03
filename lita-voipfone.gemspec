Gem::Specification.new do |spec|
  spec.name          = "lita-voipfone"
  spec.version       = "0.0.1"
  spec.authors       = ["Ed Jones"]
  spec.email         = ["hosting@errorstudio.co.uk"]
  spec.description   = %q{A handler for Lita which integrates with your Voipfone account}
  spec.summary       = %q{A handler for Lita which integrates with your Voipfone account}
  spec.homepage      = "http://www.errorstudio.co.uk"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.2"
  spec.add_runtime_dependency "voipfone_client", "0.3.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta2"
end
