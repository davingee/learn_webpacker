class BidManagement < ApplicationRecord
  self.table_name = 'keyword_work'
  establish_connection("tracker_bid_#{ Rails.env == 'production' ? 'production' : 'staging'}".to_sym)

  belongs_to :account, foreign_key: :site_id
  belongs_to :project, foreign_key: :site_id
end
