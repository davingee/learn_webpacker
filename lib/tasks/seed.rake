namespace :seed do

  desc 'redo'
  task :redo => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end

  desc "seed dev env"
  task :dev => :environment do
    c = Company.find_or_create_by(name: 'LeadPoint')
    u = c.users.find_or_initialize_by(email: 'scott.smith@leadpoint.com')
    u.password = '1fucker1'
    u.password_confirmation = '1fucker1'
    u.save
  
    p = u.projects.find_or_create_by(name: 'Creditcards')

    [ '866-039-1380', '235-237-9067', '655-250-7136' ].each_with_index do |account_id, i|
      a = p.accounts.find_or_create_by(name: "CCorg-#{ i }")
      a.account_id = account_id
      a.client_id                   = '1770982307-v1r75vg7m9p56vr14il6mfq72qftg7rn.apps.googleusercontent.com'
      a.client_secret               = 'URrQ8jpbxR1fQQroL_bXW4u3'
      a.refresh_token               = '1/qQjQiR-CYzqRuWVyXXUxDcS24pu8RfculHggvq9Phys'
      a.developer_token             = 'w89ovGS23F2RNixWRY_dqA'
      a.access_token                = 'ya29..vQLRFGR75AV3oaWhqIcKUgwJSy1upGtivjX5qM7qQa2UHGsa-Fo4yn5DRKO6BiAyMw'
      a.save
    end

  end

end
