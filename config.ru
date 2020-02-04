require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #Need this to be able to use the Patch 
run ApplicationController
use TasksController
use SessionsController
use UsersController
