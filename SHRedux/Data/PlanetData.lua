local PlanetData = {
  ["Sun"] = {
    name = "Sun Observation",
    url = nil,
    position = nil,
    scale = nil,
    has_worldtile = false,
    worldtile = nil,
    has_life = false,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 5,
      position = { -57.33, 1.13, 9.75 },
      rotation = { 0.00, 180.00, 0.00 }
    }
  },
  ["Mercury"] = {
    name = "Mercury",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956886761092/5C1E63B5B8D8706F221B0452F849472BF5D43988/",
    position = { -58.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = true,
    worldtile = {
      position = { -61.75, 1.03, 10.00 },
      tags = { "Rocky", "NotVenus" }
    },
    has_life = true,
    life = 2,
    has_explorevalue = true,
    explorevalue = {
      type = "Engineering",
      value = 6,
      position = { -60.60, 1.13, 11.60 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Venus"] = {
    name = "Venus",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956886763288/3FEEFF4E911A43B54AB2C57EAC532A4DBCCFDD0C/",
    position = { -49.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = true,
    worldtile = {
      position = { -52.75, 1.03, 10.00 },
      tags = { "Rocky", "Volcanic" }
    },
    has_life = true,
    life = 1,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 6,
      position = { -51.60, 1.13, 11.65 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Earth"] = {
    name = "Earth",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090812738370618/6A1EF27E95A33327DCC7F1B76AEF40F010F61FB9/",
    position = { -40.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = false,
    worldtile = nil,
    has_life = false,
    has_explorevalue = true,
    explorevalue = {
      type = "Biology",
      value = 3,
      position = { -42.60, 1.13, 11.55 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Mars"] = {
    name = "Mars",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891138692/648E697DE93DE3622F592CFC7BF4D57B2AEF686D/",
    position = { -31.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = true,
    worldtile = {
      position = { -34.75, 1.03, 10.00 },
      tags = { "Icy", "Rocky", "NotVenus" }
    },
    has_life = true,
    life = 12,
    has_explorevalue = true,
    explorevalue = {
      type = "Biology",
      value = 6,
      position = { -33.60, 1.13, 11.60 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Mainbelt"] = {
    name = "Main Asteroid Belt",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891144089/B922C4E4FDECC52940E07561A3530818176EBCF7/",
    position = { -22.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = true,
    worldtile = {
      position = { -25.75, 1.03, 10.00 },
      tags = { "Rocky", "NotVenus" }
    },
    has_life = true,
    life = 3,
    has_explorevalue = true,
    explorevalue = {
      type = "Engineering",
      value = 5,
      position = { -24.60, 1.13, 11.60 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Jupiter"] = {
    name = "Jupiter",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891151753/246E76C1B5FBDD5C3EE64FD336746DF72BF72406/",
    position = { -11.00, 1.03, 12.00 },
    scale = { 2.80, 1.00, 2.80 },
    has_worldtile = true,
    worldtile = {
      position = { -16.25, 1.03, 9.00 },
      tags = { "GasGiant", "SevereAtmosphere", "NotVenus" }
    },
    has_life = true,
    life = 1,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 5,
      position = { -14.90, 1.13, 10.40 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Saturn"] = {
    name = "Saturn",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891164204/080A47678F9BEB7ABBD88F07648C5BA5B0300606/",
    position = { 2.00, 1.03, 12.00 },
    scale = { 2.80, 1.00, 2.80 },
    has_worldtile = true,
    worldtile = {
      position = { -3.25, 1.03, 9.00 },
      tags = { "GasGiant", "SevereAtmosphere", "NotVenus" }
    },
    has_life = true,
    life = 2,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 5,
      position = { -1.85, 1.13, 10.40 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Uranus"] = {
    name = "Uranus",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891169863/A8D7012AFE862328776F3CB848EE85B32B27DA94/",
    position = { 14.00, 1.03, 12.00 },
    scale = { 2.25, 1.00, 2.25 },
    has_worldtile = true,
    worldtile = {
      position = { 9.50, 1.03, 9.50 },
      tags = { "GasGiant", "SevereAtmosphere", "NotVenus" }
    },
    has_life = true,
    life = 2,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 5,
      position = { 10.75, 1.13, 11.10 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Neptune"] = {
    name = "Neptune",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891181709/8EEAB55C6FBAF41301B6A1C49C4B8DDECB4122F6/",
    position = { 25.00, 1.03, 12.00 },
    scale = { 2.25, 1.00, 2.25 },
    has_worldtile = true,
    worldtile = {
      position = { 20.75, 1.03, 9.50 },
      tags = { "GasGiant", "SevereAtmosphere", "NotVenus" }
    },
    has_life = true,
    life = 2,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 7,
      position = { 21.75, 1.13, 11.10 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Kuiper"] = {
    name = "Kuiper Belt",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891188486/1F5DCBC9B13CB8BDD0B23BAA2F73B54BFABBB0D2/",
    position = { 35.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = true,
    worldtile = {
      position = { 31.25, 1.03, 10.00 },
      tags = { "Icy", "MinimalGravity", "NotVenus" }
    },
    has_life = true,
    life = 6,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 7,
      position = { 32.45, 1.13, 11.60 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  },
  ["Scattered"] = {
    name = "Scattered Disk",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891205671/9D06F158B5FE50A1895796F2A37CEF4AA313F2B2/",
    position = { 44.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = false,
    worldtile = nil,
    has_life = false,
    has_explorevalue = false,
    explorevalue = nil
  },
  ["Deep"] = {
    name = "Deep Space Astronomy",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891210795/A63D9DDC88C930B0C067A57CDAF4191FFDCE0B7A/",
    position = { 51.00, 1.03, 12.00 },
    scale = { 0.75, 1.00, 0.75 },
    has_worldtile = false,
    worldtile = nil,
    has_life = false,
    has_explorevalue = true,
    explorevalue = {
      type = "Physics",
      value = 9,
      position = { 50.30, 1.13, 11.55 },
      rotation = { 0.00, 180.00, 0.00 }
    }
  },
  ["Alpha"] = {
    name = "Alpha Centauri",
    url = "https://steamusercontent-a.akamaihd.net/ugc/1785090956891217090/24215D5F739992CD3A9C69DB4ABB80625A4EF89A/",
    position = { 58.00, 1.03, 12.00 },
    scale = { 1.78, 1.00, 1.78 },
    has_worldtile = false,
    worldtile = nil,
    has_life = true,
    life = -1,
    has_explorevalue = true,
    explorevalue = {
      type = "Research",
      value = 9,
      position = { 55.48, 1.13, 11.63 },
      rotation = { 0.00, 240.00, 0.00 }
    }
  }
}

return PlanetData
