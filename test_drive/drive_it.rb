# given a User class with a roles_mask attribute
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'role_model'

class User
  include RoleModel

  attr_accessor :roles_mask  

  roles_attribute :roles_mask        

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!  
  roles :admin, :manager, :author    
end

u = User.new

# which roles may I assign?

puts u.class.valid_roles.inspect

# Assign some roles!

u.roles = [:admin]  # ['admin'] works as well

u.roles << :manager

# Give me the list of roles assigned

puts u.roles.to_a.inspect

# And what is the role mask ?

puts u.roles_mask

# Does the user have ANY of these roles?

# if user u has a role :author ?
puts u.has_role? :author

# does he have the author role ?

puts u.has? :author

# Does the user have ALL of these roles?

puts u.has_roles? :author, :manager

# is he both an author AND a manager?
puts u.is? :author, :manager

