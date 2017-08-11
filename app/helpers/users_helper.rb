module UsersHelper

  def poach_or_complete(task)
    if @user == current_user
      form_tag url_for '/tasks/' + task.id.to_s do
        hidden_field_tag 'task', task
        submit_tag "Complete this Chore!"
      end
    else
      form_for @task, as:"task" do |f|
      f.hidden_field :chore_id, value: task.chore.id
      f.hidden_field :user_id, value: current_user.id
      f.submit "Claim this Chore!"
      end
    end
  end
end
