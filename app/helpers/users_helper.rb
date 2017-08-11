module UsersHelper

  def poach_or_complete
    if @user == current_user
      form_tag url_for(:controller => 'tasks', :action => 'complete'), :method => 'post' do
      submit_tag "Complete this Chore!"
      end
    else
    end
  end
end
