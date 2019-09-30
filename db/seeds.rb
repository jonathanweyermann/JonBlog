User.destroy_all
myself = User.new(name: "Jonathan Weyermann", email: "weyermannx@gmail.com", password_hash: nil, password_salt: nil, jobmode: false, encrypted_password: "$2a$11$Yh9eVcu04X/BcAJs40.TGePMkcV6EreJcXAlH4lJqDRDa/dBiRt4i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
myself.save(:validate => false)
