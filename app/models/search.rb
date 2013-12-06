class Search < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zip, :latitude, :longitude

  geocoded_by :full_address
  after_validation :geocode, :if => (:address_changed? || :zip_changed? || :state_changed? || :city_changed?)

  def full_address
    result = ''
    result += self.address unless self.address.nil?
    result += ', ' + self.city unless self.city.nil?
    result += ', ' + self.state unless self.state.nil?
    result += ', ' + self.zip unless self.zip.nil?
    if(result.first(2) == ', ')
      result = result.from(2)
    end
    result
  end
end
