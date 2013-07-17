class Url < ActiveRecord::Base
  before_save(on: :create) do
    self.short = (0...7).map{ ('a'..'z').to_a[rand(26)] }.join
  end
end
