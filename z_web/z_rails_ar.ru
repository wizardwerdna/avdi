#!/usr/bin/env rackup
# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../z_web/z_rails/main_ar',__FILE__)
run Bloog::RackResponder.new
