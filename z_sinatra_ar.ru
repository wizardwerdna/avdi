#!/usr/bin/env rackup
# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../z_sinatra/main_ar', __FILE__)
run Bloog::Main.new
