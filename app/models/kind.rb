class Kind < ApplicationRecord
  has_many :contacts, :dependent => :destroy
end
