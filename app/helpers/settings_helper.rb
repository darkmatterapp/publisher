module SettingsHelper
  def setting(key)
    Setting.where(slug: key).first.try(:content)
  end
end
