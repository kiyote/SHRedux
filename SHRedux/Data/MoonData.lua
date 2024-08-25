local MoonData = {
  ["Near"] = {
    name = "Near Earth Asteroids",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892095250/17B77891D393BF48A612139F2AD7F0D0C56B65F8/",
    position = { -41.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { -41.50, 1.03, 5.00 },
      tags = { "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 3,
    explorevalue = {
      type = "Engineering",
      value = 4,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -42.25, 1.13, 6.86 }
    }
  },
  ["Luna"] = {
    name = "Luna",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891283055/D843AAEE788C9495E3B2A02437670C16F2A15079/",
    position = { -38.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { -38.50, 1.03, 5.00 },
      tags = { "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 2,
    explorevalue = {
      type = "Engineering",
      value = 4,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -39.25, 1.13, 6.86 }
    }
  },
  ["Comet"] = {
    name = "Comet",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892120624/3AF22177C72990AFA93FCC66B84F4B60340CBFA2/",
    position = { -32.50, 1.03, 7.25 },
    has_worldtile = false,
    worldtile = nil,
    has_life = true,
    life = 4,
    explorevalue = {
      type = "Physics",
      value = 4,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -33.25, 1.13, 6.86 }
    }
  },
  ["Phobos"] = {
    name = "Phobos - Deimos",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892121864/A2EA7F5BF48DB694B5ADCC6E3D9EFA29CDA4A2FF/",
    position = { -29.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { -29.50, 1.03, 5.00 },
      tags = { "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 2,
    explorevalue = {
      type = "Engineering",
      value = 4,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -30.25, 1.13, 6.86 }
    }
  },
  ["Ceres"] = {
    name = "Ceres",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892161536/1FE126951430D96E6FC551E0A6AFB4826EECE7C8/",
    position = { -25, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { -25, 1.03, 5.00 },
      tags = { "Icy", "MinimalGravity", "NotVenus" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Biology",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -25.75, 1.13, 6.86 }
    }
  },
  ["Hygeia"] = {
    name = "Hygeia - Pallas",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892162590/FE2A72DB3DEE63554FCD71C16913A059B5BFADAC/",
    position = { -22.00, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { -22, 1.03, 5.00 },
      tags = { "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 3,
    explorevalue = {
      type = "Engineering",
      value = 4,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -22.75, 1.13, 6.86 }
    }
  },
  ["Vesta"] = {
    name = "Vesta",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892163572/3298241553BF65CCD19CB00FFAB0B9BE04EE4EB9/",
    position = { -19, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { -19.00, 1.03, 5.00 },
      tags = { "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 3,
    explorevalue = {
      type = "Engineering",
      value = 4,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -19.75, 1.13, 6.86 }
    }
  },
  ["Trojans"] = {
    name = "Trojans & Greeks",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785091367470009511/F5E2DA8957537AD1A7B26177395CE326143A424D/",
    position = { -14.00, 1.03, 5.50 },
    has_worldtile = true,
    worldtile = {
      position = { -14.00, 1.03, 3.25 },
      tags = { "Icy", "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 4,
    explorevalue = {
      type = "Engineering",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -14.75, 1.13, 5.12 }
    }
  },
  ["Io"] = {
    name = "Io",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892202929/7892CC942B3EFD49A8A1E7F89F245AAFAF6B6656/",
    position = { -11.00, 1.03, 5.50 },
    has_worldtile = true,
    worldtile = {
      position = { -11.00, 1.03, 3.25 },
      tags = { "Rocky", "Volcanic", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 4,
    explorevalue = {
      type = "Physics",
      value = 7,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -11.75, 1.13, 5.12 }
    }
  },
  ["Europa"] = {
    name = "Europa",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892203813/8F6E18BBCA2339FE2DEE49B8ABA0767B7B23C5F5/",
    position = { -8.00, 1.03, 5.50 },
    has_worldtile = true,
    worldtile = {
      position = { -8.00, 1.03, 3.25 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 14,
    explorevalue = {
      type = "Biology",
      value = 7,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -8.75, 1.13, 5.12 }
    }
  },
  ["Ganymede"] = {
    name = "Ganymede",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892204925/4A3AE865A0E267E0C5195E3E4D7C19D66CDB0A46/",
    position = { -12.50, 1.03, 1.00 },
    has_worldtile = true,
    worldtile = {
      position = { -12.50, 1.03, -1.13 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Physics",
      value = 6,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -13.25, 1.13, 0.65 }
    }
  },
  ["Callisto"] = {
    name = "Callisto",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892205766/B01FFEB6F6712DBEF537D3F563B53F7DED07391C/",
    position = { -9.50, 1.03, 1.00 },
    has_worldtile = true,
    worldtile = {
      position = { -9.50, 1.03, -1.13 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 6,
    explorevalue = {
      type = "Biology",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -10.25, 1.13, 0.65 }
    }
  },
  ["Mimas"] = {
    name = "Mimas - Enceladus - Tethys",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892243748/FB42C87EA56FCA1D325D02EFB6FB7E07B1B1AA4D/",
    position = { 0.50, 1.03, 5.50 },
    has_worldtile = true,
    worldtile = {
      position = { 0.50, 1.03, 3.25 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 9,
    explorevalue = {
      type = "Biology",
      value = 7,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -0.25, 1.13, 5.13 }
    }
  },
  ["Dione"] = {
    name = "Dione - Rhea",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892244603/D7E238856B6EA855B7206E14A6AF5ED1DAA6117E/",
    position = { 3.50, 1.03, 5.50 },
    has_worldtile = true,
    worldtile = {
      position = { 3.50, 1.03, 3.25 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Engineering",
      value = 6,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 2.79, 1.13, 5.13 }
    }
  },
  ["Titan"] = {
    name = "Titan",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892245535/30AA18BA435202DBBCECFB7E049A0A171AD81E26/",
    position = { 0.50, 1.03, 1.00 },
    has_worldtile = true,
    worldtile = {
      position = { 0.50, 1.03, -1.13 },
      tags = { "Icy", "Rocky", "Volcanic", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 9,
    explorevalue = {
      type = "Biology",
      value = 8,
      rotation = { 0.00, 180.00, 0.00 },
      position = { -0.25, 1.13, 0.65 }
    }
  },
  ["Hyperion"] = {
    name = "Hyperion - Iapetus",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892246417/6C44BACD1AD41CB9E5A28FB8F5358A5F6D739B54/",
    position = { 3.50, 1.03, 1.00 },
    has_worldtile = true,
    worldtile = {
      position = { 3.50, 1.03, -1.13 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 4,
    explorevalue = {
      type = "Engineering",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 2.75, 1.13, 0.65 }
    }
  },
  ["Chariklo"] = {
    name = "Chariklo",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892247630/E41DBED19AA541683252B999048DFA225D42D635/",
    position = { 11.00, 1.03, 6.50 },
    has_worldtile = true,
    worldtile = {
      position = { 11.00, 1.03, 4.25 },
      tags = { "Icy", "MinimalGravity", "NotVenus" }
    },
    has_life = true,
    life = 4,
    explorevalue = {
      type = "Physics",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 10.25, 1.13, 6.15 }
    }
  },
  ["Oberon"] = {
    name = "Oberon - Titania",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892248912/C16676F8657F27ADC6518C30F86915E5744333FA/",
    position = { 14.00, 1.03, 6.50 },
    has_worldtile = true,
    worldtile = {
      position = { 14.00, 1.03, 4.25 },
      tags = { "Icy", "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Engineering",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 13.25, 1.13, 6.15 }
    }
  },
  ["Umbriel"] = {
    name = "Umbriel - Ariel - Miranda",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892250170/8DF21EB2D7460B32027561ABB74B383A9F589842/",
    position = { 17.00, 1.03, 6.50 },
    has_worldtile = true,
    worldtile = {
      position = { 17.00, 1.03, 4.25 },
      tags = { "Icy", "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 4,
    explorevalue = {
      type = "Engineering",
      value = 5,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 16.25, 1.13, 6.15 }
    }
  },
  ["Triton"] = {
    name = "Triton",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892252072/9619B6AFA6CAB1CE44D6E8D9FD840E0F9549411F/",
    position = { 23.50, 1.03, 6.50 },
    has_worldtile = true,
    worldtile = {
      position = { 23.50, 1.03, 4.25 },
      tags = { "Icy", "Volcanic", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 7,
    explorevalue = {
      type = "Physics",
      value = 7,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 22.75, 1.13, 6.15 }
    }
  },
  ["Galatea"] = {
    name = "Galatea - Larissa - Proteus",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892253801/1777344548D37F50944B7EE0025EAD9EC77DFBF7/",
    position = { 26.50, 1.03, 6.50 },
    has_worldtile = true,
    worldtile = {
      position = { 26.50, 1.03, 4.25 },
      tags = { "Rocky", "MinimalGravity", "NotVenus", "RockyMinimalGravity" }
    },
    has_life = true,
    life = 3,
    explorevalue = {
      type = "Engineering",
      value = 6,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 25.75, 1.13, 6.15 }
    }
  },
  ["Haumea"] = {
    name = "Haumea - Makemake",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892255834/EBA94552890F67E88CFDDE05E4DB45FAD5A47443/",
    position = { 33.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { 33.50, 1.03, 5.00 },
      tags = { "Icy", "Rocky", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 6,
    explorevalue = {
      type = "Physics",
      value = 7,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 32.75, 1.13, 6.90 }
    }
  },
  ["Pluto"] = {
    name = "Pluto - Charon",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892257276/5D1285E0DDC6D61D349C2B3D2E5D84FFFD4DF875/",
    position = { 36.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { 36.50, 1.03, 5.00 },
      tags = { "Icy", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Physics",
      value = 8,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 35.75, 1.13, 6.90 }
    }
  },
  ["Sedna"] = {
    name = "Sedna",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892259028/3F74A5C349C1AF26986FC309D04B5F47AB7306B2/",
    position = { 42.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { 42.50, 1.03, 5.00 },
      tags = { "Icy", "MinimalGravity", "NotVenus" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Physics",
      value = 8,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 41.75, 1.13, 6.90 }
    }
  },
  ["Eris"] = {
    name = "Eris & Dysnomia",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956892260554/5CBA2A9ACE460C56AA8F1A0F9F74912478BB08FF/",
    position = { 45.50, 1.03, 7.25 },
    has_worldtile = true,
    worldtile = {
      position = { 45.50, 1.03, 5.00 },
      tags = { "Icy", "LowGravity", "NotVenus" }
    },
    has_life = true,
    life = 5,
    explorevalue = {
      type = "Physics",
      value = 9,
      rotation = { 0.00, 180.00, 0.00 },
      position = { 44.75, 1.13, 6.90 }
    }
  }
}

return MoonData
