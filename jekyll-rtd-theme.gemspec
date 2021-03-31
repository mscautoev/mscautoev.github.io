Gem::Specification.new do |spec|
  spec.name          = "MSC AutoEV"
  spec.version       = "0.0.1"
  spec.authors       = ["mscautoev"]
  spec.email         = ["mscautoev@gmail.com"]

  spec.summary       = "Autonomous Electric Vehicle Team, MSC KAIST"
  spec.license       = "MIT"
  spec.homepage      = "https://mscautoev.github.io/"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "github-pages", "~> 209"
end
