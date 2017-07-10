require "google_drive"


module DiscourseBackupToDrive
	class DriveSynchronizer

		def self.sync
			session = GoogleDrive::Session.from_config("client_secret.json")

			local_backup_files = Backup.all.map(&:filename).take(SiteSetting.discourse_backups_to_drive_quantity)

			folder_name = Time.new
			existent_folders = session.root_collection.subcollections
			found = session.root_collection.subcollection_by_title(folder_name)

			if found
			  found.add(local_backup_files)
			else
			  folder = session.root_collection.create_subcollection(folder_name).add(local_backup_files)
			end

		end
	end
end