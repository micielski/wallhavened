{
  date = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "149jknsq999gnhy865n33fkk22s0r447k76x9pmcnnwldfv2q7wp";
      type = "gem";
    };
    version = "3.3.4";
  };
  mini_portile2 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kl9c3kdchjabrihdqfmcplk3lq4cw1rr9f378y6q22qwy5dndvs";
      type = "gem";
    };
    version = "2.8.5";
  };
  minitest = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bkmfi9mb49m0fkdhl2g38i3xxa02d411gg0m8x0gvbwfmmg5ym3";
      type = "gem";
    };
    version = "5.20.0";
  };
  nokogiri = {
    dependencies = ["mini_portile2" "racc"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l8b0i24h4irivyhwy9xmkjbggw86cxkzkiqdqg0jpcp9qc8h4rl";
      type = "gem";
    };
    version = "1.16.0";
  };
  open-uri = {
    dependencies = ["stringio" "time" "uri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a4m5bd2n51ifv4qi1qf0bkkx4rb2k6zpayi98ym4i2k8b3q33n4";
      type = "gem";
    };
    version = "0.4.1";
  };
  racc = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01b9662zd2x9bp4rdjfid07h09zxj7kvn7f5fghbqhzc625ap1dp";
      type = "gem";
    };
    version = "1.7.3";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ilr853hawi09626axx0mps4rkkmxcs54mapz9jnqvpnlwd3wsmy";
      type = "gem";
    };
    version = "13.1.0";
  };
  stringio = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "063psvsn1aq6digpznxfranhcpmi0sdv2jhra5g0459sw0x2dxn1";
      type = "gem";
    };
    version = "3.1.0";
  };
  time = {
    dependencies = ["date"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c15v19hyxjcfzaviqlwhgajgyrrlb0pjilza6mkv49bhspy6av6";
      type = "gem";
    };
    version = "0.3.0";
  };
  uri = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "094gk72ckazf495qc76gk09b5i318d5l9m7bicg2wxlrjcm3qm96";
      type = "gem";
    };
    version = "0.13.0";
  };
  wallhavened = {
    dependencies = ["minitest" "nokogiri" "open-uri" "rake"];
    groups = ["default"];
    platforms = [];
    source = {
      path = ./.;
      type = "path";
    };
    version = "0.1.0";
  };
}
