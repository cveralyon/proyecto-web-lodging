class Report < ApplicationRecord
  belongs_to :reportSender, class_name: 'User', foreign_key: 'reportSender_id'
  belongs_to :reportReceiver, class_name: 'User', foreign_key: 'reportReceiver_id'
end
