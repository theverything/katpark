namespace :db do
  desc "This does migrations on dev and test db's"
  task bp: ["db:migrate", "db:test:prepare"]
end
