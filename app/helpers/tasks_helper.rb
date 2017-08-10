module TasksHelper
  def format_due_date(object)
    calculate_due_date(object).strftime("%A, %B %e")
  end
end
