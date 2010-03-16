module Mongoid
  module Cleaner
    def self.truncate
      db = Mongoid.database
      db.collections.each do |c|
        next if c.name =~ /^system\./
        c.drop_indexes
        c.drop
      end
    end
  end
end

Rspec.configure { |config| 
  config.before(:each) do
    Mongoid::Cleaner.truncate
  end
}
