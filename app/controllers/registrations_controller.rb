class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      Pantry.create(user: resource, name: "#{resource.username}'s pantry") if resource.persisted?
    end
  end
end
