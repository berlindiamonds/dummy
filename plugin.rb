# name: dummy-plugin
# about: A super simple plugin to see how to implement a new backup plugin
# version: 0.0.1
# authors: kaja

require 'google_drive'
require 'sidekiq'


enabled_site_setting :details_enabled

require 'google_drive'


after_initialize do 

	load File.expand_path("../app/jobs/regular/sync_backups_to_drive.rb", __FILE__)
	load File.expand_path("../lib/drive_synchronizer.rb", __FILE__)

	Backup.class_eval do
		def after_create_hook
			puts "==============================="
			Jobs.enqueue(:sync_backups_to_drive)
			puts "job created"
		end
	end
end

