class AddTimezoneSettingRecords < ActiveRecord::Migration[4.2]
  def up
    s = Setting.new(
      name: 'Timezone (GMT Offset)',
      content: '',
      editable: true
    )
    s.save(validate: false)
  end

  def down
    Setting.of('timezone_gmt_offset').destroy
  end
end
