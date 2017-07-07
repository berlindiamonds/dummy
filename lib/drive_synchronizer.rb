module DiscourseBackupToDrive
	class DriveSynchronizer

		def self.sync
			session = GoogleDrive::Session.from_config("client_secret.json")

			file = session.upload_from_file(selection, file_name, convert: false)
			folder_name = Time.new
			existent_folders = session.root_collection.subcollections
			found = session.root_collection.subcollection_by_title(folder_name)

			if found
			  found.add(file)
			else
			  folder = session.root_collection.create_subcollection(folder_name).add(file)
			end

		end
	end
end