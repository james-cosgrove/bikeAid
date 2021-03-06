class LawFirmMailer < ApplicationMailer
  default from: 'notifications@bikeaid.com'

  def new_incident_report(law_firm, user, incident_report)
    @law_firm = law_firm
    @user = user
    @incident_report = incident_report
    @location = @incident_report.address.split(' ').join('+') + '+' + @incident_report.city.split(' ').join('+') + '+' + @incident_report.state.split(' ').join('+')
    mail(to: @law_firm.email, subject: "New Incident Report")
  end

end
