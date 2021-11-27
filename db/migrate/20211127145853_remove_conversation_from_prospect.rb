class RemoveConversationFromProspect < ActiveRecord::Migration[6.1]
  def change
    remove_column :prospects, :conversation, :string
  end
end
