module DashboardHelper
  def dashboard_header_class(_controller)
    default_class = 'nav-link block pr-2 lg:px-2 py-6 px-4 hover:text-gray-700 transition duration-150 ease-in-out border-b-2'
    active_class = 'border-indigo-700 text-indigo-700 focus:text-indigo-800 '
    inactive_class = 'border-transparent text-gray-600 focus:text-gray-700 '
    if controller_name == _controller
      active_class + default_class
    else
      inactive_class + default_class
    end
  end
end
