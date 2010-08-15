class ConsumerToken < ActiveRecord::Base
  #
  # associations
  #
  belongs_to :oauth_accessible, :polymorphic => true
  
  
  #
  # callback
  #
  before_validation :fix_provider
  
  
  #
  # callback methods
  #
  private
  
  def fix_provider
    self.provider = provider.to_s
  end
  
  
  #
  # named scopes
  #
  named_scope :for, Proc.new {|name| { :conditions => ["provider = ?", name.to_s] }}
  
end
