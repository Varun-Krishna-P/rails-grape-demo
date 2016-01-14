#http://www.sitepoint.com/build-great-apis-grape/
#http://www.sitepoint.com/build-great-apis-grape/
module Employee
	class Data < Grape::API
		resource :employee_data do
			desc "List All Employee"
			get do
				EmpData.all
			end
			desc "Create new employee"
			params do
				requires :name, type: String
				requires :address, type: String
				requires :age, type: Integer
			end
			post do
				EmpData.create({
					name: params[:name],
					address: params[:address],
					age: params[:age]
				})
			end
			desc "Deletes an employee"
			params do
				requires :id, type: String
			end
			delete ":id" do
				EmpData.find(params[:id]).destroy
			end
			desc "Update an employee address"
			params do
				requires :id, type: String
				requires :address, type: String
			end
			put ":id" do
				EmpData.find(params[:id]).update_attributes({
					address: params[:address]
				})
			end
		end
	end
end