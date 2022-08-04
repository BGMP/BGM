routes = case BGM::Application.bgm_role
         when 'bgm'
           %w(application user)
         when 'api'
           %w(api)
         else
           raise "Unknown BGM_ROLE: #{BGM::Application.bgm_role}"
         end

routes.each do |r|
  load "config/routes/#{r}.rb"
end
