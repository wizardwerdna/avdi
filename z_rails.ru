#!/usr/bin/env rackup
# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../z_rails/main',__FILE__)
run Bloog::Main.new
