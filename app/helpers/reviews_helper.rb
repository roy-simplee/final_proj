module ReviewsHelper
  Clearbit.key = 'sk_6393bd43130aa6b31075510227f58cd9'

  def get_company_data(email_address)
    begin
      response = Clearbit::Enrichment.find(email: email_address)
      response.company
    rescue => e
      nil
    end
  end
end
