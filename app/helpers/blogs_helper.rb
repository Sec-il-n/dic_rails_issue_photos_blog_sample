module BlogsHelper
   def choose_new_or_edit
     if action_name == 'show'|| action_name == 'create'
     # if action_name == 'new'|| action_name == 'create'
       confirm_blogs_path
     elsif action_name == 'edit'
       blog_path
     end
   end
end