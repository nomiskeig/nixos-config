{
	config, privateData, ...
}: {
	programs.git = {
	enable = true;
	userName = "${privateData.gitName}";
	userEmail = "${privateData.gitEmail}";
    extraConfig = {
        init = {
            defaultBranch = "main";
        };
    };
};
}
