class RenamePirofleToProfileInUsers < ActiveRecord::Migration[6.1]
    def change
        rename_column :users, :pirofle, :profile
    
    end
end


