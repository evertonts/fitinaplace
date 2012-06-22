class InterestMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def alert_interest (negociation)
    @offering = Offering.find negociation.offering_id
    @to = User.find @offering.user_id
    @user = User.find negociation.user_id
    mail(:to => @to.email, :subject => "[Fit in Place] Oferta #{negociation.offering_id}: Usuario interessado")
  end
  
  def alert_reserve (negociation)
    @to = User.find negociation.user_id
    @offering = Offering.find negociation.offering_id
    mail(:to => @to.email, :subject => "[Fit in Place] Oferta #{negociation.offering_id}: Reserva confirmada")
  end
end
