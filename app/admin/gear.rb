ActiveAdmin.register Gear do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
  permit_params :gear_type, :reg_id, :vessel_id, :missing, :missing_timestamp

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :vessel
      f.input :gear_type
      f.input :reg_id
      f.input :missing
      f.input :missing_timestamp
    end      # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
