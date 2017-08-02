FactoryGirl.define do
  factory :user do

    active false
    current_sign_in_at "2014-09-11T10:10 PDT"
    current_sign_in_ip ""
    sequence(:email) { |n| "person#{n}@example.com" }
    
    # email { "foo@example.com".downcase }
    # encrypted_password ""
    password 'testing'
    is_superuser true
    auth_token = 'test_env'
    last_sign_in_at "2014-08-25T14:14 PDT"
    last_sign_in_ip "ToFactory: RubyParser exception parsing this attribute"
    name "Joanna McFarland"
    permissions({"product" => [""], "product_reward" => [""], "campaign_group" => [""], "campaign" => [""], "campaign_bid" => [""], "report" => [""], "revenue_certainty" => [""], "analyzed_keyword" => [""], "metatags" => [""], "article" => [""], "author" => [""], "pixel" => [""], "site" => [""], "advertiser" => [""], "affiliate_network" => [""], "publisher" => [""], "user" => [""], "admin_api" => [""], "redirect_rule" => [""]}.with_indifferent_access)
    receive_auto_epc_notification true
    receive_ecpm_report true
    receive_feed_sync_notification true
    receive_position_change_report true
    remember_created_at "2013-08-07T21:27 PDT"
    reset_password_sent_at "2014-12-16T22:36 PST"
    sequence(:reset_password_token) { |n| "#{n}pXqM2psCy44DsdWE4HUb" }
    
    sign_in_count 80

  end
end
