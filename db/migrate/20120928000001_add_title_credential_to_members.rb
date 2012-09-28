class AddTitleCredentialToMembers < ActiveRecord::Migration
  def change
    add_column :members, :title_credential, :string

  end
end
