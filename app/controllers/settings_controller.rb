class SettingsController < ApplicationController

  def show
    @setting = Setting.first_or_create
  end

  def update
    @setting = Setting.first_or_create
    @setting.update(settings_params)
  end

  private

  def settings_params
    params.require(:setting).permit(:display_result)
  end

end
