require 'bundler/deployment'
 
 Capistrano::Configuration.instance(:must_exist).load do
   after "deploy:update_code", "bundle:install"
   after "deploy:finalize_update", "bundle:install"
   Bundler::Deployment.define_task(self, :task, :except => { :no_release => true })
   set :rake, lambda { "#{fetch(:bundle_cmd, "bundle")} exec rake" }
 end