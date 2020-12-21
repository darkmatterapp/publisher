class AddKeybaseProofSetting < ActiveRecord::Migration[4.2]
  def up
    s = Setting.new(name: 'Keybase Proof', content: '', editable: true)
    s.save(validate: false)
  end

  def down
    Setting.of('keybase_proof').destroy
  end
end
