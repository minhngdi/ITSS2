class CreateAverageCaches < ActiveRecord::Migration[5.1]
  def change
    create_table :average_caches do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, :polymorphic => true
      t.float :avg, :null => false
      t.timestamps
    end

    #add_index :average_caches, [:rater_id, :rateable_id, :rateable_type]
    add_index :average_caches, [:rater_id, :rateable_id]
    add_index :average_caches, [:rateable_type]
  end
end
