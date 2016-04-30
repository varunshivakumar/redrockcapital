class OwnsStock < ActiveRecord::Base
  belongs_to :account
  belongs_to :stock
  belongs_to :order
end
