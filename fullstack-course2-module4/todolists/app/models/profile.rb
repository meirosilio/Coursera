class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_or_last_name
  validates :gender, inclusion: ['male', 'female']
  validate :males_to_have_sue

  private
  def first_name_or_last_name
    if first_name.nil? && last_name.nil?
      errors.add(:base, "You need to have at least first name")
    end
  end


  private
  def males_to_have_sue
    forbidan_name=first_name.downcase
    if gender.eql?("male") && forbidan_name.eql?("sue")
      errors.add(:base, "You are male, you can not named Sue")
    end
  end

  def self.get_all_profiles(min_birth_year, max_birth_year)
    Profile.where("birth_year BETWEEN :min_birth_year AND :max_birth_year",
                  min_birth_year: min_birth_year,
                  max_birth_year: max_birth_year).order(birth_year: :asc)
  end
end
