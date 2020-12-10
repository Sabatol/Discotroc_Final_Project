# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/new
  def new
    ContactMailer.new
  end

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/create
  def create
    ContactMailer.create
  end

end
