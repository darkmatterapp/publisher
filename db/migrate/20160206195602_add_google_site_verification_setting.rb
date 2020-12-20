class AddGoogleSiteVerificationSetting < ActiveRecord::Migration[4.2]
  def up
    [
      ['Google Site Verification', '', true]
    ].each do |setting|
      s          = Setting.new
      s.name     = setting[0]
      s.content  = setting[1]
      s.editable = setting[2]
      s.save(validate: false)
    end
  end

  def down
    Setting.of('google_site_verification').destroy
  end
end
