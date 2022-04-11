class Message < ApplicationRecord
  belongs_to :messageSender, class_name: 'User', foreign_key: 'messageSender_id'
  belongs_to :messageReceiver, class_name: 'User', foreign_key: 'messageReceiver_id'
end
