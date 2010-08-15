class CreateConsumerTokens < ActiveRecord::Migration
  def self.up
    create_table :consumer_tokens do |t|
      t.string  :oauth_accessible_type, :null => false, :limit => 30
      t.integer :oauth_accessible_id,   :null => false
      
      t.string  :type,     :null => false, :limit =>   30
      t.string  :provider, :null => false, :limit =>   50
      t.string  :token,    :null => false, :limit => 1024
      t.string  :secret,   :null => false, :limit =>  255
      t.timestamps
    end
  end

  def self.down
    drop_table :consumer_tokens
  end
end
