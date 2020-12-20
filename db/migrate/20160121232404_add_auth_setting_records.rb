class AddAuthSettingRecords < ActiveRecord::Migration[4.2]
  def up
    [
      ['Syndication Twitter Key', '', true],
      ['Syndication Twitter Secret', '', true],
    ].each do |setting|
      s          = Setting.new
      s.name     = setting[0]
      s.content  = setting[1]
      s.editable = setting[2]
      s.save(validate: false)
    end
  end

  def down
    Setting.of('syndication_twitter_key').destroy
    Setting.of('syndication_twitter_secret').destroy
  end
end
