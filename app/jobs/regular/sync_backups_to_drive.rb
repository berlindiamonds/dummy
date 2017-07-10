require 'google_drive'
require 'sidekiq'
module Jobs 

	class SyncBackupToDrive < Jobs::Base

		sidekiq_options queue: 'low'

		def execute(args)
      		::DiscourseBackupToDrive::DriveSynchronizer.sync if SiteSetting.discourse_backups_to_drive_enabled
	    end
	end
end