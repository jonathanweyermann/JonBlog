u = User.new({name: "Jonathan Weyermann", email: "weyermannx@gmail.com", password_hash: "$2a$10$XrjHVwaaliNux9yEqlFc2.vpBZoVNr7Kf6IuVnj42M0TjOwvkG7MK", password_salt: "$2a$10$XrjHVwaaliNux9yEqlFc2."})
u.save!(validate: false)
u = User.new({name: "Bob Smith", email: "chaos@gmail.com", password_hash: "$2a$10$9P.Jab4AJCIviMGdPU/3yOQS8ldjp79J6rmlALrkXYo/zxNITbada", password_salt: "$2a$10$9P.Jab4AJCIviMGdPU/3yO"})
u.save!(validate: false)

Wysiwyg.create!([
  {name: nil, post_id: nil, image: nil},
  {name: nil, post_id: nil, image: nil},
  {name: nil, post_id: nil, image: "RackMultipart20161019-18428-12fmxsd"},
  {name: nil, post_id: nil, image: "RackMultipart20161025-9019-1yexabj"},
  {name: nil, post_id: nil, image: "RackMultipart20161025-9019-96r6oq"},
  {name: nil, post_id: nil, image: "RackMultipart20161025-9019-l4dpa3"},
  {name: nil, post_id: nil, image: "RackMultipart20161025-9019-ok0ab0"},
  {name: nil, post_id: nil, image: "RackMultipart20161025-9019-yrsfp"},
  {name: nil, post_id: nil, image: "RackMultipart20161025-4014-fl7ahl"},
  {name: nil, post_id: nil, image: "RackMultipart20161026-4014-1ybjoyj"},
  {name: nil, post_id: nil, image: "RackMultipart20161026-4014-1g4d6g3"},
  {name: nil, post_id: nil, image: "RackMultipart20161026-4014-isytsc"},
  {name: nil, post_id: nil, image: "RackMultipart20161026-4014-1lngg8p"},
  {name: nil, post_id: nil, image: "RackMultipart20161026-4014-v0v71v"},
  {name: nil, post_id: nil, image: "RackMultipart20161029-4014-dsqxzi"},
  {name: nil, post_id: nil, image: "RackMultipart20161031-4014-14lp7zm"},
  {name: nil, post_id: nil, image: "RackMultipart20161127-7047-1ede6rb"}
])
