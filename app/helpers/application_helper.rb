module ApplicationHelper
  def format_due_date(object)
    if object.respond_to? :due_date
      date = object.due_date
    else
      date = object.calculate_due_date
    end
    format_date(date)
  end

  def format_date(date)
    date.strftime("%A, %B %e")
  end

  def format_time(date)
    date.strftime("%l:%M:%S %p")
  end
end
