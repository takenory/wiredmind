require "spec_helper"

describe "routes for 'root path'" do
  it { {get: "/"}.should route_to(controller: "canvas", action: "index") }
end
