class Url < ActiveRecord::Base
  before_save(on: :create) do
    self.short = (0...7).map{ ('a'..'z').to_a[rand(26)] }.join
  end
  validates :long, presence: true, format: { with: /^(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)$/,
            message: "Must be a valid URL, including http://" }


end
