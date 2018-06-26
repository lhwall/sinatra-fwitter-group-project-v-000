class User < ActiveRecord::Base
    has_many :tweets
      has_secure_password
      validates_presence_of :name, :email, :password

      def slug
  slug = ""
  #binding.pry
  self.username.to_s.split("").each do |character|
    if character.match(/[a-zA-Z\d]/)
      slug << character.downcase
    elsif character.match(/\s/)
      slug << "-"
    end
  end
  slug
end

def self.find_by_slug(entry)
  value = nil
  self.all.each do |item|
    if item.slug == entry
      value = item
    end
  end
  value
end

end
