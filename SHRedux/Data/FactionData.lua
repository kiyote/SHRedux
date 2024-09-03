local FactionTokensAsia = require("SHRedux/Data/FactionTokensAsia")
local FactionTokensChina = require("SHRedux/Data/FactionTokensChina")
local FactionTokensEurope = require("SHRedux/Data/FactionTokensEurope")
local FactionTokensJapan = require("SHRedux/Data/FactionTokensJapan")
local FactionTokensNorthAmerica = require("SHRedux/Data/FactionTokensNorthAmerica")
local FactionTokensRussia = require("SHRedux/Data/FactionTokensRussia")
local FactionTokensSouthAmericaAfrica = require("SHRedux/Data/FactionTokensSouthAmericaAfrica")

local FactionData = {
  ["faction_Asia"] = {
    name = "Asia",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757719482438/C4EEF0B14D44F5F6226C4D6957FB5A18F3AC080E/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725127024/4E35875A60AD4F050770F85DDAAA5504A188AE15/",
    tokens = FactionTokensAsia,
    start_cash = 25,
    start_technology = { "technology_CrewVehicles" },
    start_policy = { "policy_SpaceEconomics" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642501/9F70DF07271BC1BA63DB46292D2A74352101B920/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837641451/3FDB4E38AA8E4B9A211D29CBDEC9CDCE1C02C732/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644306/B28B30378C2399C0F8FC383A34F4B0E12BD307CD/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837643291/A88A08A8471BF78F45A2E8EBD60F083FF942B5EB/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645694/20F77B46427704F7A8896714BA3250920C29DF8D/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644830/22E58770991F4477F6C20DB51C98F11F63A57F02/"
      }
    }
  },
  ["faction_China"] = {
    name = "China",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757719484142/3F0E205FA09967F69C38FA7F74A6D39173DC9C80/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725128830/AE1E579B04CB497596E67C140BA171554E5333ED/",
    tokens = FactionTokensChina,
    start_cash = 27,
    start_technology = { "technology_OrbitalRendezvous", "technology_CrewVehicles" },
    start_policy = { "policy_MilitaryPolicy" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642740/22EC1D4E697EE8A9541F203FB1127AFC50954F50/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837641597/53180A48D345085A1520975D371CE2DD378CA636/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644384/035DBB5C77DABE210E1AB4F4DC76E647D1EAF586/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837643583/C463805FB809789D3D785D1F6F4FF8F84891A4F5/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645756/EAC73BE86804B5C7A28757E0804AC7DAD5B615C9/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644953/9E562EA0716DCFC3741057217C97D66BFF7DAC96/"
      }
    }
  },
  ["faction_Europe"] = {
    name = "Europe",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757719485185/7BC8B6F73A7D4924500282F8DDE9F374781E5ECA/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725130846/ABFC66AEE8486AC63A5BCAEDCE97346C0099F24C/",
    tokens = FactionTokensEurope,
    start_cash = 30,
    start_technology = { "technology_IonEngines" },
    start_policy = { "policy_SpaceDiplomacy" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642841/96A6BFCCF0B17D62255E425566F7316ED2AEF3DD/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837641699/9C0CE17F03FC50E04BB3E74CBBE1EDB0E8D6CED2/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644461/2B9A1C0B6303931D8C97E60D6035896AFB0E9AAE/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837643682/2E706A8A9B85C055342D6FC675AFD8A70F0CB3DF/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645856/51E84751596A230AAFDAB10B44663B234A97FBFE/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645044/9FF731EE2C714A72DCC1D213F10918CAFFD66E7E/"
      }
    }
  },
  ["faction_Japan"] = {
    name = "Japan",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757719486034/7A8D6D4ED4F4053C19CFECC1451DEC833921BB17/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725132248/89DBE63CAFCB9E132EBB0F9F612FDEE93C9E4B1F/",
    tokens = FactionTokensJapan,
    start_cash = 28,
    start_policy = { "policy_RoboticPolicy" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642900/1FD2DBDF3F4F10D48F6B84706EE2409964A72724/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837641950/4F5F2D7ECD6831D587925ABCCA91D6129CAF78ED/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644528/16DE2C955E8C3973E9DBE2059EA0780E645BB396/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837643738/448D6D6D2F0C6C0465ECFA1652226203B409833F/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645973/2A7062A16F06141E2324A8EA4181BDE9959AA46D/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645192/E58B6F76676570EBE1D38F049B33BB6B08FA2DF8/"
      }
    }
  },
  ["faction_NorthAmerica"] = {
    name = "North America",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785090812738328553/529ACEDF221C8B904B8D9843CF521504FECC7D1F/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725134137/A50F922931CAFEB4EBBB84065CEF1FD06857AE1F/",
    tokens = FactionTokensNorthAmerica,
    start_cash = 20,
    start_technology = { "technology_ImprovedSpaceSuits", "technology_OrbitalRendezvous", "technology_IonEngines", "technology_CrewVehicles", "technology_ReusableLaunchVehicles", "technology_SpaceMissiles", "technology_AdvancedAstrodynamics" },
    start_policy = { "policy_SpaceEconomics" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642982/ADF3BCC7EBD0A5435D84A3B5B39F8C0F4660520F/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642049/6B5E963A112886FCEB6EE0D358D68BA18C3199AE/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644593/96F87FD914AB4D7DE6E377BE9789395A531024C5/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644001/8E0B8A49AEF7558B25D8E0B22D6296F069DC2E70/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837646034/3EE0D016BC37A275C4487DC60A9D9B1477A1E1A8/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645305/C53C58CA9F29AAE0E1FB7BB4BB8A8EAE96C415DB/"
      }
    }
  },
  ["faction_Russia"] = {
    name = "Russia",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757719487039/38D6C931D260A8888A3DB54D3FA51146522C12BC/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725135387/F14D6D4A1C68A0D4AF619738AF67542889F4939D/",
    tokens = FactionTokensRussia,
    start_cash = 30,
    start_technology = { "technology_ImprovedSpaceSuits", "technology_OrbitalRendezvous", "technology_IonEngines", "technology_CrewVehicles", "technology_SpaceMissiles" },
    start_policy = { "policy_HumanPolicy" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837643135/A4ED1C2E71C6B521C84DA713FD4C9E73BE90E20A/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642317/2DED118BCF667883C2F30DD4357A49D5DC182623/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644653/766624974FAD9D5365E866E4C2E37F64B4009183/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644149/DA9E9F2D615921045D69F8B03A4274D2CB822743/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837646103/769A785B1C332D640C52EFBBFB719CF97E8EC886/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645370/B45C0847B271278D7411CC302F08EC7DF9620AEA/"
      }
    }
  },
  ["faction_SouthAmericaAfrica"] = {
    name = "South America & Africa",
    playerboard_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757719474211/B9DC2C640D9E77728AFD2C277110837C272E36C7/",
    flag_url = "https://steamusercontent-a.akamaihd.net/ugc/1785091757725136684/ABD79F60F57C5645B22675FE20F91B9CAAE954CC/",
    tokens = FactionTokensSouthAmericaAfrica,
    start_cash = 26,
    start_policy = { "policy_SpaceDiplomacy" },
    research = {
      biology = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837643225/1CD6FB703BBA29E467BDF3B2F3F6F6847C3E1DB9/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837642431/8B9D8DC2AA30619E5388A62900D65A8FC2D95C51/"
      },
      engineering = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644735/B24A730A39E69EB44AF7AEBE7172697303AB6A76/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837644229/4FF0D44D70A87B5E77C2900C82840799C7FA8387/"
      },
      physics = {
        top_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837646173/FEE51ECA83421D1E2FD3CBA6E78955992BC2D5EB/",
        bottom_url = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837645599/29049B7C8ED41A9CF183BDD549EDE10754B9023D/"
      }
    }
  }
}

return FactionData