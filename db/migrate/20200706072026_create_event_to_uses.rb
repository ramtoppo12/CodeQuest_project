class CreateEventToUses < ActiveRecord::Migration[6.0]
  def change
    create_table :event_to_uses do |t|
      t.string :title

      t.timestamps
    end
  end
end
