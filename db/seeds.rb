if Rails.env.development?
  AdminUser.where(email: "admin@example.com").first_or_initialize.tap do |admin|
    admin.password = "password"
    admin.password_confirmation = "password"
    admin.save!
  end
end

PageContent.find_or_create_by(name: "about")
PageContent.find_or_create_by(name: "contact")
