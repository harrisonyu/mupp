class AddReasonNewName < ActiveRecord::Migration
  def up
    remove_column :reasons, :reason, :string
    add_column	:reasons, :relationship, :string
  end
end
