class MailgunHelper
  require 'mailgun'
  @mg_client = Mailgun::Client.new "key-82959cfb8dde3dd9be2a7b30d0c46afa"

  def get_email(email)
    catch_all
    stop
  end
end