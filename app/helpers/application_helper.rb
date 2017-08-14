module ApplicationHelper
  def format_due_date(object)
    if object.respond_to? :due_date
      date = object.due_date
    else
      date = object.calculate_due_date
    end
    date.strftime("%A, %B %e")
  end
end
