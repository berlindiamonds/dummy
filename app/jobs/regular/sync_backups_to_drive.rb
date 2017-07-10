module Jobs 
	class CreateBackup < Jobs::Base
		def execute(args)
	      BackupRestore.backup!(Discourse.system_user.id, publish_to_message_bus: false, with_uploads: SiteSetting.backup_with_uploads)
	    end
	end
end