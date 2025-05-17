require 'csv'

namespace :hexlet do
  desc 'Import users from .csv'
  task :import_users, [:file_path] => :environment do |t, args|
    puts "Импорт из файла: #{args[:file_path]}"
    CSV.foreach(args[:file_path], headers: true) do |row|
      data = row.to_hash
      data['birthday'] = Date.strptime(data['birthday'], '%m/%d/%Y') if data['birthday'].present?

      User.create! data
    end
  end
end
