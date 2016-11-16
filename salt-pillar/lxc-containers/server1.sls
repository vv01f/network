containers:
  pub-gw:
    interfaces:
      core:
        type: veth
        gw: anon1
      pub:
        type: phys

  serv-gw:
    interfaces:
      core:
        type: veth
        gw: upstream1
      serv:
        type: veth

  priv1-gw:
    interfaces:
      core:
        type: veth
        gw: upstream1

  priv2-gw:
    interfaces:
      core:
        type: veth
        gw: upstream1

  upstream1:
    interfaces:
      core:
        type: veth
      up1:
        type: phys

  upstream2:
    interfaces:
      core:
        type: veth
      up2:
        type: phys

  anon1:
    interfaces:
      core:
        type: veth
