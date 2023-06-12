{config, pkgs, libs, ...}:

{
	# i18n.defaultLocale = "zh_CN.UTF-8";

	i18n.inputMethod = {
		# enabled = "fcitx5";
		# fcitx5.addons = with pkgs; [
		# 	fcitx5-rime
		# 	fcitx5-chinese-addons
		# ];

		enabled = "ibus";
		ibus.engines = with pkgs.ibus-engines; [
			libpinyin
			rime
		];
	};
}
