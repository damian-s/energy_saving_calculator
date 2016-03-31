set :deploy_to, '/home/deploy/apps/pv_manager.mobilityhouse.com'

set :stage, :production
set :keep_releases, 10
role :app, %w{pv_manager.mobilityhouse.com}
role :web, %w{pv_manager.mobilityhouse.com}
role :db,  %w{pv_manager.mobilityhouse.com}

set :ssh_options, { user: 'deploy', forward_agent: true }
