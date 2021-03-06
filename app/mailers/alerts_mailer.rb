class AlertsMailer < ActionMailer::Base
  default :from => 'mappinginfo@interaction.org'

  def projects_about_to_end(contact_email, projects)
    @projects = projects
    mail(:to => contact_email, :subject => "[NGO Aid Map] Projects about to end!")
  end

  if Rails.env.development?
    class Preview < MailView

      def projects_about_to_end
        contact_email = 'fer@ferdev.com'
        projects = Project.first(6).map do |project|
          {
            :id           => project.id,
            :name         => project.name,
            :country_name => project.countries.map(&:name).join(', ').presence || 'Spain',
            :end_date     => project.end_date.to_date
          }
        end
        AlertsMailer.projects_about_to_end(contact_email, projects)
      end
    end
  end
end
