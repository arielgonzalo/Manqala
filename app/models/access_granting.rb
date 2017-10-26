class AccessGranting < ApplicationRecord
  belongs_to :client
  belongs_to :library_access
end
