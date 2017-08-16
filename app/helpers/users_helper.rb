module UsersHelper

  def poach_or_complete(task)
    if task.user == current_user
      form_for task do |f|
        f.submit "Complete this Chore!"
      end
    else
      form_for @task do |f| #form_for @task, as:"task" do |f|
      f.hidden_field [:chore_id], value: task.chore.id
      f.hidden_field [:user_id], value: current_user.id
      f.submit "Claim this Chore!"
      end
    end
  end
end
