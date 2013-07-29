module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "My Small Goal").join(" - ")
      end
    end
  end
end
